import sys
import os
import ast
import argparse
import pandas as pd
import plotly.graph_objs as go
pd.options.plotting.backend = "plotly"

VICON_FILE = '/home/will/drl_swarm/data_analysis/vicon_outputs.csv'
LH_FILE = '/home/will/drl_swarm/data_analysis/lh_data.csv'
ODOM_FILE = '/home/will/drl_swarm/data_analysis/odom_data.csv'
def parse_datastamp_topic_csv(file_path, rename_args=None):
    """
    Parse a file and return a DataFrame with the parsed data.

    Args:
        file_path (str): The path to the file to be parsed.

    Returns:
        pandas.DataFrame: The parsed data in a DataFrame format.
    """
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File '{file_path}' does not exist.")
    if rename_args is not None:
        if not isinstance(rename_args, dict):
            raise ValueError(f"rename_args must be a dictionary. Got {type(rename_args)} instead.")
    time_index = "receive time"
    df_temp = pd.read_csv(file_path)
    df_temp[time_index] = pd.to_datetime(df_temp[time_index], unit='s')
    df_temp.set_index(time_index, inplace=True)
    df = df_temp.pivot_table(index = time_index, columns='topic', values='value', aggfunc='first')
    if rename_args is None:
        return df
    else:
        df.rename(columns=rename_args, inplace=True)
        return df

def simple_plot(df, graph_title: str = 'Data Plot'):
    fig = df.plot(title=graph_title, x=df.index, y=df.columns, kind='scatter')
    fig.show()
    print("Plot finished")


def plot_df(df, title_of_graph: str = 'Data Plot'):
    """
    Plots the data using Plotly library.

    Args:
        df (pandas.DataFrame): The data to be plotted.
        title_of_graphs (str, optional): The title of the graphs. Defaults to 'Data Plot'.
    """
    # Plotting
    raise NotImplementedError("This function is not yet implemented.")
    fig = go.Figure()

    # Calculate test duration
    test_duration = (df.index[-1] - df.index[0]).total_seconds()

    # Add annotation
    fig.add_annotation(
        text=f'Test Duration: {test_duration:.2f} seconds',
        showarrow=False,
        font=dict(size=12),
    )

    # Plot the data
    # for column in df.columns:
    #     if column[:3] == 'tb1':
    #         fig.add_trace(go.Scatter(x = df.index, y = df[column], mode = 'markers', yaxis = "tb1"))
            
    #     elif column[:3] == 'tb2':
    #         fig.add_trace(go.Scatter(x = df.index, y = df[column], mode = 'markers', yaxis = "tb2"))
    #     elif column[:2] == 'cf':
    #         fig.add_trace(go.Scatter(x = df.index, y = df[column], mode = 'markers', yaxis = "cf"))
    #     elif column[:4] == 'odom':

    #     elif column[:2] == 'lh':
    #         # Do something for lh columns
    #         pass
    #     else:
    #         # Handle other columns
    #         pass
    
    fig.update_layout(
        title = title_of_graph,
        xaxis = dict(
            autorange = True,
            type = 'linear',
            rangeslider = dict(
                autorange = True,
            )
        ),
    )

    fig.show()

    print(df.head())

