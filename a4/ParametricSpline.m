% function [x_cs, y_cs, t] = ParametricSpline(Sx,Sy)
%
%   Takes an array of x- and y-values, and returns a parametric
%   cubic spline in the form of two piecewise-cubic data structures
%   (one for the x-component and one for the y-component), as well as
%   the corresponding parameter values.
%
%   Input:
%    Sx   array of x-values
%    Sy   array of y-values
%
%   Output:
%    x_cs piecewise-cubic data structure for x-component
%    y_cs piecewise-cubic data structure for x-component
%    t    parameter values for spline knots
%
%    Note: See the help for MySpline for a description of the
%          piecewise-cubic data structure.
%
function [x_cs, y_cs, t] = ParametricSpline(Sx,Sy)

    N = length(Sx); % How many points?
    t = zeros(1,N);
    x_cs = [];
    y_cs = [];

    t(1)=1.0;
    for I = 1:N-1:
      t(I+1) = t(I) + sqrt((Sx(I+1)-Sx(I))^2 + (y(I+1)-y(I))^2);
    end
    xpp = spline(t,Sx);
    ypp = spline(t, Sy);
