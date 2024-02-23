"""
measure_distances.py

This script was written by ChatGPT and Will Graham. It is designed to measure distances in an image using matplotlib and OpenCV. 
However, it is currently not working perfectly and may need some debugging and improvements.

The script reads an image, displays it using matplotlib, and allows the user to click on two points. 
It then calculates and displays the distance between these points in both pixels and a user-defined unit.

Functions:
- calculate_distance(p1, p2): Calculates the Euclidean distance between two points.
- convert_pixels_to_unit(pixels, distance_factor): Converts a distance in pixels to a user-defined unit.
- calculate_differences(p1, p2): Calculates the absolute differences in x and y coordinates between two points.
- convert_differences_to_unit(dx_pixels, dy_pixels, distance_factor): Converts differences in x and y coordinates from pixels to a user-defined unit.
- onclick(event, ax, points, distance_factor): Handles click events. Stores the clicked point, calculates distances if there are at least two points, and displays the results.
- main(image_path, distance_factor=1.0): Reads and displays an image, and enables cursor for interactive measurements.

"""

import cv2
import matplotlib.pyplot as plt
from matplotlib.widgets import Cursor

def calculate_distance(p1, p2):
    return ((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)**0.5

def convert_pixels_to_unit(pixels, distance_factor):
    return pixels * distance_factor

def calculate_differences(p1, p2):
    dx_pixels = abs(p1[0] - p2[0])
    dy_pixels = abs(p1[1] - p2[1])
    return dx_pixels, dy_pixels

def convert_differences_to_unit(dx_pixels, dy_pixels, distance_factor):
    dx_unit = convert_pixels_to_unit(dx_pixels, distance_factor)
    dy_unit = convert_pixels_to_unit(dy_pixels, distance_factor)
    return dx_unit, dy_unit

def onclick(event, ax, points, distance_factor):
    x, y = event.xdata, event.ydata
    print(f'Clicked at pixel coordinates (x={x}, y={y})')

    # Plot a dot at the clicked position
    ax.plot(x, y, 'ro')
    plt.draw()

    # Store the clicked point
    points.append((x, y))

    # Calculate and display distance if there are at least two points
    if len(points) >= 2:
        p1, p2 = points[-2], points[-1]
        distance_pixels = calculate_distance(p1, p2)
        distance_unit = convert_pixels_to_unit(distance_pixels, distance_factor)

        dx_pixels, dy_pixels = calculate_differences(p1, p2)
        dx_unit, dy_unit = convert_differences_to_unit(dx_pixels, dy_pixels, distance_factor)

        print(f'Distance between the last two points: {distance_pixels} pixels, {distance_unit} units')
        print(f'Differences in x: {dx_pixels} pixels, {dx_unit} units')
        print(f'Differences in y: {dy_pixels} pixels, {dy_unit} units')

def main(image_path, distance_factor=1.0):
    # Read the image
    img = cv2.imread(image_path)

    # Display the image using matplotlib
    fig, ax = plt.subplots()
    ax.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))

    # Enable cursor for interactive measurements
    cursor = Cursor(ax, useblit=True, color='red', linewidth=1)

    # Store clicked points
    points = []

    # Set the callback function for mouse click events
    onclick_callback = lambda event: onclick(event, ax, points, distance_factor)
    fig.canvas.mpl_connect('button_press_event', onclick_callback)

    plt.show()

if __name__ == "__main__":
    image_path = None
    # image_path = "/home/will/helpful_python_scripts/Screenshot from 2024-01-25 09-33-12.png"
    distance_factor = None # Change this value based on your scale
    try:
        main(image_path, distance_factor)
    except:
        raise Exception("Please specify an image path and distance factor")
