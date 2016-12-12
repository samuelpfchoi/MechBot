rclose all; clear; clc

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
delay = 0.02;            % Delay between each iteration of movement
addpath('../CSV Files');
moveCycle_left = [ csvread('Left_ft_movement.csv'), ...
                   csvread('Left_ft_movement2.csv'), ...
                   csvread('Left_ft_movement3.csv'), ...
                   csvread('RebalanceLR.csv') ];
moveCycle_right = [ moveCycle_left(1, :);
                    moveCycle_left(5, :);
                    moveCycle_left(6, :);
                    moveCycle_left(7, :);
                    moveCycle_left(2, :);
                    moveCycle_left(3, :);
                    moveCycle_left(4, :)];
                   
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
dest_pos_base = [-pi/2-moveCycle_left(2, 1), ...
                 pi/3-moveCycle_left(3, 1), ...
                 -pi/6+moveCycle_left(4, 1), ...
                 pi/2+moveCycle_left(5, 1), ...
                 -pi/3+moveCycle_left(6, 1), ...
                 pi/6-moveCycle_left(7, 1)];                   % destination position
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

move_length = 3*size(moveCycle_left, 2)/4;
rebalance_length = size(moveCycle_left, 2)/4;
for k = 1:20
    for i = 1:move_length
        % Set the left leg's angles
        dest_pos_base = [-pi/2-moveCycle_left(2, i), ...
                         pi/3-moveCycle_left(3, i), ...
                         -pi/6+moveCycle_left(4, i), ...
                         pi/2+moveCycle_left(5, i), ...
                         -pi/3+moveCycle_left(6, i), ...
                         pi/6-moveCycle_left(7, i)];                    % destination position
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

    %input('press <enter> to move to double-legged phase')

    for i = (move_length + 1):(move_length + rebalance_length);
        % Set the left leg's angles
        dest_pos_base = [-pi/2-moveCycle_left(2, i), ...
                         pi/3-moveCycle_left(3, i), ...
                         -pi/6+moveCycle_left(4, i), ...
                         pi/2+moveCycle_left(5, i), ...
                         -pi/3+moveCycle_left(6, i), ...
                         pi/6-moveCycle_left(7, i)];                   % destination position
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
        dest_pos_base = [-pi/2-moveCycle_right(2, i), ...
                         pi/3-moveCycle_right(3, i), ...
                         -pi/6+moveCycle_right(4, i), ...
                         pi/2+moveCycle_right(5, i), ...
                         -pi/3+moveCycle_right(6, i), ...
                         pi/6-moveCycle_right(7, i)];                    % destination position
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

    for i = (move_length + 1):(move_length + rebalance_length)
        % Set the left leg's angles
        dest_pos_base = [-pi/2-moveCycle_right(2, i), ...
                         pi/3-moveCycle_right(3, i), ...
                         -pi/6+moveCycle_right(4, i), ...
                         pi/2+moveCycle_right(5, i), ...
                         -pi/3+moveCycle_right(6, i), ...
                         pi/6-moveCycle_right(7, i)];                    % destination position
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
end