def plot_data(data, title_of_graphs: str = 'Data Plot'):
    """
    Plots the data using Plotly library.

    Args:
        data (list): A list of dictionaries representing the data.
        title_of_graphs (str, optional): The title of the graphs. Defaults to 'Data Plot'.
    """
    data_fmt = unpack_data(data)
    x_values = data_fmt['x']
    y_values = data_fmt['y']
    z_values = data_fmt['z']
    yaw_values = data_fmt['yaw']
    time_steps = data_fmt['timestep']
    lh_x_values = data_fmt['lh_x']

    # Plotting
    fig = go.Figure()

    # Calculate test duration
    test_duration = (max(time_steps) - min(time_steps)) / 100  # Convert to seconds

    # Add annotation

    fig.add_trace(go.Scatter(x=time_steps, y=x_values, mode='markers', name='x', yaxis='y1'))
    fig.add_trace(go.Scatter(x=time_steps, y=y_values, mode='markers', name='y', yaxis = 'y2'))
    fig.add_trace(go.Scatter(x=time_steps, y=z_values, mode='markers', name='z', yaxis = 'y3'))
    fig.add_trace(go.Scatter(x=time_steps, y=yaw_values, mode='lines', name='yaw', yaxis = 'y4'))

    fig.update_traces(
        hoverinfo='name+x',
        showlegend=False
    )
    fig.update_layout(
        title=title_of_graphs,
        xaxis = dict(
            autorange=True,
            type='linear',
            rangeslider = dict(
                autorange = True,
            )
        ),
        yaxis = dict(
            anchor = 'x',
            autorange = True,
            domain = [0, 0.25],
            side = 'right',
            type = 'linear',
            showline = True,
            zeroline = True,
            title = 'X [m]'

        ),
        yaxis2 = dict(
            anchor = 'x',
            autorange = True,
            domain = [0.25, 0.5],
            side = 'right',
            type = 'linear',
            showline = True,
            zeroline = True,
            title  = 'Y [m]'
        ),
        yaxis3 = dict(
            anchor = 'x',
            autorange = True,
            domain = [0.5, 0.75],
            side = 'right',
            type = 'linear',
            showline = True,
            zeroline = True,
            title = 'Z [m]'
        ),
        yaxis4 = dict(
            anchor = 'x',
            autorange = True,
            domain = [0.75, 1],
            side = 'right',
            type = 'linear',
            showline = True,
            zeroline = True,
            title = 'Yaw [deg]'
        )
    )
    fig.add_annotation(
        text=f'Test Duration: {test_duration:.2f} seconds',
        showarrow=False,
        font=dict(size=12),
    )

    fig2 = go.Figure()
    fig2.add_trace(go.Scatter3d(x=x_values, y=y_values, z=z_values, mode='markers', name='position',
                   marker=dict(color=time_steps, colorscale='Inferno', size=5)))

    max_x = max(abs(x) for x in x_values)
    max_y = max(abs(y) for y in y_values)
    max_z = max(abs(z) for z in z_values)
    fig2.update_layout(
        title=title_of_graphs + '3D Position',

        scene=dict(
            xaxis=dict(title='X', range=[0, max_x]),
            yaxis=dict(title='Y', range=[0, max_y]),
            zaxis=dict(title='Z', range=[0, max_z])
        )
    )

    fig.show()
    fig2.show()

    if data_fmt['lh_x'] is not None:
        lh_x_values = data_fmt['lh_x']
        lh_y_values = data_fmt['lh_y']
        lh_z_values = data_fmt['lh_z']
        lh_time_steps = data_fmt['timestep']
        try:
            lh_state_estimate_err = []
            for i, x_value in enumerate(x_values):
                lh_state_estimate_err.append(get_distance(x_value, y_values[i],
                    z_values[i], lh_x_values[i], lh_y_values[i], lh_z_values[i]))
        except:
            print("Error calculating lighthouse state estimate error")

        fig3 = go.Figure()

        fig3 = go.Figure()

        fig3.add_trace(go.Scatter(x=time_steps, y=x_values, mode='markers', name='x', yaxis='y1'))
        fig3.add_trace(go.Scatter(x=lh_time_steps, y=lh_x_values, mode='markers', name='lh_x', yaxis='y1'))
        fig3.add_trace(go.Scatter(x=time_steps, y=y_values, mode='markers', name='y', yaxis = 'y2'))
        fig3.add_trace(go.Scatter(x=lh_time_steps, y=lh_y_values, mode='markers', name='lh_y', yaxis = 'y2'))
        fig3.add_trace(go.Scatter(x=time_steps, y=z_values, mode='markers', name='z', yaxis = 'y3'))
        fig3.add_trace(go.Scatter(x=lh_time_steps, y=lh_z_values, mode='markers', name='lh_z', yaxis = 'y3'))
        fig3.add_trace(go.Scatter(x=time_steps, y=lh_state_estimate_err, mode='markers', name='lh_state_estimate_error', yaxis = 'y4'))

        fig3.update_traces(
            hoverinfo='name+x',
            showlegend=False
        )
        fig3.update_layout(
            title=title_of_graphs,
            xaxis = dict(
                autorange=True,
                type='linear',
                rangeslider = dict(
                    autorange = True,
                )
            ),
            yaxis = dict(
                anchor = 'x',
                autorange = True,
                domain = [0, 0.25],
                side = 'right',
                type = 'linear',
                showline = True,
                zeroline = True,
                title = 'X [m]'

            ),
            yaxis2 = dict(
                anchor = 'x',
                autorange = True,
                domain = [0.25, 0.5],
                side = 'right',
                type = 'linear',
                showline = True,
                zeroline = True,
                title  = 'Y [m]'
            ),
            yaxis3 = dict(
                anchor = 'x',
                autorange = True,
                domain = [0.5, 0.75],
                side = 'right',
                type = 'linear',
                showline = True,
                zeroline = True,
                title = 'Z [m]'
            ),
            yaxis4 = dict(
                anchor = 'x',
                autorange = True,
                domain = [0.75, 1],
                side = 'right',
                type = 'linear',
                showline = True,
                zeroline = True,
                title = 'LH and State Estimate Error [m]'
            )
        )
        fig3.show()

