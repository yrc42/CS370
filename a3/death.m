%z(1)= T, z(2)= A, z(3)=B	 
function dZdt = death(t, z)
	if z(1)>=17 && z(1)<=27
		dZdt = [-0.2*(z(1)-AmbientTemp(t))+(z(2)+z(3))/100; 0; 
		0.001*(z(1)-17)^2*(1- exp(0.05*(z(1)-27)))*(z(3)*(50-z(3)))];
	elseif z(1)>27 && z(1)<29
	 	dZdt = [-0.2*(z(1)-AmbientTemp(t))+(z(2)+z(3))/100; 0; 0];
    elseif z(1)>=29 && z(1)<=45
		dZdt = [-0.2*(z(1)-AmbientTemp(t))+(z(2)+z(3))/100; 
		0.0008*(z(1)-29)^2*(1- exp(0.008*(z(1)-45)))*(z(2)*(50-z(2)));0];
    end   
	
