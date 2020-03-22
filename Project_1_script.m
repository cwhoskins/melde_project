
%Variables
%Isotropic Radiator
u = ones(1,180);
theta_deg = 1:180;
theta = theta_deg .* (pi/180);
%Wavelength
lambda = 0.03;
k = 2*pi / lambda;
d = lambda / 2;
num_elements = 8;
amp = ones(1, num_elements);
%phase = 0:(num_elements-1);
%phase = phase .* (pi/num_elements);
phase = pi / num_elements;
%Calculate Antenna Factor
af = antenna_factor(numel(u), num_elements, k, d, amp, phase);
%Compute U of the array
u_array = u .* af;
%Convert U to dB
u_array_norm = abs(u_array ./ max(u_array));
u_array_db = 10 .* log10(u_array_norm);
plot(theta_deg, u_array_norm);
%Estimate Directivity based on book formula
directivity_formula = 2 *((pi/2) - acos(1.391 * lambda / (pi * num_elements * d)))
%Compute Directivity
directivity = find_directivity(u_array_norm, theta)
%Compute Beamwidth
beamwidth = compute_beamwidth(u_array_norm, theta)
%Compute Sidelobes
[sidelobes, sidelobe_locs] = find_sidelobes(u_array_norm, theta)
