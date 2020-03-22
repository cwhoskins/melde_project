function [beamwidth] = compute_beamwidth(u_theta, theta)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
delta_theta = pi/numel(theta);
for idx = 1 : numel(u_theta)
    if(u_theta(idx) == max(u_theta))
        max_theta_idx = idx;
    end
end
half_max_u = 0.5 *max(u_theta);
half_dif = max(u_theta) - u_theta(1);
half_idx = 0;
for idx = 1 : numel(u_theta)
    if (abs(u_theta(idx)-half_max_u) < half_dif)
        half_dif = abs(u_theta(idx)-half_max_u);
        half_idx = idx;
    end
end
beamwidth_rad = 2 * delta_theta * abs(max_theta_idx - half_idx);
beamwidth = beamwidth_rad * (180/pi);
end

