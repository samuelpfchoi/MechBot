%================================== Mechbot ==================================
%
%  class Mechbot
%
%  bot = Mechbot(waist, rfoot, lfoot)
%
%
%  This is currently a planar implementation of making calculations about
%  the mechbot's kinematics.
%
%================================== Mechbot ==================================
classdef Mechbot < handle


properties (Access = public)%Not protected, but I didn't know any other solution.
  a, a1, a2, a3; a4; a5;
  b1; b2; b3;
  M; K; grO;
  masses;
  s; 
  l1; l2; l3;
end

%
%========================= Public Member Methods =========================
%

methods 

  %-------------------------------- Mechbot --------------------------------
  %
  %  Constructor for the class, parameters given are angles for 
  %
  function bot = Mechbot(L, R) 
  %L and R are 3x1 vectors containing angles of the waist-knee,
  %knee-ankle, and ankle-foot frame changes.
   bot.a = SE2([0;0], -pi/2);
   bot.K = 0; bot.s = 'waist';
   bot.grO = SE2([0; 0], 0);
   bot.l1 = 11;
   bot.l2 = 10; 
   bot.l3 = 12;
   bot.a4 = SE2([7;0],0);
   bot.a5 = SE2([-7; 0], 0);
  if (nargin == 0)
    bot.a1 = SE2([bot.l1; 0], 0);  %waist to left knee
    bot.a2 = SE2([bot.l2; 0], 0);   %left knee to left ankle
    bot.a3 = SE2([bot.l3; 0], pi/2);    %left ankle to left foot
    bot.b1 = SE2([bot.l1; 0], 0);  %waist to right knee
    bot.b2 = SE2([bot.l2; 0], 0);   %right knee to right ankle
    bot.b3 = SE2([bot.l3; 0], pi/2);    %right ankle to right foot

  else
    bot.a1 = SE2([bot.l1; 0], L(1));  %waist to left knee
    bot.a2 = SE2([bot.l2; 0], L(2));   %left knee to left ankle
    bot.a3 = SE2([bot.l3; 0], L(3));    %left ankle to left foot
    bot.b1 = SE2([bot.l1; 0], R(1));  %waist to right knee
    bot.b2 = SE2([bot.l2; 0], R(2));   %right knee to right ankle
    bot.b3 = SE2([bot.l3; 0], R(3));    %right ankle to right foot
  end
  
  % Set default link masses and centers of mass
  bot.setLinkCoMs();

  end
  
  %Save previous configuration 
  function temp = pose(bot,stance)
      if strcmp(stance,'left')                  %Mechbot is in LEFT stance
          [~, config2] = calculations(bot,1);   %Right foot in Left foot stance
          bot.grO = config2;                    %Updating previous configuration
          temp = bot.grO;
      elseif strcmp(stance,'right')             %Mechbot is in RIGHT stance
          [~, config2] = calculations(bot,2);   %Left foot in Right foot stance
          bot.grO = config2;                    %Updating previous configuration
          temp = bot.grO;
      end
  end
  
  function [config1, config2] = calculations(bot, k)
      while(k < 0 || k > 2)                                 %Verify correct k parameter
          prompt = 'Input an integer value between 0 and 2: ';
          k = input(prompt);
          bot.K = k;
      end
      if (k == 0)                                           %check if waist origin
          config1 = bot.a1*bot.a2*bot.a3;                   %waist-left foot
          config2 = bot.b1*bot.b2*bot.b3;                   %waist-right foot
      elseif (k == 1)                                       %check if left foot origin
          config1 = bot.grO*inv(bot.a3)*inv(bot.a2)*inv(bot.a1);    %left foot-waist
          config2 = config1*bot.b1*bot.b2*bot.b3;           %left-foot-right foot
      elseif (k == 2)                                       %check if right-foot origin
          config1 = bot.grO*inv(bot.b3)*inv(bot.b2)*inv(bot.b1);    %right foot-waist
          config2 = config1*bot.a1*bot.a2*bot.a3;           %left-foot-right foot
      end
  end
  
  

  
  function display(bot, frame)
      hold on
      set(0,'defaulttextinterpreter','latex')
      if (strcmp(frame,'waist'))
          plot(bot.a,'Waist');
           
          %Calculatin configurations
          leftknee = bot.a*bot.a1;
          leftankle = leftknee*bot.a2;
          leftfoot = leftankle*bot.a3;
          rightknee = bot.a*bot.b1;
          rightankle = rightknee*bot.b2;
          rightfoot = rightankle*bot.b3;
          
          plot(bot.a,'Waist');         %Plot Waist at origin (0,0)
          plot(leftknee,'$L_{Knee}$');     %Plot Left knee
          plot(leftankle,'$L_{Ankle}$'); %Plot Left Ankle
          plot(leftfoot,'$L_{Foot}$');   %Plot Left Foot
          
          plot(rightknee,'$R_{Knee}$')       %Plot Right Knee     
          plot(rightankle,'$R_{Ankle}$');%Plot Right Ankle
          plot(rightfoot,'$R_{Foot}$');   %Plot Right Foot
           
          %Saving Translations for each SE2 configuraiton
          d1 = getTranslation(bot.a);
          d2 = getTranslation(leftknee);   d5 = getTranslation(rightknee);
          d3 = getTranslation(leftankle);d6 = getTranslation(rightankle);
          d4 = getTranslation(leftfoot); d7 = getTranslation(rightfoot);
          

          CoM = bot.centerOfMass('waist');
          plot(CoM(1),CoM(2),'g*');
          comLabel = sprintf('  $CoM^{waist} = (%g, %g)$', CoM(1), CoM(2));
          text(CoM(1), CoM(2), comLabel);
   
      
      elseif (strcmp(frame,'left'))
          %leftfoot = SE2([0; 0], 0);
          leftfoot = bot.grO;
          leftankle = leftfoot*bot.a3.inv();
          leftknee = leftankle*bot.a2.inv();
          waist = leftknee*bot.a1.inv();
          rightknee = waist*bot.b1;
          rightankle = rightknee*bot.b2;
          rightfoot =  rightankle*bot.b3;
          
          plot(leftfoot,'$L_{Foot}$');
          plot(leftankle,'$L_{Ankle}$');
          plot(leftknee,'$L_{Knee}$');
          plot(waist,'Waist','r');
          
          plot(rightknee,'$R_{Knee}$');
          plot(rightankle,'$R_{Ankle}$');
          plot(rightfoot,'$R_{Foot}$');
          
          %Saving Translations for each SE2 configuraiton
          d1 = getTranslation(waist);
          d2 = getTranslation(leftknee);   d5 = getTranslation(rightknee);
          d3 = getTranslation(leftankle);d6 = getTranslation(rightankle);
          d4 = getTranslation(leftfoot); d7 = getTranslation(rightfoot);
 
          CoM = bot.centerOfMass('left');
