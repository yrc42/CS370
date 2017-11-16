imshow('name.png');
Yx = [104 182 260 186 186];
rx = [239 271 278 316 368];
restx=[444 398 412 462 481 438 540 548 549 579 628 637 700 719 676 680 722 730 686 620 599 672 763 ];
 
Yy = -1*[134 284 121 281 486];
ry = -1*[327 485 383 340 354];
resty = -1*[360 405 462 477 433 356 362 472 421 381 414 483 453 361 400 440 420 499 582 613 562 557 580];
 
[x_cs, y_cs, t] = ParametricSpline(Yx,Yy);
N = length(t);
ref = round(1000/(N-1));
tref = zeros(1,1000);
for k = 1: N-1
    for i= 1:ref
        tref((k-1)*ref+i) = t(k)+ (i-1)*(t(k+1)-t(k))/ref;
    end
end
tref(tref==0) = [];
xr = zeros(length(tref));
yr = zeros(length(tref));
for j =1:length(tref)
  xr(j) = ppval(x_cs, tref(j));
  yr(j) = ppval(y_cs, tref(j));
end
plot(Yx, Yy,'o');
hold on;
plot(xr, yr);
hold on;
[x_cs, y_cs, t] = ParametricSpline(rx,ry);
N = length(t);
ref = round(1000/(N-1));
tref = zeros(1,1000);
for k = 1: N-1
    for i= 1:ref
        tref((k-1)*ref+i) = t(k)+ (i-1)*(t(k+1)-t(k))/ref;
    end
end
tref(tref==0) = [];
xr = zeros(length(tref));
yr = zeros(length(tref));
for j =1:length(tref)
  xr(j) = ppval(x_cs, tref(j));
  yr(j) = ppval(y_cs, tref(j));
end
plot(rx, ry,'o');
hold on;
plot(xr, yr);
hold on;
[x_cs, y_cs, t] = ParametricSpline(restx,resty);
N = length(t);
ref = round(1000/(N-1));
tref = zeros(1,1000);
for k = 1: N-1
    for i= 1:ref
        tref((k-1)*ref+i) = t(k)+ (i-1)*(t(k+1)-t(k))/ref;
    end
end
tref(tref==0) = [];
xr = zeros(length(tref));
yr = zeros(length(tref));
for j =1:length(tref)
  xr(j) = ppval(x_cs, tref(j));
  yr(j) = ppval(y_cs, tref(j));
end
plot(restx, resty,'o');
hold on;
plot(xr, yr);
