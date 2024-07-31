function [left, right] = splitBezierAtT(controlPoints, t)
    % splitBezierAtT splits a Bézier curve into two segments at parameter t.
    %Yay!! it works! 
    % Inputs:
    %   - controlPoints: An n x 2 matrix where each row represents a control point.
    %   - t: The parameter value at which to split the curve.
    %
    % Outputs:
    %   - left: Control points of the left segment.
    %   - right: Control points of the right segment.

    n = size(controlPoints, 1); % Number of control points
    left = zeros(n, 2); % Initialize left segment
    right = zeros(n, 2); % Initialize right segment
    
    points = controlPoints; % Initialize points for de Casteljau's algorithm
    
    for r = 1:n
        
        left(r, :) = points(1, :); % The first point of current segment
        for i = 1:n-r
            points(i, :) = (1 - t) * points(i, :) + t * points(i + 1, :); % Interpolation
        end
        right(r, :) = points(n-r+1, :); % The last point of current segment
    end
    
    
    right = flipud(right); % Reverse the order of points in right segment
end


