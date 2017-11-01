function value = death_events(t, z)
	%at the time of discovery
	value=1;
    if z(1) < 21.7 
    	value=-1;
    end