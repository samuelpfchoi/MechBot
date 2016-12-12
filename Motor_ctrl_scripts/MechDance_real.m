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
dxl_io.connect(7, 1);   % connect to port 9, at 1 MBaud

%motor_ids = [12, 13, 10, 9, 7, 17];      % list of motor IDs to command
motor_ids = [9, 12, 17, 22, 19, 37];
dxl_io.set_compliance_slope( [9, 22], 8*ones(length([9, 22]), 2) );

%% Test Case - Trajectory: Goal Position/Speed
dest_pos_base = [0, 0, pi/4, 0, 0, pi/4];                   % destination position
dest_speed_base = dest_pos_base./0.5;    % speed

dest_pos = zeros(length(motor_ids), 1);         % array destination positions to assign for each motor ID
dest_speed = zeros(length(motor_ids), 1);       % array speeds to assign for each motor ID
for motor_index = 1:length(motor_ids)
   dest_pos(motor_index) = dest_pos_base(motor_index);
   dest_speed(motor_index) = dest_speed_base(motor_index);
end

%motor_bias = dxl_io.calibrate_motor(motor_ids, 1);
input('Press <Enter> to begin goal position/speed test.\n');
% 1st arg: list of motor IDs, 2nd arg: list of joint biases, 
% 3rd arg: destination motor positions, 4th arg: motor speeds
dxl_io.set_motor_pos_speed(motor_ids, zeros(length(motor_ids), 1), dest_pos, dest_speed );


%% Next challenge: 
delay = 0.07;            % Delay between each iteration of movement
addpath('../CSV Files');
dance_1 = csvread('Dance_1.csv');
dance_2 = csvread('Dance_2.csv');
dance_3 = csvread('Dance_3.csv');
dance_4 = csvread('Dance_4.csv');
dance_5 = csvread('Dance_5.csv');
dance_6 = csvread('Dance_6.csv');

danceCycle_pt1 = [ dance_1, dance_2, dance_3, dance_4, dance_5, dance_6 ];
danceCycle_pt2 = fliplr(danceCycle_pt1);
                   
motor_ids = [13, 10, 7, 23, 20, 27];

motor_pos = dxl_io.read_present_pos_vel(motor_ids, 1, 'pos');

input('Enter to zero the robot');
dest_pos_base = [-pi/2, pi/3, pi/3, pi/2, -pi/3, -pi/3];    % destination position
dest_speed_base = dest_pos_base./0.2;    % speed

dest_pos = zeros(length(motor_ids), 1);         % array destination positions to assign for each motor ID
dest_speed = zeros(length(motor_ids), 1);       % array speeds to assign for each motor ID
    for motor_index = 1:length(motor_ids)
       dest_pos(motor_index) = dest_pos_base(motor_index);
       dest_speed(motor_index) = dest_speed_base(motor_index);
    end
dxl_io.set_motor_pos_speed(motor_ids, zeros(length(motor_ids), 1), dest_pos, dest_speed );
motor_pos = dxl_io.read_present_pos_vel(motor_ids, 1, 'pos');

pause(5);

%input('Enter first frame of single-legged phase');
dest_pos_base = [-pi/2-danceCycle_pt1(2, 1), ...
                 pi/3-danceCycle_pt1(3, 1), ...
                 -pi/6+danceCycle_pt1(4, 1), ...
                 pi/2+danceCycle_pt1(5, 1), ...
                 -pi/3+danceCycle_pt1(6, 1), ...
                 pi/6-danceCycle_pt1(7, 1)];                   % destination position
    dest_speed_base = dest_pos_base./0.2;    % speed

    dest_pos = zeros(length(motor_ids), 1);         % array destination positions to assign for each motor ID
    dest_speed = zeros(length(motor_ids), 1);       % array speeds to assign for each motor ID
    for motor_index = 1:length(motor_ids)
       dest_pos(motor_index) = dest_pos_base(motor_index);
       dest_speed(motor_index) = dest_speed_base(motor_index);
    end
    dxl_io.set_motor_pos_speed(motor_ids, zeros(length(motor_ids), 1), dest_pos, dest_speed );
    
    input('Enter single-legged phase');
    
%% Move cycles
enPointeL_length = size(dance_1, 2) + size(dance_2, 2);
enPointeR_length = size(dance_3, 2) + size(dance_4, 2);
lFoot_step_length = size(dance_5, 2) + size(dance_6, 2);

move_length = enPointeL_length + enPointeR_length + lFoot_step_length;
for i = 1:move_length
    % Set the left leg's angles
    dest_pos_base = [-pi/2-danceCycle_pt1(2, i), ...
        pi/3-danceCycle_pt1(3, i), ...
        -pi/6+danceCycle_pt1(4, i), ...
        pi/2+danceCycle_pt1(5, i), ...
        -pi/3+danceCycle_pt1(6, i), ...
        pi/6-danceCycle_pt1(7, i)];                    % destination position
    dest_speed_base = dest_pos_base./0.2;    % speed
    
    dest_pos = zeros(length(motor_ids), 1);         % array destination positions to assign for each motor ID
    dest_speed = zeros(length(motor_ids), 1);       % array speeds to assign for each motor ID
    for motor_index = 1:length(motor_ids)
        dest_pos(motor_index) = dest_pos_base(motor_index);
        dest_speed(motor_index) = dest_speed_base(motor_index);
    end
    dxl_io.set_motor_pos_speed(motor_ids, zeros(length(motor_ids), 1), dest_pos, dest_speed );
    pause(delay);
end

for i = 1:move_length
    % Set the left leg's angles
    dest_pos_base = [-pi/2-danceCycle_pt2(2, i), ...
        pi/3-danceCycle_pt2(3, i), ...
        -pi/6+danceCycle_pt2(4, i), ...
        pi/2+danceCycle_pt2(5, i), ...
        -pi/3+danceCycle_pt2(6, i), ...
        pi/6-danceCycle_pt2(7, i)];                    % destination position
    dest_speed_base = dest_pos_base./0.2;    % speed
    
    dest_pos = zeros(length(motor_ids), 1);         % array destination positions to assign for each motor ID
    dest_speed = zeros(length(motor_ids), 1);       % array speeds to assign for each motor ID
    for motor_index = 1:length(motor_ids)
        dest_pos(motor_index) = dest_pos_base(motor_index);
        dest_speed(motor_index) = dest_speed_base(motor_index);
    end
    dxl_io.set_motor_pos_speed(motor_ids, zeros(length(motor_ids), 1), dest_pos, dest_speed );
    pause(delay);
end