function evenSegments = extractEvenSegments(segments)
    % extractEvenSegments extracts even-numbered segments from the input cell array.
    %
    % Inputs:
    %   - segments: A cell array containing the control points of the curve segments.
    %
    % Outputs:
    %   - evenSegments: A cell array containing the even-numbered segments.

    evenSegments = segments(2:2:end); % Extract segments at even indices

    % include the following loop, if you want them displayed

    disp('Even-numbered segments:');
for i = 1:length(evenSegments)
    disp(['Segment ' num2str(i*2) ':']);
    disp(evenSegments{i});
end



end