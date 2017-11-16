%
% function pwc = MySpline(x, y)
%
% Input:
%
%   x and y are vectors (same size) of x-values and y-values,
%   corresponding to points in the xy plane.  The x-values
%   must be in increasing order.
%
% Output:
%
%   pwc is a "piecewise-cubic" Matlab structure containing 3
%   arrays, a, b, and c.  You access them using
%     >> pwc.a(5) = ...
%   a, b and c are vectors of parameters corresponding to the
%   alternate form of the cubic polynomial (see class notes).
%   Note that "a" is indexed starting at 1, so a_0 from the class
%   notes refers to a(1), etc.  The vectors "b" and "c" are
%   indexed the same as in the class notes.
%
%   Hence...
%     a(1) = a_0
%     a(2) = a_1          b(1) = b_1        c(1) = c_1
%          :                   :                 :
%     a(n) = a_(n-1)    b(n-1) = b_(n-1)  c(n-1) = c_(n-1)
%
%   The polynomial piece is evaluated using
%
%     p_k(x) = a(k)*(x(k+1)-xvals(m))^3/(6*hk) + ...
%              a(k+1)*(xvals(m)-x(k))^3/(6*hk) + ...
%              b(k)*(x(k+1)-xvals(m)) + c(k)*(xvals(m)-x(k));
%
%   where hk = x(k+1) - x(k).  See the function
%
%     EvaluateMySpline
%
%   for more details.
%
%
function pwc = MySpline(x, y)

    n = length(x);
    pwc.a = zeros(n,1);
    pwc.b = zeros(n-1,1);
    pwc.c = zeros(n-1,1);

    % Your code here
    h = zeros(n-1,1);
    slope = zeros(n,1);
    T = zeros(n);
    for i =  1: n-1
        h(i) = x(i+1)-x(i);
    end
    for j=1:n-2:
        slope(j) = ((y(j+2)-y(j+1))/h(j+1))-((y(j+1)-y(j))/h(j));
    end

    for m=2:n-1
        T(m,m-1) = h(m-1)/6;
        T(m,m) = (h(m-1)+h(m))/3;
        T(m,m+1) = h(m)/6
    end

    T(1,1) = 1;
    T(n,n) =1;
    pwc.a = T/r;
    for k=1:n-1
        pwc.b(k) = y(k)/h(k) -(pwc.a(k)*h(k))/6;
        pwc.c(k) = y(k+1)/h(k) - (pwc.a(k+1)*h(k))/6;
    end
