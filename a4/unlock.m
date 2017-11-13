% unlock.m script

% Display grid of 16 circles
[gx, gy] = meshgrid([0 20 40 60], [0 20 40 60]);
plot(gx(:), gy(:),'ko', 'MarkerSize',10);
hold on; %


% --- YOUR CODE HERE ---
t = [0 795 1447 2172 2897]
x = [0 27 50 -4 22]
y = [-1 37 27 11 42]
yy = spline(x,y);
plot(t, x, y );