%         CoM_O = leftfoot.leftact(CoM);              % Compute CoM in waist frame
          plot(CoM(1),CoM(2),'g*');
          comLabel = sprintf('  $CoM^{left foot} = (%g, %g)$', CoM(1), CoM(2));
%           disp(CoM_O)
          text(CoM(1), CoM(2), comLabel);
      elseif (strcmp(frame,'right'))
          %rightfoot = SE2([0, 0], 0);
          rightfoot = bot.grO;
          rightankle = rightfoot*bot.b3.inv();
          rightknee = rightankle*bot.b2.inv();
          waist = rightknee*bot.b1.inv();
          leftknee = waist*bot.a1;
          leftankle = leftknee*bot.a2;
          leftfoot =  leftankle*bot.a3;
          
          plot(rightfoot,'$R_{Foot}$');
          plot(leftankle,'$L_{Ankle}$');
          plot(leftknee,'$L_{Knee}$');
          plot(waist,'Waist','r');
          
          plot(rightknee,'$R_{Knee}$');
          plot(rightankle,'$R_{Ankle}$');
          plot(leftfoot,'$L_{Foot}$');
          
          %Saving Translations for each SE2 configuraiton
          d1 = getTranslation(waist);
          d2 = getTranslation(leftknee);   d5 = getTranslation(rightknee);
          d3 = getTranslation(leftankle);d6 = getTranslation(rightankle);
          d4 = getTranslation(leftfoot); d7 = getTranslation(rightfoot);
          
          
          CoM = bot.centerOfMass('right');
