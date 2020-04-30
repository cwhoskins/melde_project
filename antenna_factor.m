function [antenna_factor] = antenna_factor(theta_set, num_elements, k, d, amplitude, phase)
%Antenna Array: Computes the antenna array pattern with uniform spacing
num_samples = numel(theta_set);
n = 0:(num_elements-1);
af = zeros(1, num_samples);
for idx = 1:num_samples
    theta = theta_set(idx);
    phi_exp = exp(1i .* n .* (k * d * cosd(theta)));
    phase_exp = exp(1i .* phase);
    af(idx) = sum(phi_exp .* phase_exp .* amplitude); 
end
antenna_factor = af;
end