% Constants for the massive body and photon
G = 6.67430e-11; % gravitational constant in m^3 kg^-1 s^-2
M = 5.972e24; % mass of Earth in kg
R = 6.371e6; % radius of Earth in meters
c = 2.998e8; % speed of light in m/s
f0 = 4e14; % original frequency in Hz (visible light)

% Acceleration due to gravity
g = G * M / R^2;

% Distance photon travels away from the surface, up to 20,000 km
s = linspace(0, 2e7, 200); % Distance array from 0 to 20,000 km

% Calculating frequency shift for color representation
fs = f0 * exp(-g .* s ./ (c^2 * (1 + s ./ R)));

% Setup the figure for animation
fig = figure;
set(fig, 'Position', [100, 100, 800, 600]); % Adjust figure size for better visibility

% Preparing the video writer
video = VideoWriter('GravitationalRedshiftAnimation', 'MPEG-4');
open(video);

% Animation loop for each distance
for i = 1:length(s)
    plot(s(1:i)/1e3, fs(1:i), 'LineWidth', 2); % Plotting frequency vs. distance
    xlim([0, s(end)/1e3]); % X limits in km
    ylim([min(fs), max(fs)]); % Y limits based on frequency values
    xlabel('Distance from surface (km)');
    ylabel('Frequency (Hz)');
    title('Visualization of Gravitational Redshift');
    
    drawnow; % Update the plot
    frame = getframe(fig); % Capture the frame, ensuring the figure is referenced
    writeVideo(video, frame); % Add the frame to the video
end

close(video); % Close the video writer