% =======================================================================
%   OCP2NLP
%   Copyright (c) 2005 by
%   Raktim Bhattacharya, (raktim@aero.tamu.edu)
%   Department of Aerospace Engineering
%   Texas A&M University.
%   All right reserved.
% =======================================================================
clear; close all; clc
global nlp;

addpath('../../Optragen');
addpath('../../Optragen/src');
SNOPTPATH = '../../Optragen/snopt';
%SNOPTPATH = '~/ivaMatlibs/control/snopt';
addpath([ SNOPTPATH ]);
addpath([ SNOPTPATH '/matlab/matlab/' ]);
addpath([ SNOPTPATH '/matlab/mex/' ]);

% Typesetting for figure text
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultTextInterpreter','latex');

ninterv = 2;
hl = 1.0;

refbot = Mechbot();
l_1 = refbot.l1; l_2 = refbot.l2; l_3 = refbot.l3;   % link lengths

% initial/final end-effector poses
x0 = 0; 
y0 = 0; 
xf = 0;
yf = 0;
ftWidth = 0.70*14;
l_1_CoM = [l_1/2; 0];
l_2_CoM = [2*l_2/3; 0];
l_3_CoM = [l_3/2; 5];
l_1_mass = 168; l_2_mass = 84; l_3_mass = 114;
grO = eye(4);

eps = 0.0001;

% Generate symbolic representation of end-effector pose
syms a1 a2 a3 a4 a5 a6 a7    % a1 = joint 1 angle; a2 = joint 2 angle; a3 = joint 3 angle
g0_1 = [ cos(a1) -sin(a1) 0 ; ...
         sin(a1) cos(a1)  0 ; ...
         0 0 1 ];    % spatial frame to 1st link frame (co-located with first joint)
g1_2 = [ cos(a2) -sin(a2) l_1 ; ...
         sin(a2) cos(a2)  0 ; ...
         0 0 1 ];    % 1st link frame to 2nd link frame (co-located with second joint)
g2_3 = [ cos(a3) -sin(a3) l_2 ; ...
         sin(a3) cos(a3)  0 ; ...
         0 0 1 ];    % 2nd link frame to 3rd link frame (co-located with third joint)
g3_4 = [ cos(a4) -sin(a4) l_3; ...
         sin(a4) cos(a4) 0; ...
         0 0 1];    % 3rd link frame to end-effector frame
g1_2R = [ cos(a5) -sin(a5) l_1 ; ...
          sin(a5) cos(a5)  0 ; ...
          0 0 1 ];    % 1st link frame to 2nd link frame (co-located with second joint)
g2_3R = [ cos(a6) -sin(a6) l_2 ; ...
          sin(a6) cos(a6)  0 ; ...
          0 0 1 ];    % 2nd link frame to 3rd link frame (co-located with third joint)
g3_4R = [ cos(a7) -sin(a7) l_3; ...
          sin(a7) cos(a7) 0; ...
          0 0 1];    % 3rd link frame to end-effector frame
     
% --------- Center of Mass computation
    % Compute the center of mass of the left knee in the origin frame
    com_lKnee = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*[l_1_CoM; 1];
    % Compute the center of mass of the left ankle in the reference frame
    com_lAnkle = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*g1_2*[l_2_CoM; 1];
    % Compute the center of mass of the left foot in the reference frame
    com_lFoot = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*g1_2*g2_3*[l_3_CoM; 1];
    % Compute the center of mass of the left knee in the origin frame
    com_rKnee = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*[l_1_CoM; 1];
    % Compute the center of mass of the left ankle in the reference frame
    com_rAnkle = inv(g3_4R)*inv(g2_3R)*[l_2_CoM; 1];
    % Compute the center of mass of the left foot in the reference frame
    com_rFoot = inv(g3_4R)*[l_3_CoM; 1];

    totalMass = 2*(l_1_mass + l_2_mass + l_3_mass);

    CoM_x = (l_1_mass*com_lKnee(1) + l_2_mass*com_lAnkle(1) + ...
             l_3_mass*com_lFoot(1) + ...
             l_1_mass*com_rKnee(1) + l_2_mass*com_rAnkle(1) + ...
             l_3_mass*com_rFoot(1))/totalMass;
    CoM_y = (l_1_mass*com_lKnee(2) + l_2_mass*com_lAnkle(2) + ...
             l_3_mass*com_lFoot(2) + ...
             l_1_mass*com_rKnee(2) + l_2_mass*com_rAnkle(2) + ...
             l_3_mass*com_rFoot(2))/totalMass;
