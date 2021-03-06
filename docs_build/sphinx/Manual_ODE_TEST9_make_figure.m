% load the DoubleSlider model in the variable ode
close all;
clear all;

ell     = 1.0;
m       = 1.0;
gravity = 9.81;
ode     = DoubleSlider( ell, m, gravity );
solver  = ExplicitEuler(); % initialize solver
solver.setODE(ode);        % Attach ode to the solver

Tmax = 2.0;
h    = 0.05;
tt   = 0:h:Tmax;

angle     = -pi/4;
speed     = 0.0;

x_0       = -ell*cos(angle)/2;
y_0       = ell*sin(angle)/2;
theta_0   = angle;
u_0       = speed*ell*cos(angle)/2;
v_0       = speed*ell*sin(angle)/2;
omega_0   = speed;
lambda_10 = -ell*m*speed^2*sin(angle)/4 + sin(angle)^2*gravity*m/2;
lambda_20 = cos(angle)*m*(ell*speed^2 - 2*sin(angle)*gravity)/4;
ini       = [ x_0; y_0; theta_0; ...
              u_0; v_0; omega_0; ...
              lambda_10; lambda_20 ];

sol = solver.advance( tt, ini );
x     = sol(1,:);
y     = sol(2,:);
theta = sol(3,:);
% sample a circle and plot (the constraint)
x0 = 0;
y0 = 0;
close all;
hold on;
xc1 = ell/2*cos(0:pi/100:2*pi);
yc1 = ell/2*sin(0:pi/100:2*pi);
axis_lim = ell*2.5;
xc2 = -axis_lim:0.05:axis_lim;
yc2 = 0.0*(-axis_lim:0.05:axis_lim);
plot( xc1, yc1, '-r', 'Linewidth', 1 );
plot( xc2, yc2, '-r', 'Linewidth', 1 );
plot( yc2, xc2, '-r', 'Linewidth', 1 );
axis equal;
plot( x, y, '-o', 'MarkerSize', 6, 'Linewidth', 2, 'Color', 'blue' );
title('x,y');
save_png('./images/Manual_ODE_TEST9_fig1');

close all;
ode.plot(0, ini)
save_png('./images/double-slider');

close all;
hold off
ode.animate_plot( tt, sol, 10, 1 );
ode.make_movie( './images/Manual_ODE_TEST9_mov1.mp4', tt, sol, 1 );
