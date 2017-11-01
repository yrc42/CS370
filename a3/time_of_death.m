tspan1 = [9 22.43]; % Set start and end times for computation (seconds)
tspan2 = [11 22.43];
tspan3 = [13 22.43];
% Set up initial state: T, A, B 
yStart = [37.5; 1; 1];  
opts = odeset('Events',@death_events)
[t,y] = ode45(@death, tspan1, yStart, opts);
plot(t, y(:,1), y(:,2), y(:,3));
[t,y] = ode45(@death, tspan2, yStart, opts);
plot(t, y(:,1), y(:,2), y(:,3));
[t,y] = ode45(@death, tspan3, yStart, opts);
plot(t, y(:,1), y(:,2), y(:,3));