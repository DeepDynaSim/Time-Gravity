% Define symbolic variables
syms m0 c v mu real
syms E_normal P_normal E_tachyon P_tachyon
% Constants
c = 299792458; % Speed of light in m/s
m0 = 1; % Rest mass in kg
mu = m0*1i; % Imaginary mass for tachyon
% Normal particle equations
E_normal = (m0*c^2) / sqrt(1 - (v/c)^2);
P_normal = (m0*v) / sqrt(1 - (v/c)^2);
% Tachyon equations
E_tachyon = (mu*c^2) / sqrt((v/c)^2 - 1);
P_tachyon = (mu*v) / sqrt((v/c)^2 - 1);
% Velocity range: From 0 to twice the speed of light, normalized to c
v_range = linspace(0, 2*c, 1000);
% Initialize arrays to store results
E_normal_vals = zeros(1, length(v_range));
P_normal_vals = zeros(1, length(v_range));
E_tachyon_vals = zeros(1, length(v_range));
P_tachyon_vals = zeros(1, length(v_range));

% Compute values for each velocity
for i = 1:length(v_range)
    v_current = v_range(i);
    if v_current < c % Normal particles
        E_normal_vals(i) = double(subs(E_normal, {m0, c, v}, {1, 299792458, v_current}));
        P_normal_vals(i) = double(subs(P_normal, {m0, c, v}, {1, 299792458, v_current}));
    else % Tachyons
        E_tachyon_vals(i) = double(subs(E_tachyon, {mu, c, v}, {1i, 299792458, v_current}));
        P_tachyon_vals(i) = double(subs(P_tachyon, {mu, c, v}, {1i, 299792458, v_current}));
    end
end
% Plotting
figure;
subplot(2,1,1); % Energy plot
plot(v_range/c, E_normal_vals, 'b', v_range/c, abs(E_tachyon_vals), 'r--');
xlabel('Velocity (v/c)');
ylabel('Energy (E)');
legend('Normal Particle', 'Tachyon', 'Location', 'best');
title('Relativistic Energy vs. Velocity');
subplot(2,1,2); % Momentum plot
plot(v_range/c, P_normal_vals, 'b', v_range/c, abs(P_tachyon_vals), 'r--');
xlabel('Velocity (v/c)');
ylabel('Momentum (p)');
legend('Normal Particle', 'Tachyon', 'Location', 'best');
title('Relativistic Momentum vs. Velocity');
sgtitle('Relativistic Energy and Momentum for Normal Particles and Tachyons');