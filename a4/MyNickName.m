[x_cs, y_cs, t] = ParametricSpline(Sx,Sy)
N = length(t)
tref = zeros(1,3*(N-1)+1);
for k = 1: N-1
  i = 3*(k-1)+1;
  dt = t(k+1) - t(k);
  tref(i) = t(k);
  tref(i+1) = t(k) + dt/3;
  tref(i+2) = t(k)+ 2*dt/3;
end
tref(3*(N-1)+1) = t(N);
xr = zeros(length(tref));
yr = zeros(length(tref));
for j =1:kength(tref)
  xr(j) = ppval(x_cs, tref(j));
  yr(j) = ppval(y_cs, tref(j));
stringByExpandingTildeInPath
plot(xr, yr);
