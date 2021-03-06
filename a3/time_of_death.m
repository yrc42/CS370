tspan1 = [9 23]; % Set start and end times for computation (seconds)
tspan2 = [11 23];
tspan3 = [13 23];
% Set up initial state: T, A, B 
yStart = [37.5; 1; 1];  
opts = odeset('Events',@death_events);
[t,y] = ode45(@death, tspan1, yStart, opts);
plot(t, y(:,1));
title('Samantha');
xlabel('Time (h)');
ylabel('Body Temperature (C)');
figure;
[t,y] = ode45(@death, tspan2, yStart, opts);
plot(t, y(:,1));
title('James');
xlabel('Time (h)');
ylabel('Body Temperature (C)');
figure;
[t,y] = ode45(@death, tspan3, yStart, opts);
plot(t, y(:,1));
title('Dennis');
xlabel('Time (h)');
ylabel('Body Temperature (C)');