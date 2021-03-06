% load the CrankRod14EQ model in the variable ode
close all;

ell     = 1.0;
m       = 1.0;
gravity = 9.81;
ode     = CrankRod14EQ( ell, m, gravity );
solver  = ExplicitEuler(); % initialize solver
solver.setODE(ode);        % Attach ode to the solver

Tmax = 7.5;
h    = 0.05;
tt   = 0:h:Tmax;

angle     = -pi/4;
speed     = 0.0;

x_10      = ell*cos(angle);
y_10      = ell*sin(angle);
x_20      = 2*ell*cos(angle);
y_20      = 0;
theta_0   = angle;
u_10      = -speed*ell*sin(angle);
v_10      = speed*ell*cos(angle);
u_20      = -2*speed*ell*sin(angle);
v_20      = 0;
omega_0   = speed;
lambda_10 = -3*m*cos(angle)*(ell*(speed^2)-gravity*sin(angle))*(1/(4*sin(angle)^2+1));
lambda_20 = -5*m*sin(angle)*(ell*(speed^2)-gravity*sin(angle))*(1/(4*sin(angle)^2+1));
lambda_30 = -2*m*cos(angle)*(ell*(speed^2)-gravity*sin(angle))*(1/(4*sin(angle)^2+1));
lambda_40 = m*gravity;
ini       = [ x_10; y_10; x_20; y_20; theta_0; ...
              u_10; v_10; u_20; v_20; omega_0;...
              lambda_10; lambda_20; lambda_30; lambda_40; ];

sol = solver.advance( tt, ini );
x1  = sol(1,:);
y1  = sol(2,:);
x2  = sol(3,:);
y2  = sol(4,:);
% sample a circle and plot (the constraint)
x0 = 0;
y0 = 0;
xc1 = ell*cos(0:pi/100:2*pi);
yc1 = ell*sin(0:pi/100:2*pi);
close all;
hold on;
axis_lim = ell*2.5;
xc2 = -axis_lim:0.05:axis_lim;
yc2 = 0.0*(-axis_lim:0.05:axis_lim);
plot( xc1, yc1, '-r', 'Linewidth', 1 );
plot( xc2, yc2, '-r', 'Linewidth', 1 );
axis equal;
plot( x1, y1, '-o', 'MarkerSize', 6, 'Linewidth', 2, 'Color', 'blue' );
plot( x2, y2, '-o', 'MarkerSize', 6, 'Linewidth', 2, 'Color', 'green' );
title('x,y');
save_png('./images/Manual_ODE_TEST7_fig1');

close all;
hold off
ode.animate_plot( tt, sol, 10, 1 );
ode.make_movie( './images/Manual_ODE_TEST7_mov1.mp4', tt, sol, 1 );
