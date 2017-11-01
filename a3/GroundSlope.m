% function s = GroundSlope(d)
%
% Returns the ground slope at horizontal distance d from the golf tee.
%
function s = GroundSlope(d)
    s = -5/4*sin(d/4);
    
    