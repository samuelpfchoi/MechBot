clear; close all; clc; 
figure(1);
axis([-15, 45, -7, 35]);            % Set up axes
cla;                            % Clear the plot
i=300;
addpath('../CSV Files');
FWD = csvread('ForwardAngles.csv');
REV = csvread('ReverseAngles.csv');

figure(1);
title('Robot in critical position with maximum forward tilt');
bot = Mechbot(FWD(2:4),FWD(5:7));
bot.a = SE2([0; 0], FWD(1));
bot.a1 = SE2([bot.l1; 0], FWD(2));
bot.a2 = SE2([bot.l2; 0], FWD(3));
bot.a3 = SE2([bot.l3; 0], FWD(4));
bot.b1 = SE2([bot.l1; 0], FWD(5));
bot.b2 = SE2([bot.l2; 0], FWD(6));
bot.b3 = SE2([bot.l3; 0], FWD(7));
bot.setLinkCoMs();
display(bot, 'left');              % Plot the robot

figure(2);
title('Robot in critical position with maximum backward tilt');
bot = Mechbot(FWD(2:4),FWD(5:7));
bot.a = SE2([0; 0], FWD(1));
bot.a1 = SE2([bot.l1; 0], REV(2));
bot.a2 = SE2([bot.l2; 0], REV(3));
bot.a3 = SE2([bot.l3; 0], REV(4));
bot.b1 = SE2([bot.l1; 0], REV(5));
bot.b2 = SE2([bot.l2; 0], REV(6));
bot.b3 = SE2([bot.l3; 0], REV(7));
bot.setLinkCoMs();
display(bot, 'left');              % Plot the robot
clc