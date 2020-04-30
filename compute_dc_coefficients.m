function [coefficients] = compute_dc_coefficients(num_elements,sidelobe_level_db)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = num_elements - 1;
sidelobe_level = sidelobe_level_db;
u_0 = cosh((1/m)*acosh(sidelobe_level));
u_p = ones(1,m);
psi_p = ones(1, m);
factor = pi / (2*m);
for idx = 1 : m/2
    u_p(idx) = -cos(((2*idx)-1)*factor);
    psi_p(idx) = 2*acos(u_p(idx)/u_0);
    u_p(idx+(m/2)) = -cos(((2*idx)-1)*factor);
    psi_p(idx+(m/2)) = 2*acos(u_p(idx+(m/2))/u_0);
end
coefficients = 0;
end