CoM_x_str = char(vpa(CoM_x, 9));
%CoM_y_str = char(vpa(CoM_y, 9)); 
      
g_ee = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)* ...
            g1_2*g2_3*g3_4;      % body frame to end-effector frame
g_knee = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)* ...
            g1_2*g2_3;         % body frame to knee frame
g_hip = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*inv(g0_1); % body frame to hip
g_ee_x_str = char(vpa(simplify(g_ee(1, 3)), 9));      % end-effector x- spatial position
g_ee_y_str = char(vpa(simplify(g_ee(2, 3)), 9));      % end-effector y- spatial position
%g_knee_x_str = char(vpa(g_knee(1, 3), 9));      % knee x- spatial position
g_knee_y_str = char(vpa(simplify(g_knee(2, 3)), 9));      % knee y- spatial position
g_hip_x_str = char(vpa((g_hip(1, 3)), 9));      % hip x- spatial position
%g_hip_y_str = char(vpa(g_hip(2, 3), 9));      % hip y- spatial position
g_ee_angle_str = char(vpa(simplify(atan2(g_ee(2,1),g_ee(1,1))), 9));
%g_rfoot_x_str = char(vpa(g3_4R(1, 3), 9));      % hip x- spatial position
%g_rfoot_y_str = char(vpa(g3_4R(2, 3), 9));      % hip y- spatial position
%g_knee_ee_diff_x = strcat(g_knee_y_str,' - (',g_ee_x_str,')');
g_knee_ee_diff_y = strcat(g_knee_y_str,' - (',g_ee_y_str,')');

% Create trajectory variablesbase
% ===========================
a1 = traj('a1', ninterv,2,3); % Arguments are ninterv, smoothness, order
a2 = traj('a2', ninterv,2,3);
a3 = traj('a3', ninterv,2,3);
a4 = traj('a4', ninterv,2,3); 
a5 = traj('a5', ninterv,2,3);
a6 = traj('a6', ninterv,2,3);
a7 = traj('a7', ninterv,2,3);

% Create derivatives of trajectory variables
% ==========================================
a1d = deriv(a1, 'a1');
a2d = deriv(a2, 'a2');
a3d = deriv(a3, 'a3');
a4d = deriv(a4, 'a4');
a5d = deriv(a5, 'a5');
a6d = deriv(a6, 'a6');
a7d = deriv(a7, 'a7');

ParamList = [];
xVars = {'a1'; 'a2'; 'a3'; 'a4'; 'a5'; 'a6'; 'a7'; 'a1d'; 'a2d'; 'a3d'; 'a4d'; 'a5d'; 'a6d'; 'a7d'};

% Define constraints
% ==================
Constr = constraint(0,g_ee_x_str,0,'trajectory', xVars) + ... % x(0)
    constraint(0,g_ee_y_str,0,'trajectory', xVars) + ... % y(0)
    constraint(ftWidth, CoM_x_str, ftWidth, 'trajectory', xVars) + ...
    constraint(-2*pi/3,'a1',-pi/3,'trajectory',xVars) + ...
    constraint(0,'a2',0,'trajectory',xVars) + ...
    constraint(0,'a5',0,'trajectory',xVars) + ...
    constraint(0,'a3',pi/2,'trajectory',xVars) + ...
    constraint(0,'a6',pi/2,'trajectory',xVars) + ...
    constraint(pi/2, 'a4', pi/2, 'trajectory', xVars) + ...
    constraint(pi/2, 'a7', pi/2, 'trajectory', xVars) + ...
    constraint(0, g_ee_angle_str, 0, 'trajectory', xVars) + ...
    constraint(0,g_knee_ee_diff_y,Inf,'trajectory',xVars); % keep ankle above ground plane

% Define Cost Function
% ====================
Cost = cost('a1d^2+a2d^2+a3d^2','trajectory'); % Minimise energy

% Collocation Points, using Gaussian Quadrature formula
% =====================================================

breaks = linspace(0,hl,ninterv+1);
gauss = [-1 1]*sqrt(1/3)/2;
lfoot = ((breaks(2:ninterv+1)+breaks(1:ninterv))/2);
lfoot = lfoot(ones(1,length(gauss)),:) + gauss'*diff(breaks);
colpnts = lfoot(:).';

HL = [0 colpnts hl];
HL = linspace(0,hl,20);


