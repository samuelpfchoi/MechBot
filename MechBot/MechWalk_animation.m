close all; clear; clc

addpath('../CSV Files');
lfoot_mvmt_alphas = csvread('Left_ft_movement.csv');
lfoot_mvmt2_alphas = csvread('Left_ft_movement2.csv');
lfoot_mvmt3_alphas = csvread('Left_ft_movement3.csv');
lr_rebalance_alphas = csvread('RebalanceLR.csv');

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

bot = Mechbot([moveCycle_left(2, 1); moveCycle_left(3, 1); moveCycle_left(4, 1)], ...
              [moveCycle_left(5, 1); moveCycle_left(6, 1); moveCycle_left(7, 1)]);
          
move_length = size(lfoot_mvmt_alphas, 2) + size(lfoot_mvmt2_alphas, 2) + ...
                                    size(lfoot_mvmt3_alphas, 2);
rebalance_length = size(lr_rebalance_alphas, 2);
         
bot.display('right');

figure(1); hold on
h = plot(NaN, NaN);                 % Initialize plot
axis([-15, 45, -7, 35]);            % Set up axes
%axis([-20, 10, -30, 5]);            % Set up axes
for i = 1:move_length
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], moveCycle_left(1, i));
    bot.a1 = SE2([bot.l1; 0], moveCycle_left(2, i));
    bot.a2 = SE2([bot.l2; 0], moveCycle_left(3, i));
    bot.a3 = SE2([bot.l3; 0], moveCycle_left(4, i));
    bot.b1 = SE2([bot.l1; 0], moveCycle_left(5, i));
    bot.b2 = SE2([bot.l2; 0], moveCycle_left(6, i));
    bot.b3 = SE2([bot.l3; 0], moveCycle_left(7, i));
    bot.setLinkCoMs();
    display(bot, 'right');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
bot.pose('right');

for i = (move_length + 1):(move_length + rebalance_length)
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], moveCycle_left(1, i));
    bot.a1 = SE2([bot.l1; 0], moveCycle_left(2, i));
    bot.a2 = SE2([bot.l2; 0], moveCycle_left(3, i));
    bot.a3 = SE2([bot.l3; 0], moveCycle_left(4, i));
    bot.b1 = SE2([bot.l1; 0], moveCycle_left(5, i));
    bot.b2 = SE2([bot.l2; 0], moveCycle_left(6, i));
    bot.b3 = SE2([bot.l3; 0], moveCycle_left(7, i));
    bot.setLinkCoMs();
    display(bot, 'left');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
%bot.pose('left');

for i = 1:move_length
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], moveCycle_right(1, i));
    bot.a1 = SE2([bot.l1; 0], moveCycle_right(2, i));
    bot.a2 = SE2([bot.l2; 0], moveCycle_right(3, i));
    bot.a3 = SE2([bot.l3; 0], moveCycle_right(4, i));
    bot.b1 = SE2([bot.l1; 0], moveCycle_right(5, i));
    bot.b2 = SE2([bot.l2; 0], moveCycle_right(6, i));
    bot.b3 = SE2([bot.l3; 0], moveCycle_right(7, i));
    bot.setLinkCoMs();
    display(bot, 'left');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
bot.pose('left');

for i = (move_length + 1):(move_length + rebalance_length)
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], moveCycle_right(1, i));
    bot.a1 = SE2([bot.l1; 0], moveCycle_right(2, i));
    bot.a2 = SE2([bot.l2; 0], moveCycle_right(3, i));
    bot.a3 = SE2([bot.l3; 0], moveCycle_right(4, i));
    bot.b1 = SE2([bot.l1; 0], moveCycle_right(5, i));
    bot.b2 = SE2([bot.l2; 0], moveCycle_right(6, i));
    bot.b3 = SE2([bot.l3; 0], moveCycle_right(7, i));
    bot.setLinkCoMs();
    display(bot, 'right');              % Plot the robot
    pause(0.06);                     % Pause for one second
end

for i = 1:move_length
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], moveCycle_left(1, i));
    bot.a1 = SE2([bot.l1; 0], moveCycle_left(2, i));
    bot.a2 = SE2([bot.l2; 0], moveCycle_left(3, i));
    bot.a3 = SE2([bot.l3; 0], moveCycle_left(4, i));
    bot.b1 = SE2([bot.l1; 0], moveCycle_left(5, i));
    bot.b2 = SE2([bot.l2; 0], moveCycle_left(6, i));
    bot.b3 = SE2([bot.l3; 0], moveCycle_left(7, i));
    bot.setLinkCoMs();
    display(bot, 'right');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
bot.pose('right');

for i = (move_length + 1):(move_length + rebalance_length)
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], moveCycle_left(1, i));
    bot.a1 = SE2([bot.l1; 0], moveCycle_left(2, i));
    bot.a2 = SE2([bot.l2; 0], moveCycle_left(3, i));
    bot.a3 = SE2([bot.l3; 0], moveCycle_left(4, i));
    bot.b1 = SE2([bot.l1; 0], moveCycle_left(5, i));
    bot.b2 = SE2([bot.l2; 0], moveCycle_left(6, i));
    bot.b3 = SE2([bot.l3; 0], moveCycle_left(7, i));
    bot.setLinkCoMs();
    display(bot, 'left');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
%bot.pose('left');

for i = 1:move_length
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], moveCycle_right(1, i));
    bot.a1 = SE2([bot.l1; 0], moveCycle_right(2, i));
    bot.a2 = SE2([bot.l2; 0], moveCycle_right(3, i));
    bot.a3 = SE2([bot.l3; 0], moveCycle_right(4, i));
    bot.b1 = SE2([bot.l1; 0], moveCycle_right(5, i));
    bot.b2 = SE2([bot.l2; 0], moveCycle_right(6, i));
    bot.b3 = SE2([bot.l3; 0], moveCycle_right(7, i));
    bot.setLinkCoMs();
    display(bot, 'left');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
bot.pose('left');

for i = (move_length + 1):(move_length + rebalance_length)
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], moveCycle_right(1, i));
    bot.a1 = SE2([bot.l1; 0], moveCycle_right(2, i));
    bot.a2 = SE2([bot.l2; 0], moveCycle_right(3, i));
    bot.a3 = SE2([bot.l3; 0], moveCycle_right(4, i));
    bot.b1 = SE2([bot.l1; 0], moveCycle_right(5, i));
    bot.b2 = SE2([bot.l2; 0], moveCycle_right(6, i));
    bot.b3 = SE2([bot.l3; 0], moveCycle_right(7, i));
    bot.setLinkCoMs();
    display(bot, 'right');              % Plot the robot
    pause(0.06);                     % Pause for one second
end