%          CoM_O = rightfoot.leftact(CoM);              % Compute CoM in waist frame
          plot(CoM(1),CoM(2),'g*');
          comLabel = sprintf('  $CoM^{right foot} = (%g, %g)$', CoM(1), CoM(2));
          text(CoM(1), CoM(2), comLabel);
    
      else
          error('Error: input "waist", "left" or "right" for frame choice')
      end
                    %Saving x and y arrays
          x = [d1(1),d2(1),d3(1),d4(1),d5(1),d6(1),d7(1)];
          y = [d1(2),d2(2),d3(2),d4(2),d5(2),d6(2),d7(2)];

          %Plotting lines between arrays
          plot([x(1),x(2)],[y(1),y(2)],'r','LineWidth',2);  %Waist to Knee
          plot([x(2),x(3)],[y(2),y(3)],'r','LineWidth',2);  %Knee to Left Ankle
          plot([x(3),x(4)],[y(3),y(4)],'r','LineWidth',2);  %Ankle to Left Foot
          plot([x(5),x(6)],[y(5),y(6)],'b','LineWidth',2);  %Knee to Right Ankle
          plot([x(6),x(7)],[y(6),y(7)],'b','LineWidth',2);  %Ankle to Right Foot
          
          LF = leftfoot * bot.a4;
          RF = rightfoot * bot.a4;
          LF_back = leftfoot * bot.a5;
          RF_back = rightfoot * bot.a5;
          %plot(LF); plot(RF);
          LF_pos = getTranslation(LF);
          RF_pos = getTranslation(RF);
          LF_back_pos = getTranslation(LF_back);
          RF_back_pos = getTranslation(RF_back);
          plot([LF_back_pos(1), LF_pos(1)],[LF_back_pos(2), LF_pos(2)],'r','LineWidth',2);
          plot([RF_back_pos(1), RF_pos(1)],[RF_back_pos(2), RF_pos(2)],'b','LineWidth',2);
      hold off
      
  end
  
  function kvalue(bot)   % Display current origin frame
      if (bot.K == 0)
          disp('Waist Origin: K = 0')
      elseif (bor.K == 1)
          disp('Left Foot Origin: K = 1')
      elseif (bot.K == 2)
          disp('Right Foot Origin" K = 2')
      else
          error('Invalid K value: Choose 0-2 ')
      end

  end
  
  %
  % ------------Reduced rate kinematics - reducedRateKnm-------------------
  % Computes the kinematics of left leg given a 2D position array
  %
  % initPos = 3x1 column vector of x, y, and theta, e.g. [x; y; theta]
  % finPos = 3x1 column vector of final x, y, and theta, e.g. [x; y; theta]
  %
  function alpha = reducedRateKnm(bot, initPos, finPos)
      dt = 0.1;                     % Time increment
      % Array of changes in position from an initial value to a final value
      positions = [linspace(initPos(1,1), finPos(1,1), 100);
                   linspace(initPos(2,1), finPos(2,1), 100);
                   linspace(initPos(3,1), finPos(3,1), 100)];
      % Preallocate alpha
      alpha = zeros(4, size(positions, 2));
      alpha(:, 1) = [bot.a.getRotationAngle();
                     bot.a1.getRotationAngle();
                     bot.a2.getRotationAngle();
                     bot.a3.getRotationAngle()];
      for i = 1:(size(positions, 2) - 1)
          % Compute change in position
          d_pos = (positions(:, i + 1) - positions(:, i))./dt;
          % Compute Jacobian
          j = bot.jacobian(bot.a, bot.a3);
          %j = bot.hardcodedJacobian(alpha(:, i));
          % Compute pseudoinverse of Jacobian
          j_plus = pinv(j);
          % Compute change in joint angles
          d_alpha = j_plus*d_pos;
          % Compute next value of alpha and store it in output array
          alpha(:, i + 1) = alpha(:, i) + [0; d_alpha(2:4, 1)].*dt;
          % Update bot config
          bot.a = SE2([0; 0], alpha(1, i+1));
          bot.a1 = SE2([0;-9.4], alpha(2, i+1));  %waist to left knee
          bot.a2 = SE2([0;-12], alpha(3, i+1));   %left knee to left ankle
          bot.a3 = SE2([0;-6], alpha(4, i+1));    %left ankle to left foot
      end  
      
  end

  %------------------------- jacobian -------------------------
  %
  %  Generate a Jacobian matrix based on a reference frame and an
  %  end-effector frame.
  %
  %
  function J = jacobian(bot, refF, endEF)
      jointsTotal = [bot.a3 bot.a2 bot.a1 bot.a bot.b1 bot.b1 bot.b3]; %vector of SE2 joint frames from left to right foot      
      index1 = find(jointsTotal == refF);
      indexLast = find(jointsTotal == endEF);
      if (index1 > indexLast)
          joints = jointsTotal(index1:-1:indexLast);
      else
          joints = jointsTotal(index1:indexLast); 
      end
      %does not account for left and right legs in same location in 2D
      
      lengths = sym('L%d', [1 length(joints)]);
      angles = sym('A%d', [1 length(joints)]);
      x = 0;
      y = 0;
      theta = 0;
      for i = 1:length(joints)
          theta = theta+angles(i);
          x = x+lengths(i)*cos(theta);
          y = y+lengths(i)*sin(theta);
      end
      q = [x;y;theta];
      JSym = [];
      for i = 1:length(joints)
          xder = diff(x, angles(i));
          yder = diff(y, angles(i));
          JSym = [JSym [xder;yder;1]];
      end
      
      L = [];
      A = [];
      for i = 1:length(joints)
          get = getTranslation(joints(i));
          l = get(2);
          a = getRotationAngle(joints(i));
          L = [L l];
          A = [A a];
      end
      JSub = subs(JSym, [lengths angles], [L A]);
      J = eval(JSub);
  end
  
  %-------------------------- centerOfMass -----------------------------
  %
  %  Compute the center of mass of a given leg.
  %
  %  Takes the the "stance" of the robot, defined as either 'left',
  %  'right', or 'waist' and computes the center of mass of the given leg.
  %
  %  Returns a 2x1 vector of the position of the center of mass in the foot
  %  of the given leg's frame.
  %
  function CoM = centerOfMass(bot, stance)
        bot.s = stance;
     % Compute the midpoints of each limb
      m_lKnee = bot.a1.getCoM();
      m_lAnkle = bot.a2.getCoM();
      m_lFoot = bot.a3.getCoM();
      m_rKnee = bot.b1.getCoM();
      m_rAnkle = bot.b2.getCoM();
      m_rFoot = bot.b3.getCoM();
      refFrame = bot.a;     % Set reference frame to waist at first
      
      % Compute the center of mass of the left knee in the origin frame
      com_lKnee = refFrame.leftact(m_lKnee);
      % Compute the center of mass of the left ankle in the reference frame
      g_OL2 = refFrame*bot.a1;
      com_lAnkle = g_OL2.leftact(m_lAnkle);
      % Compute the center of mass of the left foot in the reference frame
      g_OL3 = refFrame*bot.a1*bot.a2;
      com_lFoot = g_OL3.leftact(m_lFoot);
      
      % Compute the center of mass of the right knee in the origin frame
      com_rKnee = refFrame.leftact(m_rKnee);
      % Compute the center of mass of the right ankle in the reference frame
      g_OR2 = refFrame*bot.b1;
      com_rAnkle = g_OR2.leftact(m_rAnkle);
      % Compute the center of mass of the right foot in the reference frame
      g_OR3 = refFrame*bot.b1*bot.b2;
      com_rFoot = g_OR3.leftact(m_rFoot);
      
      totalMass = bot.a1.getMass() + bot.a2.getMass() + bot.a3.getMass() + ...
                  bot.b1.getMass() + bot.b2.getMass() + bot.b3.getMass();
      
      % Compute the center of mass in the waist's frame with the "masses"
      % matrix, which contains each limb mass
      x = (bot.a1.getMass()*com_lKnee(1) + bot.a2.getMass()*com_lAnkle(1) + ...
          bot.a3.getMass()*com_lFoot(1) + bot.b1.getMass()*com_rKnee(1) + ... 
          bot.b2.getMass()*com_rAnkle(1) + ...
          bot.b3.getMass()*com_rFoot(1))/totalMass;
      y = (bot.a1.getMass()*com_lKnee(2) + bot.a2.getMass()*com_lAnkle(2) + ...
          bot.a3.getMass()*com_lFoot(2) + bot.b1.getMass()*com_rKnee(2) + ... 
          bot.b2.getMass()*com_rAnkle(2) + ...
          bot.b3.getMass()*com_rFoot(2))/totalMass;
     
      % Return the center of mass in the requested reference frame
      switch stance
          case 'waist'
              bot.K = 0;
              CoM = [x; y];     % We already calculated this
          case 'left'
              bot.K = 1;
              g_3O = bot.grO*bot.a3.inv()*bot.a2.inv()*bot.a1.inv()*bot.a.inv();
              CoM = g_3O.leftact([x; y]);
          case 'right'
              bot.K = 2;
              g_3O = bot.grO*bot.b3.inv()*bot.b2.inv()*bot.b1.inv()*bot.a.inv();
              CoM = g_3O.leftact([x; y]);
          otherwise
              error('centerOfMass requires stance to be specified with either "left", "right", or "waist"');
      end
  end
  
  %---------------------------- setLinkCoMs ----------------------------
  %
  % Sets the centers of mass of each link. If no inputs are given to the
  % function, the midpoints of each link are used as the centers of mass,
  % and a generic mass is given to each link. 
  % To set custom CoM positions and mass values, the function must be
  % passed six 3x1 column vectors of the form
  % /  x   \
  % |  y   |
  % \ mass /
  % where x and y denote the position of the center of mass of the link in
  % the link's reference frame, and mass is the mass of the link.
  %
  function setLinkCoMs(bot, lKnee, lAnkle, lFoot, rKnee, rAnkle, rFoot)
      
      if (nargin == 1)  % Set default CoM values
        bot.a1.setCoM(bot.a1.midpoint());   % Set CoM of left-side waist
        bot.a1.setMass(4.7);                  % Set mass of waist to 5
        
        bot.a2.setCoM(bot.a2.midpoint());   % Set CoM of left thigh
        bot.a2.setMass(12);                  % Set mass of left thigh to 4
        
        bot.a3.setCoM(bot.a3.midpoint());   % Set CoM of left shin
        bot.a3.setMass(6);                  % Set mass of left shin to 2
        
        bot.b1.setCoM(bot.b1.midpoint());   % Set CoM of right-side waist
        bot.b1.setMass(4.7);                  % Set mass of waist to 5
        
        bot.b2.setCoM(bot.b2.midpoint());   % Set CoM of right shin
        bot.b2.setMass(12);                  % Set mass of right shin to 2
        
        bot.b3.setCoM(bot.b3.midpoint());   % Set CoM of left shin
        bot.b3.setMass(6);                  % Set mass of left shin to 2
      elseif (nargin == 7) % If all of the correct inputs are provided...
        bot.a1.setCoM(lKnee(1:2, 1));       % Set CoM of left-side waist
        bot.a1.setMass(lKnee(3, 1));        % Set mass of left-side waist
        
        bot.a2.setCoM(lAnkle(1:2, 1));      % Set CoM of left thigh
        bot.a2.setMass(lAnkle(3, 1));       % Set mass of left thigh
        
        bot.a3.setCoM(lFoot(1:2, 1));       % Set CoM of left shin
        bot.a3.setMass(lFoot(3, 1));        % Set mass of left shin
        
        bot.b1.setCoM(rKnee(1:2, 1));       % Set CoM of right-side waist
        bot.b1.setMass(rKnee(3, 1));        % Set mass of right-side waist
        
        bot.b2.setCoM(rAnkle(1:2, 1));      % Set CoM of right thigh
        bot.b2.setMass(rAnkle(3, 1));       % Set mass of right thigh
        
        bot.b3.setCoM(rFoot(1:2, 1));       % Set CoM of right shin
        bot.b3.setMass(rFoot(3, 1));        % Set mass of right shin
      end
  end
    
  % TESTING ONLY
  % Hardcoded Jacobian function to compute the Jacobian of left foot with
  % respect to the waist frame.
  function j = hardcodedJacobian(bot, alphas)
     L = [9.4, 12, 6];
     j = [-L(1)*sin(alphas(1)) - L(2)*sin(alphas(1) + alphas(2)) - L(3)*sin(alphas(1) + alphas(2) + alphas(3)), ...
            - L(2)*sin(alphas(1) + alphas(2)) - L(3)*sin(alphas(1) + alphas(2) + alphas(3)), ...
            - L(3)*sin(alphas(1) + alphas(2) + alphas(3)), 0;
          L(1)*cos(alphas(1)) + L(2)*cos(alphas(1) + alphas(2)) + L(3)*cos(alphas(1) + alphas(2) + alphas(3)), ...
            L(2)*cos(alphas(1) + alphas(2)) + L(3)*cos(alphas(1) + alphas(2) + alphas(3)), ...
            L(3)*cos(alphas(1) + alphas(2) + alphas(3)), 0;
          1, 1, 1, 1];
  end
  
end

end