% Path where the problem related files will be stored
% ===================================================
pathName = './';  % Save it all in the current directory.

% Name of the problem, will be used to identify files
% ===================================================
probName = 'MechWalk_out';

% List of trajectories used in the problem
% ========================================
TrajList = traj.trajList(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d);

nlp = ocp2nlp(TrajList, Cost,Constr, HL, ParamList,pathName,probName);
snset('Minimize');



xlow = -Inf*ones(nlp.nIC,1);
xupp = Inf*ones(nlp.nIC,1);

Time = linspace(0,1,100);
a1_val = linspace(0,pi/2,100);
a2_val = linspace(0,0,100);
a3_val = linspace(0,0,100);
a4_val = linspace(0,pi/2,100);
a5_val = linspace(0,0,100);
a6_val = linspace(0,0,100);
a7_val = linspace(0,0,100);
a1_sp = createGuess(a1,Time,a1_val);
a2_sp = createGuess(a2,Time,a2_val);
a3_sp = createGuess(a3,Time,a3_val);
a4_sp = createGuess(a4,Time,a4_val);
a5_sp = createGuess(a5,Time,a5_val);
a6_sp = createGuess(a6,Time,a6_val);
a7_sp = createGuess(a7,Time,a7_val);
init = [a1_sp.coefs a2_sp.coefs a3_sp.coefs a4_sp.coefs ...
           a5_sp.coefs a6_sp.coefs a7_sp.coefs]';% + 0.001*rand(nlp.nIC,1);
%init = zeros(nlp.nIC,1);

ghSnopt = snoptFunction(nlp);
tic;
[x,F,inform] = snopt(init, xlow, xupp, [], [], ...
                     [0;nlp.LinCon.lb;nlp.nlb], [Inf;nlp.LinCon.ub;nlp.nub],...
                     [], [], ghSnopt);
toc;
F(1)

sp = getTrajSplines(nlp,x);
a1SP = sp{1};
a2SP = sp{2};
a3SP = sp{3}; 
a4SP = sp{4};
a5SP = sp{5};
a6SP = sp{6};
a7SP = sp{7};

refinedTimeGrid = linspace(min(HL),max(HL),100);

A1 = fnval(a1SP,refinedTimeGrid);
A1d = fnval(fnder(a1SP),refinedTimeGrid);

A2 = fnval(a2SP,refinedTimeGrid);
A2d = fnval(fnder(a2SP),refinedTimeGrid);

A3 = fnval(a3SP,refinedTimeGrid);
A3d = fnval(fnder(a3SP),refinedTimeGrid);

A4 = fnval(a4SP,refinedTimeGrid);
A4d = fnval(fnder(a4SP),refinedTimeGrid);

A5 = fnval(a5SP,refinedTimeGrid);
A5d = fnval(fnder(a5SP),refinedTimeGrid);

A6 = fnval(a6SP,refinedTimeGrid);
A6d = fnval(fnder(a6SP),refinedTimeGrid);

A7 = fnval(a7SP,refinedTimeGrid);
A7d = fnval(fnder(a7SP),refinedTimeGrid);

% Planar 2-R Arm animation
figure(2);
planar2R_l1_plot_hdl = plot(0, 0, 'r', 'Linewidth', 2);
hold on; axis equal;
planar2R_l2_plot_hdl = plot(0, 0, 'm', 'Linewidth', 2);
planar2R_l3_plot_hdl = plot(0, 0, 'k', 'Linewidth', 2);
planar2R_l1R_plot_hdl = plot(0, 0, 'y', 'Linewidth', 2);
planar2R_l2R_plot_hdl = plot(0, 0, 'c', 'Linewidth', 2);
planar2R_l3R_plot_hdl = plot(0, 0, 'k', 'Linewidth', 2);
planar2R_traj_plot_hdl = plot(0, 0, 'c--', 'Linewidth', 1);
planar2R_CoM_plot_hdl = plot(0, 0, 'xg');

lfoot_text = text(0, 0, 'Left foot');
rfoot_text = text(0, 0, 'Right foot');
CoM_text = text(0, 0, 'CoM');
hip_text = text(0, 0, 'Torso');

plot(0, 0, 'bo');       % joint 1
planar2R_j2_plot_hdl = plot(0, 0, 'bo');       % joint 2
planar2R_j3_plot_hdl = plot(0, 0, 'bo');       % joint 3
planar2R_j4_plot_hdl = plot(0, 0, 'bo');       % joint 2
planar2R_j5_plot_hdl = plot(0, 0, 'bo');       % joint 3
planar2R_ee_plot_hdl = plot(0, 0, 'bo');       % e-e

