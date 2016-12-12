close all; clear; clc

%% Test Case: Command Single Motor
% Commands motor IDs 10 and 11 to identical angular positions. Both motors
% will actuate at identical speeds.

%% Pre-conditions
% Cycle power on OpenCM9.04 controller

%% Add Dynamixel_IO to classpath
MATLIBS = '../../dynamixel-master/code/matlab/Dynamixel_IO/';
addpath( MATLIBS );

%% Initialize Dynamixel_IO
dxl_io = Dynamixel_IO;  % generate instance of the Dynamixel_IO class
dxl_io.load_library();  % load library appropriate to OS (auto-detected)
dxl_io.connect(9, 1);   % connect to port 0, at 1 MBaud

LF_rev = csvread('ReverseAngles.csv');
RF_rev = [LF_rev(1);
          LF_rev(5);
          LF_rev(6);
          LF_rev(7);
          LF_rev(2);
          LF_rev(3);
          LF_rev(4)]; 
      
%% FWD tilt joint angles
motor_ids = [9, 12, 17, 22, 19, 37];

% Lock the unnecessary motors to 0, first
dest_pos_base = [0, 0, pi/4, 0, 0, pi/4];                   % destination position
dest_speed_base = dest_pos_base./1.5;    % speed

dest_pos = zeros(length(motor_ids), 1);         % array destination positions to assign for each motor ID
dest_speed = zeros(length(motor_ids), 1);       % array speeds to assign for each motor ID
for motor_index = 1:length(motor_ids)
   dest_pos(motor_index) = dest_pos_base(motor_index);
   dest_speed(motor_index) = dest_speed_base(motor_index);
end
dxl_io.set_motor_pos_speed(motor_ids, zeros(length(motor_ids), 1), dest_pos, dest_speed );

% Now set the actual motors
motor_ids = [13, 10, 7, 23, 20, 27];
input('Press <Enter> to set tilt angle');
% destination position
dest_pos_base = [-pi/2-LF_rev(2), ...
                 pi/3-LF_rev(3), ...
                 -pi/6+LF_rev(4), ...
                 pi/2+LF_rev(5), ...
                 -pi/3+LF_rev(6), ...
                 pi/6-LF_rev(7)]; 

dest_pos = zeros(length(motor_ids), 1);         % array destination positions to assign for each motor ID
dest_speed = zeros(length(motor_ids), 10);       % array speeds to assign for each motor ID
for motor_index = 1:length(motor_ids)
   dest_pos(motor_index) = dest_pos_base(motor_index);
   dest_speed(motor_index) = dest_speed_base(motor_index);
end
dxl_io.set_motor_pos_speed(motor_ids, zeros(length(motor_ids), 1), dest_pos, dest_speed );
pause(2);