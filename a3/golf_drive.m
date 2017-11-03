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
[t,y] = MyOde(@projectile, tspan, yStart, h, @projectile_events);
disp(y(end,:))
numBounce= 1;

while numBounce<=5
    Dx = y(end,1);
    Dy = y(end,2);
    Vx = y(end,3);
    Vy = y(end,4);
	groundSlope = GroundSlope(Dx);
	u = [1; groundSlope]/norm([1; groundSlope]);
	U = [-groundSlope; 1]/norm([-groundSlope; 1]);
	v = [Vx; Vy];
	V = 0.75*(dot(v,u)*u-dot(v, U)*U);
	yStart = [Dx; Dy; V(1) ; V(2)];
	[newt,newy] = MyOde_solution(@projectile, [t(end) 20], yStart, h, @projectile_events);
    t = vertcat(t,newt);
    y = vertcat(y, newy);
	numBounce=numBounce+1;
	end
%% Plot
x = linspace(-10, 150, 300);
hills = Ground(x);
plot(x, hills, 'k-', y(:,1), y(:,2), 'ro-');
axis([-10 150 -10 50]);
axis equal;
title(['\theta = ' num2str(theta) '^\circ: Golf ball landed at ' num2str(y(end,1)) 'm'], 'FontSize', 14);
xlabel('Distance (m)');
ylabel('Height (m)');


