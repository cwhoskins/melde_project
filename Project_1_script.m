
%Variables
%Isotropic Radiator
u = ones(1,1800);
theta_deg = (1:1800) ./ 10;
theta = theta_deg .* (pi/180);
%Wavelength
lambda = 0.03;
k = 2*pi / lambda;
d = lambda / 2;
num_elements = 19;
%test_phase = [pi 0 pi 0 pi 0 pi 0 pi 0 pi 0 pi 0 pi 0 pi 0 pi];
amp = ones(1,num_elements) %transpose(chebwin(num_elements, 25))
phase = ((num_elements-1)/2):((num_elements-1)/2);
phase = phase .* (pi/num_elements);
%phase = test_phase;
%Calculate Antenna Factor
af = antenna_factor(theta_deg, num_elements, k, d, amp, phase);
%Compute U of the array
u_array = u .* af;
%Convert U to dB
u_array_norm = abs(u_array ./ max(u_array));
u_array_db = 20 .* log10(u_array_norm);
plot(theta_deg, u_array_db);
xlim([0 180]);
ylim([-40 0]);
xlabel('Degrees');
ylabel('dB'); 
%Estimate Directivity based on book formula 6-42
directivity_formula = 2 * num_elements * (d / lambda);
directivity_formula = 10*log10(directivity_formula)
%Compute Directivity
directivity = find_directivity(u_array_norm, theta);
directivity = 10*log10(directivity)
%Estimate Beamwidth based on book formula
beamwidth_formula = (180/pi) * (2 *((pi/2) - acos(1.391 * lambda / (pi * num_elements * d))))
%Compute Beamwidth
beamwidth = compute_beamwidth(u_array_norm, theta)
%Compute Sidelobes
[sidelobes, sidelobe_locs] = find_sidelobes(u_array_norm, theta);
sidelobes_db = 20*log10(sidelobes)
sidelobe_locs
