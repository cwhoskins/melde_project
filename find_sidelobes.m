function [sidelobe,sidelobe_theta] = find_sidelobes(u_theta, theta)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[peaks, locs] = findpeaks(u_theta);

sidelobe = peaks;
sidelobe_theta = theta(locs);

end

