function [value, isterminal, direction] = death_events(t, z)
	%at the time of discovery
	value=1;
    if z(1) < 21.7 
    	value=-1;
    end
    isterminal = 1;
    direction  =0;