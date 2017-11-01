% golf_drive.m

theta = 56;     % Angle of initial velocity (degrees)
S = 40;         % Initial speed (m/s)
tspan = [0 20]; % Set start and end times for computation (seconds)
h = 0.1;        % time step 100ms

% Set up initial state
yStart = [0;0;                   % initial position (0,0)
          S*cos(theta/180*pi);   % x velocity
          S*sin(theta/180*pi)];  % y velocity
%% Call the MyOde numerical solver function 
[t,y] = MyOde_solution(@projectile, tspan, yStart, h, @projectile_events);
numBounce= 1;
while numBounce<=5
	[m,n] = size(y);
	groundSlope = GroundSlope(y(m,1));
	u = [1; groundSlope]/norm([1; groundSlope]);
	U = [-groundSlope; 1]/norm([-groundSlope; 1]);
	v = [y(m,3); y(m,4)];
	V = 0.75*(dot(v,u)*u-dot(v, U)*U);
	yStart = [y(m,1); y(m,2); V(1) ; V(2)];
	[t,y] = MyOde_solution(@projectile, [t(m) 20], yStart, h, @projectile_events);
	numBounce=numBounce+1;
	end
%% Plot
x = linspace(-10, 120, 300);
hills = Ground(x);
plot(x, hills, 'k-', y(:,1), y(:,2), 'ro-');
axis([-10 120 -10 50]);
axis equal;
title(['\theta = ' num2str(theta) '^\circ: Golf ball landed at ' num2str(y(end,1)) 'm'], 'FontSize', 14);
xlabel('Distance (m)');
ylabel('Height (m)');


