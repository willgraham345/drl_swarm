#!/bin/zsh
# List of topics to record
topics=("/tf" "/markers" "/odom" "/rigid_bodies")
message_types=("tf2_msgs/msg/TFMessage" "mocap_msgs/msg/Markers" "nav_msgs/msg/Odometry" "mocap_msgs/msg/RigidBodies")


# Function to clean up before exiting
cleanup() {
    echo "Cleaning up and exiting..."
    # Check if there are any background processes running
    if [[ -n "$(jobs -p)" ]]; then
        # Terminate all background processes
        kill $(jobs -p)
    fi
    exit 0
}

# Trap termination signal (Ctrl+C) to execute cleanup function
trap 'cleanup' INT

# Record each topic to a separate CSV file
for ((i=1; i<=${#topics[@]}; i++)); do
    topic="${topics[$i]}"
    message_type="${message_types[$i]}"
    echo "Recording topic: $topic"
    echo "Message type: $message_type"
    # Corrected substitution: Using single quotes for the pattern to prevent early expansion
    ros2 topic echo --csv "$topic" "$message_type" > "${topic//\//}.csv" &  # Extract messages and write to CSV
done

# Wait indefinitely until termination signal is received
wait
