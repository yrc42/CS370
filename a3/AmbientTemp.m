%ambiant temperature
function Ta = AmbientTemp(time)
	if time>7.5 && time<19
		Ta = 22;
	elseif time>21 || time<7
		Ta = 16;
	elseif time>=7 && time<=7.5
		Ta = 16 + (22-16)/0.5*(time-7);
	else
		Ta = 22 - (22-16)/2*(time-19);
    end	 