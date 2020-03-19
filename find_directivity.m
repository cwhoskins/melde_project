function [directivity] = find_directivity(u_theta, theta)
%find_directivity Calculates the directivity of the given data set

%Calculate the change in radians between units
delta_theta = pi/numel(theta);
delta_phi = 2 * pi;
power_integrand = u_theta .* sin(theta) * delta_theta * delta_phi;
power = trapz(power_integrand);
directivity = ((4 * pi) / power);

end