def get_distance(x1, y1, z1, x2, y2, z2):
    """
    Calculates the Euclidean distance between two points in 3D space.

    Args:
        x1 (float): The x-coordinate of the first point.
        y1 (float): The y-coordinate of the first point.
        z1 (float): The z-coordinate of the first point.
        x2 (float): The x-coordinate of the second point.
        y2 (float): The y-coordinate of the second point.
        z2 (float): The z-coordinate of the second point.

    Returns:
        float: The Euclidean distance between the two points.
    """
    return ((x2 - x1)**2 + (y2 - y1)**2 + (z2 - z1)**2)**0.5

def arg_parser():
    """
    Parses command line arguments.

    Returns:
        str: The input file path.
    """
    parser = argparse.ArgumentParser(description='Reads string as filepath for plotting')
    parser.add_argument('input_file', type=str, help='Path to the file containing data')
    args = parser.parse_args()
    return args.input_file

# Example usage:
if __name__ == '__main__':
    vicon_topics = {"/rigid_bodies.rigidbodies[0].pose.position.x": "tb1_x",
                    "/rigid_bodies.rigidbodies[0].pose.position.y": "tb1_y",
                    "/rigid_bodies.rigidbodies[0].pose.position.z": "tb1_z",
                    "/rigid_bodies.rigidbodies[1].pose.position.x": "tb2_x",
                    "/rigid_bodies.rigidbodies[1].pose.position.y": "tb2_y",
                    "/rigid_bodies.rigidbodies[1].pose.position.z": "tb2_z",
                    "/rigid_bodies.rigidbodies[2].pose.position.x": "cf_x",
                    "/rigid_bodies.rigidbodies[2].pose.position.y": "cf_y",
                    "/rigid_bodies.rigidbodies[2].pose.position.z": "cf_z",}
    odom_topics = {"/odom.pose.pose.position.x": "odom_x",
                   "/odom.pose.pose.position.y": "odom_y",
                   "/odom.pose.pose.position.z": "odom_z",}
    lh_topics = {'/tf.transforms[:]{child_frame_id=="lighthouse_link"}.transform.translation.x': 'lh_x',
                 '/tf.transforms[:]{child_frame_id=="lighthouse_link"}.transform.translation.y': 'lh_y',
                 '/tf.transforms[:]{child_frame_id=="lighthouse_link"}.transform.translation.z': 'lh_z',}
    df_vicon = parse_datastamp_topic_csv(VICON_FILE, vicon_topics)
    df_lh = parse_datastamp_topic_csv(LH_FILE, lh_topics)
    df_odom = parse_datastamp_topic_csv(ODOM_FILE, odom_topics)
    tb_vicon_data = df_vicon.filter(like="tb")
    cf_vicon_data = df_vicon.filter(like="cf")
    
    simple_plot(tb_vicon_data, graph_title='Turtlebot Pos Vicon', )
    simple_plot(cf_vicon_data, graph_title='Crazyflie Pos Vicon', )
    simple_plot(df_lh, graph_title='Crazyflie Pos LH', )
    simple_plot(df_odom, graph_title='Crazyflie Pos Odom', )
    comparison_df = pd.concat([df_vicon.filter(like="cf"), df_lh], axis=1)
    print(comparison_df.head())



