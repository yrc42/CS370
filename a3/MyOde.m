%
%function [t, y] = MyOde(f, tspan, y0, h, event)
%
% Numerically solves the initial value problem
%
%    dy(t)/dt = f(t,y)
%        y(0) = y0
%
% using the Modified Euler time-stepping method.
%
% Input
%   f       handle to a Matlab dynamics function with calling sequence
%              dydt = f(t, y)
%   tspan   1x2 vector giving the start and end times, [start end]
%   y0      initial state of the system (as a column vector)
%   h       the time step to use (this is not adaptive time stepping)
%   events  handle to a Matlab event function with calling sequence
%              val = events(t, y)
%           The computation stops as soon as a negative value is
%           returned by the event function.
%
% Output
%   t       column-vector holding time stamps
%   y       holds one state vector per row (corresponding
%           to the time stamps)
%
%   Notes:
%       - t and y have the same number of rows.
%
%       - The first element of t should be tspan(1), and the first
%         row of y should be the initial state, y0.
%
%       - If the computation was stopped by the triggering of an event,
%         then the last row of t and y should correspond to the
%         time that linear interpolation indicates for the zero-crossing
%         of the event-function.
%
function [t, y] = MyOde(f, tspan, y0, h, events)

    N = ceil( ( tspan(2) - tspan(1) ) / h ); % max number of time steps
    
    m = length(y0); % Number of state variables
    
    % Initialize output arrays
    t = zeros(N,1);
    y = zeros(N,m);
    
    % To use the function handle stored in f, simply use
    %   f(time, state)
    % where time is a scalar, and state is a column-vector.
    % Similarly, you can call the event function using
    %   event(time, state)
    
    % *** YOUR CODE HERE ***
    y(1,:) = y0';
    t(1) = tspan(1);
    n=1;
    while n<=N
		t(n+1)=t(n)+h;
		f0 = f(t(n), y(n,:)')';
		y(n+1,:) = y(n,:)+ h*f0;
		f1 = f(t(n+1), y(n+1,:)')';
		y(n+1,:) = y(n,:)+1/2* h*(f0+f1);
		n=n+1;
		if events(t(n),y(n,:))< 0
			break
		end
	end
	
    t=t(1:n);
    y=y(1:n,:);
    
    
    
    