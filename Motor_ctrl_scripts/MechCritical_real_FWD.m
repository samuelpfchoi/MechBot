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

LF_fwd = csvread('ForwardAngles.csv'); %Left Leg angles going forward
RF_fwd = [LF_fwd(1);    %Right Leg angles going forward
          LF_fwd(5);
          LF_fwd(6);
          LF_fwd(7);
          LF_fwd(2);
          
          LF_fwd(3);
          LF_fwd(4)];

%% FWD tilt joint angles
motor_ids = [9, 12, 17, 22, 19, 37];

% Lock the unnecessary motors to 0, first
dest_pos_base = [0, 0, pi/4, 0, 0, pi/4];                   % destination position
dest_speed_base = dest_pos_base./0.5;    % speed

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
dest_pos_base = [-pi/2-LF_fwd(2), ...
                 pi/3-LF_fwd(3), ...
                 -pi/6+LF_fwd(4), ...
                 pi/2+LF_fwd(5), ...
                 -pi/3+LF_fwd(6), ...
                 pi/6-LF_fwd(7)]; 

dest_pos = zeros(length(motor_ids), 1);         % array destination positions to assign for each motor ID
dest_speed = zeros(length(motor_ids), 1);       % array speeds to assign for each motor ID
for motor_index = 1:length(motor_ids)
   dest_pos(motor_index) = dest_pos_base(motor_index);
   dest_speed(motor_index) = dest_speed_base(motor_index);
end
dxl_io.set_motor_pos_speed(motor_ids, zeros(length(motor_ids), 1), dest_pos, dest_speed );
pause(2);
                 