% Define the segments
segment1 = [
  120.0000   30.0000;
  123.0000   33.0000;
  125.1000   37.0800;
  126.4200   42.0140
];

segment2 = [
  126.4200   42.0140;
  129.9840   55.3358;
  127.8618   74.8833;
  122.4154   96.2080
];

segment3 = [
  122.4154   96.2080;
  116.0612  121.0869;
  105.1823  148.3849;
  93.5295  171.0382
];

segment4 = [
  93.5295  171.0382;
  85.3726  186.8955;
  76.8364  200.4768;
  69.2075  209.3594
];

segment5 = [
  69.2075  209.3594;
  66.2649  212.7855;
  63.4572  215.5126;
  60.8584  217.4016
];

segment6 = [
  60.8584  217.4016;
  60.5697  217.6115;
  60.2835  217.8110;
  60.0000  218.0000
];

% Combine segments into a cell array for easy iteration
segments = {segment1, segment2, segment3, segment4, segment5, segment6};

% Define original control points
controlPoints = [120.0,  30.0; 150, 60; 90.0, 198.0; 60.0, 218.0];

% Plot each segment
figure;
hold on;
colors = lines(length(segments)); % Get different colors for each segment

for i = 1:length(segments)
    seg = segments{i};
    % Plot the control points of the segment
    plot(seg(:,1), seg(:,2), 'o', 'MarkerFaceColor', colors(i,:), 'MarkerEdgeColor', 'k');
    % Plot the Bézier curve segment
    plotBezierSegment(seg, colors(i,:));
    % Plot the control polygon of the segment
    plot(seg(:,1), seg(:,2), '--', 'Color', colors(i,:));
    % Add title for each segment
    text(mean(seg(:,1)), mean(seg(:,2)), sprintf('Segment %d', i), 'Color', colors(i,:));
end

% Plot original control points
plot(controlPoints(:,1), controlPoints(:,2), 'ko', 'MarkerFaceColor', 'r');
plot(controlPoints(:,1), controlPoints(:,2), 'k--', 'LineWidth', 1);

title('Bézier Curve Splitted Segments with Original Control Points');
xlabel('X');
ylabel('Y');
axis equal;
hold off;


% Function to evaluate and plot Bézier curve segment
function plotBezierSegment(controlPoints, color)
    t = linspace(0, 1, 100);
    n = size(controlPoints, 1) - 1;
    bezierCurve = zeros(length(t), 2);
    for i = 0:n
        binomialCoeff = nchoosek(n, i);
        for j = 1:length(t)
            bezierCurve(j, :) = bezierCurve(j, :) + binomialCoeff * (1 - t(j))^(n - i) * t(j)^i * controlPoints(i + 1, :);
        end
    end
    plot(bezierCurve(:,1), bezierCurve(:,2), 'Color', color, 'LineWidth', 1.5);
end


