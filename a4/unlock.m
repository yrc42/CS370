% unlock.m script
 
% Display grid of 16 circles
[gx, gy] = meshgrid([0 20 40 60], [0 20 40 60]);
plot(gx(:), gy(:),'ko', 'MarkerSize',10);
hold on; %
 
 
% --- YOUR CODE HERE ---
t = [0 795 1447 2172 2897];
x = [0 27 50 -4 22];
y = [-1 37 27 11 42];
x_cs = spline(t, [0 x 0]); 
y_cs = spline(t,[0 y 0]); 
N = length(t);
xr = zeros(N);
yr = zeros(N);
 
for j =1:N
  xr(j) = ppval(x_cs, t(j));
  yr(j) = ppval(y_cs, t(j));
end
plot(xr, yr);