lfoot_frm_hdl_1 = plot(0, 0, 'b');
lfoot_frm_hdl_2 = plot(0, 0, 'b');
rfoot_frm_hdl_1 = plot(0, 0, 'b');
rfoot_frm_hdl_2 = plot(0, 0, 'b');
waist_frm_hdl_1 = plot(0, 0, 'b');
waist_frm_hdl_2 = plot(0, 0, 'b');

plot(x0, y0, 'gd');     % e-e start
plot(xf, yf, 'rd');     % e-e end

total_len = l_1 + l_2 + l_3;
xlim([-total_len, total_len]*1.1); ylim([-5, total_len]*1.1);
xlabel('X-Axis (Spatial)'); ylabel('Y-Axis (Spatial)'); title('Mechbot Trajectory of Left Leg with Right-Leg Reference Frame');
hold off;

planar2r_traj = [];
for ii = 1:length(A1)      
    g0_1 = [ cos(A1(ii)) -sin(A1(ii)) 0 ; ...
             sin(A1(ii)) cos(A1(ii))  0 ; ...
             0 0 1 ];    % spatial frame to 1st link frame (co-located with first joint)
    g1_2 = [ cos(A2(ii)) -sin(A2(ii)) l_1 ; ...
             sin(A2(ii)) cos(A2(ii))  0 ; ...
             0 0 1 ];    % 1st link frame to 2nd link frame (co-located with second joint)
    g2_3 = [ cos(A3(ii)) -sin(A3(ii)) l_2 ; ...
             sin(A3(ii)) cos(A3(ii))  0 ; ...
             0 0 1 ];    % 2nd link frame to 3rd link frame (co-located with third joint)
    g3_4 = [ cos(A4(ii)) -sin(A4(ii)) l_3 ; ...
             sin(A4(ii)) cos(A4(ii)) 0; ...
             0 0 1];    % 3rd link frame to end-effector frame
    g1_2R = [ cos(A5(ii)) -sin(A5(ii)) l_1 ; ...
             sin(A5(ii)) cos(A5(ii))  0 ; ...
             0 0 1 ];    % spatial frame to 1st link frame (co-located with first joint)
    g2_3R = [ cos(A6(ii)) -sin(A6(ii)) l_2 ; ...
              sin(A6(ii)) cos(A6(ii))  0 ; ...
              0 0 1 ];    % 1st link frame to 2nd link frame (co-located with second joint)
    g3_4R = [ cos(A7(ii)) -sin(A7(ii)) l_3 ; ...
              sin(A7(ii)) cos(A7(ii))  0 ; ...
              0 0 1 ];    % 2nd link frame to 3rd link frame (co-located with third joint)
          
    a = inv(g3_4R);
    b = inv(g3_4R)*inv(g2_3R);
    c = inv(g3_4R)*inv(g2_3R)*inv(g1_2R);
    d = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*g1_2;
    e = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*g1_2*g2_3;
    f = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*g1_2*g2_3*g3_4;
          
      set(planar2R_l3R_plot_hdl, 'XData', [0, a(1, 3)], 'YData', [0, a(2, 3)]);
      set(planar2R_l2R_plot_hdl, 'XData', [a(1, 3), b(1, 3)], 'YData', [a(2, 3), b(2, 3)]);
      set(planar2R_l1R_plot_hdl, 'XData', [ b(1, 3), c(1, 3)], ...
                                'YData', [ b(2, 3), c(2, 3)]);
      set(planar2R_l1_plot_hdl, 'XData', [ c(1, 3), d(1, 3)], ...
                                'YData', [ c(2, 3), d(2, 3)]);
      set(planar2R_l2_plot_hdl, 'XData', [ d(1, 3), e(1, 3)], ...
                                'YData', [ d(2, 3), e(2, 3)]);
      set(planar2R_l3_plot_hdl, 'XData', [ e(1, 3), f(1, 3)], ...
                                'YData', [ e(2, 3), f(2, 3)]);

      set(planar2R_j2_plot_hdl, 'XData', a(1, 3), 'YData', a(2, 3));
      set(planar2R_j3_plot_hdl, 'XData', b(1, 3), 'YData', b(2, 3));
      set(planar2R_j4_plot_hdl, 'XData', c(1, 3), 'YData', c(2, 3));
      set(planar2R_j5_plot_hdl, 'XData', d(1, 3), 'YData', d(2, 3));
      set(planar2R_ee_plot_hdl, 'XData', e(1, 3), 'YData', e(2, 3));

    % --------- Center of Mass computation
    % Compute the center of mass of the left knee in the origin frame
    com_lKnee = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*[l_1_CoM; 1];
    % Compute the center of mass of the left ankle in the reference frame
    com_lAnkle = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*g1_2*[l_2_CoM; 1];
    % Compute the center of mass of the left foot in the reference frame
    com_lFoot = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*g1_2*g2_3*[l_3_CoM; 1];
    % Compute the center of mass of the left knee in the origin frame
    com_rKnee = inv(g3_4R)*inv(g2_3R)*inv(g1_2R)*[l_1_CoM; 1];
    % Compute the center of mass of the left ankle in the reference frame
    com_rAnkle = inv(g3_4R)*inv(g2_3R)*[l_2_CoM; 1];
    % Compute the center of mass of the left foot in the reference frame
    com_rFoot = inv(g3_4R)*[l_3_CoM; 1];

    totalMass = 2*(l_1_mass + l_2_mass + l_3_mass);

    CoM_x = (l_1_mass*com_lKnee(1) + l_2_mass*com_lAnkle(1) + ...
             l_3_mass*com_lFoot(1) + ...
             l_1_mass*com_rKnee(1) + l_2_mass*com_rAnkle(1) + ...
             l_3_mass*com_rFoot(1))/totalMass;
    CoM_y = (l_1_mass*com_lKnee(2) + l_2_mass*com_lAnkle(2) + ...
             l_3_mass*com_lFoot(2) + ...
             l_1_mass*com_rKnee(2) + l_2_mass*com_rAnkle(2) + ...
             l_3_mass*com_rFoot(2))/totalMass;
    % Compute the center of mass in the right foot frame
    % Plot the center of mass
    set(planar2R_CoM_plot_hdl, 'XData', CoM_x, 'YData', CoM_y);
    

  planar2r_traj = [planar2r_traj, ...
            [l_2*cos(A5(ii) - A2(ii) + A6(ii) + A7(ii)) + l_3*cos(A5(ii) - A3(ii) - A2(ii) + A6(ii) + A7(ii)) - l_3*cos(A7(ii)) - l_2*cos(A6(ii) + A7(ii)); ...
            l_3*sin(A7(ii)) - l_3*sin(A5(ii) - A3(ii) - A2(ii) + A6(ii) + A7(ii)) - l_2*sin(A5(ii) - A2(ii) + A6(ii) + A7(ii)) + l_2*sin(A6(ii) + A7(ii))]];
  set(planar2R_traj_plot_hdl, 'XData', planar2r_traj(1, ii), 'YData', planar2r_traj(2, ii));

    % Label important positions
  lfoot_se2 = SE2(planar2r_traj(:, ii), atan2(f(2, 1), f(1, 1)));
  lfoot_se2.plot_hdl(lfoot_frm_hdl_1, lfoot_frm_hdl_2);
  lfoot_text.Position = [planar2r_traj(1, ii) planar2r_traj(2, ii)]; 
  rfoot_text.Position = [0 0]; 
  rfoot_se2 = SE2([0; 0], 0);
  rfoot_se2.plot_hdl(rfoot_frm_hdl_1, rfoot_frm_hdl_2);
  CoM_text.Position = [CoM_x CoM_y];
  hip_pos = [- l_1*cos(A5(ii) + A6(ii) + A7(ii)) - l_3*cos(A7(ii)) - l_2*cos(A6(ii) + A7(ii)), ...
               l_1*sin(A5(ii) + A6(ii) + A7(ii)) + l_3*sin(A7(ii)) + l_2*sin(A6(ii) + A7(ii))];
  hip_text.Position = hip_pos;
  waist_se2 = SE2([hip_pos(1); hip_pos(2)], atan2(c(2, 1), c(1, 1)));
  waist_se2.plot_hdl(waist_frm_hdl_1, waist_frm_hdl_2);
  
  pause(0.05);   % arbitrary length delay (for viewability)
end

FWD = [A1(end) A2(end) A3(end) A4(end) A5(end) A6(end) A7(end)];
csvwrite('../CSV Files/ForwardAngles.csv',FWD);