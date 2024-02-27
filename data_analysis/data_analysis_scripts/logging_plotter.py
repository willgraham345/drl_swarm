import sys
import os
import ast
import argparse
import pandas as pd
import plotly.graph_objs as go
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

DEFAULT_FILE = '/home/will/drl_swarm/data_analysis/vicon_outputs.csv'

def new_parse_file(file_path, topics):
        # Read the CSV file into a pandas DataFrame
    df = pd.read_csv(file_path)

    df['header.stamp'] = pd.to_datetime(df['header.stamp'], unit='s')
    df.set_index('header.stamp', inplace=True)
    print("df.head(): ", df.head())
    new_df = pd.DataFrame()
    for topic in df['topic'].unique():
        topic_df = df[df['topic'] == topic].copy()
        # print("topic_df.head(): ", topic_df.head())
        topic_df.drop(columns=['topic'], inplace=True)
        topic_df.rename(columns={'value': topic}, inplace=True)
        print("topic_df.head(): ", topic_df.head())
        new_df = pd.merge(new_df, topic_df[topic], how='outer')

    print(new_df.head())
    return df

def parse_file(filename):
    """
    Parses a file containing data in each line and returns a list of dictionaries.

    Args:
        filename (str): The path to the file.

    Returns:
        list: A list of dictionaries representing the parsed data.
    """
    parsed_data = []
    with open(filename, 'rt', encoding='utf-8') as file:
        for line in file:
            try:
                data = ast.literal_eval(line)
                if isinstance(data, dict):
                    parsed_data.append(data)
                else:
                    print(f"Line '{line.strip()}' does not represent a dictionary.")
            except:
                print(f"Error parsing line '{line.strip()}'")
    return parsed_data

def unpack_data(data_fmt):
    """
    Unpacks the data format and returns a dictionary with separate lists for each data type.

    Args:
        data_fmt (list): A list of dictionaries representing the data.

    Returns:
        dict: A dictionary with separate lists for each data type.
    """
    x_values = []
    y_values = []
    z_values = []
    yaw_values = []
    timestamp = []
    lh_x_values = []
    lh_y_values = []
    lh_z_values = []
    lh_timestamp = []
    for point in data_fmt:
        if 'stateEstimate.x' in point:
            x_values.append(point['stateEstimate.x'])
        if 'stateEstimate.y' in point:
            y_values.append(point['stateEstimate.y'])
        if 'stateEstimate.z' in point:
            z_values.append(point['stateEstimate.z'])
        if 'stateEstimate.yaw' in point:
            yaw_values.append(point['stateEstimate.yaw'])
        if 'timestamp' in point:
            timestamp = point['timestamp']
        if 'lighthouse.x' in point:
            lh_x_values.append(point['lighthouse.x'])
        if 'lighthouse.y' in point:
            lh_y_values.append(point['lighthouse.y'])
        if 'lighthouse.z' in point:
            lh_z_values.append(point['lighthouse.z'])
        if 'lh_timestamp' in point:
            lh_timestamp = point['lh_timestamp']
    timestep = list(range(len(x_values)))
    data_fmt = {"x": x_values, "y": y_values, "z": z_values, "yaw": yaw_values,
            "timestamp": timestamp, "timestep": timestep,
            "lh_x": lh_x_values, "lh_y": lh_y_values, "lh_z": lh_z_values,
            "lh_timestamp": lh_timestamp}
    return data_fmt

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
    vicon_topics = [("/rigid_bodies.rigidbodies[0].pose.position.x", "tb1_x"), 
                    ("/rigid_bodies.rigidbodies[0].pose.position.y", "tb1_y"),
                    ("/rigid_bodies.rigidbodies[0].pose.position.z", "tb1_z"),
                    ("/rigid_bodies.rigidbodies[1].pose.position.x", "tb2_x"),
                    ("/rigid_bodies.rigidbodies[1].pose.position.y", "tb2_y"),
                    ("/rigid_bodies.rigidbodies[1].pose.position.z", "tb2_z"),
                    ("/rigid_bodies.rigidbodies[2].pose.position.x", "cf_x"),
                    ("/rigid_bodies.rigidbodies[2].pose.position.y", "cf_y"),
                    ("/rigid_bodies.rigidbodies[2].pose.position.z", "cf_z"),]
    df_vicon = new_parse_file(DEFAULT_FILE, vicon_topics)