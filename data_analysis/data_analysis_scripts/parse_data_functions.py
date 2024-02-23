import plotly


import csv

def parse_tf_csv(file_path, child_frame_ids):
    data = {child_frame_id: {} for child_frame_id in child_frame_ids}
    with open(file_path, 'r') as csv_file:
        csv_reader = csv.reader(csv_file)
        for row in csv_reader:
            try:
                timestamp = int(row[0])
                child_frame_id = row[3]
                if child_frame_id in child_frame_ids:
                    data[child_frame_id][timestamp] = {
                        'frame_id': row[2],
                        'x': float(row[4]),
                        'y': float(row[5]),
                        'z': float(row[6]),
                        'qx': float(row[7]),
                        'qy': float(row[8]),
                        'qz': float(row[9]),
                        'qw': float(row[10]),
                    }
            except:
                print(f"Error parsing line '{row}'")
    return data
def parse_rigid_bodies_csv(filepath, rigid_body_ids):
    data = {rigid_body_id: {} for rigid_body_id in rigid_body_ids}
    with open(filepath, 'r') as csv_file:
        csv_reader = csv.reader(csv_file)
        for row in csv_reader:
            try:
                timestamp = int(row[0])
                frame_id = row[1]
                frame_number = row[2]
                # TODO: Write something that will parse the RigidBody message up to 3x
                # * https://github.com/MOCAP4ROS2-Project/mocap4r2_msgs/blob/iron-devel/msg/RigidBody.msg
                # TODO: WRite something that will handle multiple rigid bodies in a line
                # TODO: Write something that will handle duplicates
            except:
                print(f"Error parsing line '{row}'")
    return data

def parse_pose_line(input):
    # TODO: Implement something that can help to parse a line of pose csv for use in the parse_rigid_bodies_csv functiono
    pass
file_path = '/home/will/drl_swarm/data_analysis/trial1/tf.csv'
child_frame_ids = ['base_link', 'odom', 'crazyflie_flowdeck', 'lighthouse_link', 'rocks']
parsed_data = parse_tf_csv(file_path, child_frame_ids)