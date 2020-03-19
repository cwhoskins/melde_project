function [beamwidth] = compute_beamwidth(u_theta, theta)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
delta_theta = pi/numel(theta);
half_max_u = 0.5 *max(u_theta);
half_dif = u_theta(0);
half_idx = 0;
for idx = 0 : numel(u_theta)
    if(u_theta(idx) == max(u_theta))
        max_theta_idx = theta(idx);
    elseif (abs(utheta(idx)-half_max_u) < half_dif)
        half_dif = abs(u_theta(idx)-half_max_u);
        half_idx = idx;
    end
end
beamwidth = 2 * delta_theta * abs(max_theta_idx - half_idx);
end

