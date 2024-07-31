function segments = splitBezier2(controlPoints, tValues)
    % splitBezier splits a Bézier curve at multiple parameter values.
    %
    % Inputs:
    %   - controlPoints: An n x 2 matrix where each row represents a control point.
    %   - tValues: A vector of parameter values at which to split the curve.
    %
    % Outputs:
    %   - segments: A cell array containing the control points of the resulting curve segments.
    
    % Sort the parameter values to ensure correct sequential splitting
    tValues = sort(tValues);
    
    % Initialize a cell array to hold the control points of the split segments
    segments = {};
    remainingPoints = controlPoints;
    
    for k = 1:length(tValues)
        t = tValues(k);
        
        % Split the curve at t
        [left, right] = splitBezierAtT(remainingPoints, t);
        
        % Store the left segment
        segments{end+1} = left;
        
        % Update the remaining points to the right segment for the next iteration
        remainingPoints = right;
    end
    
    % Add the final segment
    segments{end+1} = remainingPoints;
end

function [left, right] = splitBezierAtT(controlPoints, t)
    % splitBezierAtT splits a Bézier curve into two segments at parameter t.
    %
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
    
    % Reverse the order of points in right segment
    right = flipud(right); 
end


