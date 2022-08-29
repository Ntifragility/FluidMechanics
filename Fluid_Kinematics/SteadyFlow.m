%{
4 Fluid Kinematics
4.2 Flow Patterns and visualization.
In reference to Fluid Mechanics, Cengel, 3rd Ed.

Auhor: marco.villafuerte.j@uni.pe
%}

clear, clc, close all;

% define X-Y plane, wih  a density of arrows of 25
n = 20; % density of points
X = linspace(0,5,n);
Y = linspace(0,5,n);
t = linspace(0,5,100);

% transforms the domain specified by vectors X and Y into arrays x and y
[x, y] = meshgrid(X, Y);

% Constant
C = [-1, -2, -3, 1, 2, 3];

% Z level to be draw
z_lev = 0;

% figh = figure(1);
figh = figure;
figh.Position = [10 10 970 550]; % Pizel for video

% Because is STEADY FLOW, the flow does not change on time
    
%%% Plot Vectorial Field %%%

% Vectorial components of velocity vectorial field
u = 0.5 + 0.8*x;                 % u: Velocity field component in x axis
v = 1.5 - 0.8*y;                 % v: Velocity field component in y axis

% 2D arrows field using u and v (color is in normalized RGB)
q = quiver(x, y, u, v, 'color',[0 0 1]);

hold on;

%%% Plot STREAMLINE %%%

for Cv = C
    % give form the function z:
    A = y - 1.875;
    B = 0.8*(0.5 +0.8*x);
    z = A.*B - Cv;   %  z = f(x,y,t) = 0

    % plot, z must be represented on a plane parallel to x-y plane:
    [M,a] = contour(x,y,z);
    a.LineWidth = 1;
    a.LevelList = z_lev;  % Draws level. z = f(x,y,t) = y*x^(t) - C = level
    a.LineColor = 'r';    % Color red
    a.ShowText = 'on';    % Show current level on plot

end

% Properties of axes
xlabel('x axis', 'fontsize', 11);
ylabel('y axis', 'fontsize', 11);
% Title  
title( "STEADY FLOW - Velocity field v(x, y),  Constants C = " + strjoin(string(C)));
legend({"Vector field', 'Streamline at z = " + strjoin(string(z_lev))}, 'Color','#ffac33')

hold off;

exportgraphics(figh,'SteadyFlow.png')

disp('DONE!')