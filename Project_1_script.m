
%Variables
%Isotropic Radiator
u = ones(1,360);
theta_deg = 1:360;
theta = theta_deg .* (pi/180);
%Wavelength
lambda = 0.03;
k = 2*pi / lambda;
d = lambda / 2;
num_elements = 2;
amp = ones(1, num_elements);
phase = 0:(num_elements-1);
phase = phase .* (pi/num_elements); 
%Calculate Antenna Factor
af = antenna_factor(num_elements, k, d, amp, phase);
%Compute U of the array
u_array = u .* af;
%Convert U to dB
polarplot(theta, abs(u_array_norm));
u_array_norm = u_array ./ max(u_array);
u_array_db = 10 .* log10(abs(u_array_norm));
%plot(theta_deg, u_array_db);
%Compute Directivity
%directivity = find_directivity(u_array, theta);
%Compute Beamwidth
%beamwidth = compute_beamwidth(u, theta);
%Compute Sidelobes
%[sidelobes, sidelobe_locs] = find_sidelobes(u, theta);
