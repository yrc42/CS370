% function value = projectile_events(t, z)
%
function value = projectile_events(t, z)
	%Returns the ground height at horizontal distance d from the golf tee.
	e = Ground(z(1));
    if z(2) < e
    	value=-1;
    else
		value =1;
	end
