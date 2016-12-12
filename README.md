# MechBot
Code from ECE 4560 (Automation and Robotics) MechBot project.

## What is this?
The MechBot project is a research-driven student project as part of the coursework for ECE 4560 (Introduction to Robotics and Automation). Driven by the [Intelligent Vision and Automation Laboratory](http://ivalab.gatech.edu/) at Georgia Tech, this project is a demonstration of planar robotic modeling and trajectory generation. The final deliverable is a robot capable of bipedal locomotion while constrained to planar movement. This project was also an exercise in rapid prototyping (3D modeling and printing)...(line truncated)...

The MechBot is a bipedal robot that has an inverted knee (similar to that of a bird). It uses six Dynamixel AX-12 servos per leg, with three of the servos locked in a static position to prevent lateral movement.


## Running our code
Our trajectory generation algorithm uses Optragen, which is available here: https://github.com/ivalab/Optragen/tree/refactor

The trajectory generation code relies on SNOPT, which has a proprietary license. 

As a result, only a static animation can be viewed (i.e., a new trajectory cannot be generated). The animation can be run by executing the MechBot/MechWalk_animation.m file.

## Demonstrations
##### In the "Videos" directory:
- "MechWalk_Optragen_trajectory.avi" is a video of the trajectory as computed by Optragen and drawn to a figure window in MATLAB.
- "MechWalk_3cycle_anmiation.avi" is a video of the full trajectory for three "walk cycles" (a left foot step and a right foot step, with the center of mass constrained to an area above the foot touching the ground).
= "MechBot_presentation_video.mp4" was produced as part of our final presentation for ECE 4560.