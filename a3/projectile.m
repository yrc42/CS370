% function dzdt = projectile(t, z)
%
function dzdt = projectile(t, z)
	%z1=x
	%z2=y
	%z3=x'
	%z4=y'
	g = 9.81;
	K=0.1;
    dzdt = [ z(3) ; z(4) ; -K*z(3) ; -g-K*z(4) ];

