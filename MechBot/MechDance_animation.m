close all; clear; clc

addpath('../CSV Files');
dance_1 = csvread('Dance_1.csv');
dance_2 = csvread('Dance_2.csv');
dance_3 = csvread('Dance_3.csv');
dance_4 = csvread('Dance_4.csv');
dance_5 = csvread('Dance_5.csv');
dance_6 = csvread('Dance_6.csv');

danceCycle_pt1 = [ dance_1, dance_2, dance_3, dance_4, dance_5, dance_6 ];
danceCycle_pt2 = fliplr(danceCycle_pt1);

bot = Mechbot([danceCycle_pt1(2, 1); danceCycle_pt1(3, 1); danceCycle_pt1(4, 1)], ...
              [danceCycle_pt1(5, 1); danceCycle_pt1(6, 1); danceCycle_pt1(7, 1)]);
          
enPointeL_length = size(dance_1, 2) + size(dance_2, 2);
enPointeR_length = size(dance_3, 2) + size(dance_4, 2);
lFoot_step_length = size(dance_5, 2) + size(dance_6, 2);
         
bot.display('right');

figure(1); hold on
title('Dance of the Mechbot');
h = plot(NaN, NaN);                 % Initialize plot
axis([-25, 30, -7, 35]);            % Set up axes
%axis([-20, 10, -30, 5]);            % Set up axes
for i = 1:enPointeL_length
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], danceCycle_pt1(1, i));
    bot.a1 = SE2([bot.l1; 0], danceCycle_pt1(2, i));
    bot.a2 = SE2([bot.l2; 0], danceCycle_pt1(3, i));
    bot.a3 = SE2([bot.l3; 0], danceCycle_pt1(4, i));
    bot.b1 = SE2([bot.l1; 0], danceCycle_pt1(5, i));
    bot.b2 = SE2([bot.l2; 0], danceCycle_pt1(6, i));
    bot.b3 = SE2([bot.l3; 0], danceCycle_pt1(7, i));
    bot.setLinkCoMs();
    display(bot, 'right');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
bot.pose('right');

for i = (enPointeL_length + 1):(enPointeL_length + enPointeR_length)
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], danceCycle_pt1(1, i));
    bot.a1 = SE2([bot.l1; 0], danceCycle_pt1(2, i));
    bot.a2 = SE2([bot.l2; 0], danceCycle_pt1(3, i));
    bot.a3 = SE2([bot.l3; 0], danceCycle_pt1(4, i));
    bot.b1 = SE2([bot.l1; 0], danceCycle_pt1(5, i));
    bot.b2 = SE2([bot.l2; 0], danceCycle_pt1(6, i));
    bot.b3 = SE2([bot.l3; 0], danceCycle_pt1(7, i));
    bot.setLinkCoMs();
    display(bot, 'left');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
bot.pose('left');

for i = (enPointeL_length + enPointeR_length + 1):(enPointeL_length + enPointeR_length + lFoot_step_length)
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], danceCycle_pt1(1, i));
    bot.a1 = SE2([bot.l1; 0], danceCycle_pt1(2, i));
    bot.a2 = SE2([bot.l2; 0], danceCycle_pt1(3, i));
    bot.a3 = SE2([bot.l3; 0], danceCycle_pt1(4, i));
    bot.b1 = SE2([bot.l1; 0], danceCycle_pt1(5, i));
    bot.b2 = SE2([bot.l2; 0], danceCycle_pt1(6, i));
    bot.b3 = SE2([bot.l3; 0], danceCycle_pt1(7, i));
    bot.setLinkCoMs();
    display(bot, 'right');              % Plot the robot
    pause(0.06);                     % Pause for one second
end

for i = 1:enPointeL_length
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], danceCycle_pt1(2, i));
    bot.a1 = SE2([bot.l1; 0], danceCycle_pt2(2, i));
    bot.a2 = SE2([bot.l2; 0], danceCycle_pt2(3, i));
    bot.a3 = SE2([bot.l3; 0], danceCycle_pt2(4, i));
    bot.b1 = SE2([bot.l1; 0], danceCycle_pt2(5, i));
    bot.b2 = SE2([bot.l2; 0], danceCycle_pt2(6, i));
    bot.b3 = SE2([bot.l3; 0], danceCycle_pt2(7, i));
    bot.setLinkCoMs();
    display(bot, 'right');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
bot.pose('right');

for i = (enPointeL_length + 1):(enPointeL_length + enPointeR_length)
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], danceCycle_pt1(2, i));
    bot.a1 = SE2([bot.l1; 0], danceCycle_pt2(2, i));
    bot.a2 = SE2([bot.l2; 0], danceCycle_pt2(3, i));
    bot.a3 = SE2([bot.l3; 0], danceCycle_pt2(4, i));
    bot.b1 = SE2([bot.l1; 0], danceCycle_pt2(5, i));
    bot.b2 = SE2([bot.l2; 0], danceCycle_pt2(6, i));
    bot.b3 = SE2([bot.l3; 0], danceCycle_pt2(7, i));
    bot.setLinkCoMs();
    display(bot, 'left');              % Plot the robot
    pause(0.06);                     % Pause for one second
end
bot.pose('left');

for i = (enPointeL_length + enPointeR_length + 1):(enPointeL_length + enPointeR_length + lFoot_step_length)
    cla;                            % Clear the plot
    bot.a = SE2([0; 0], danceCycle_pt1(2, i));
    bot.a1 = SE2([bot.l1; 0], danceCycle_pt2(2, i));
    bot.a2 = SE2([bot.l2; 0], danceCycle_pt2(3, i));
    bot.a3 = SE2([bot.l3; 0], danceCycle_pt2(4, i));
    bot.b1 = SE2([bot.l1; 0], danceCycle_pt2(5, i));
    bot.b2 = SE2([bot.l2; 0], danceCycle_pt2(6, i));
    bot.b3 = SE2([bot.l3; 0], danceCycle_pt2(7, i));
    bot.setLinkCoMs();
    display(bot, 'right');              % Plot the robot
    pause(0.06);                     % Pause for one second
end