% Constants for the massive body and photon
G = 6.67430e-11; % gravitational constant in m^3 kg^-1 s^-2
M = 5.972e24; % mass of Earth in kg
R = 6.371e6; % radius of Earth in meters
c = 2.998e8; % speed of light in m/s
f0 = 4e14; % original frequency in Hz (visible light)

% Acceleration due to gravity
g = G * M / R^2;

% Distance photon travels away from the surface, up to 20 million km
s = linspace(0, 2e7, 200); % Distance array from 0 to 20,000 km

% Calculating frequency shift for color representation
fs = f0 * exp(-g .* s ./ (c^2 * (1 + s ./ R)));
fs_normalized = (fs - min(fs)) / (max(fs) - min(fs)); % Normalize for color mapping

% Setup the figure for animation
figure(1);
set(gcf, 'Position', [100, 100, 800, 600]); % Adjust figure size for better visibility
axis square;
grid on;
xlim([-1, max(s)/1e6]); % X limits in million km
ylim([-1, 1]); % Y limits for simplicity
xlabel('Distance from surface (million km)');
ylabel('Y (arbitrary units)');
title('Visualization of Gravitational Redshift with Moving Mass');

% Plot the massive body
viscircles([0, 0], R/1e7, 'Color', 'b', 'LineWidth', 1.5); % Scaled down for visibility
hold on;

% Preparing the frames for the animation
frames(length(s)) = struct('cdata',[],'colormap',[]);

% Animation loop for moving mass and color shift
for i = 1:length(s)
    % Photon's position
    x = s(i) / 1e6; % Convert to million km for x-axis
    
    % Interpolating color from violet to red based on frequency shift
    color = [1-fs_normalized(i)/2, 0, fs_normalized(i) + (1-fs_normalized(i))/2]; % Interpolation from violet to red
    
    % Plot the moving mass with interpolated color
    scatter(x, 0, 100, 'filled', 'MarkerFaceColor', color);
    
    drawnow;
    
    % Capture the frame
    frames(i) = getframe(gcf);
    
    if i < length(s)
        clf; % Clear current frame to redraw
        viscircles([0, 0], R/1e7, 'Color', 'b', 'LineWidth', 1.5); % Redraw the massive body
        hold on;
        axis square;
        grid on;
        xlim([-1, max(s)/1e6]); % X limits
        ylim([-1, 1]); % Y limits
        xlabel('Distance from surface (million km)');
        ylabel('Y (arbitrary units)');
        title('Visualization of Gravitational Redshift with Moving Mass');
    end
end

% Create the animation video
video = VideoWriter('GravitationalRedshift2DVisualization_VioletToRed', 'MPEG-4');
open(video);
writeVideo(video, frames);
close(video);
hold off;