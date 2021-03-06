function [sidelobe,sidelobe_theta] = find_sidelobes(u_theta, theta)
    %UNTITLED6 Summary of this function goes here
    %   Detailed explanation goes here
    [peaks, locs] = findpeaks(u_theta);

    sidelobe = peaks;
    sidelobe_theta = theta(locs) .* (180/pi);
    %Check if zero index is a peak
    zero_value = u_theta(1);
    pi_value = u_theta(numel(u_theta));
    if(zero_value > u_theta(2) && zero_value > pi_value)
        sidelobe = [sidelobe zero_value];
        sidelobe_theta = [sidelobe_theta 0];
    end
    if(pi_value > zero_value && pi_value > u_theta(numel(u_theta)-1))
        sidelobe = [sidelobe pi_value];
        sidelobe_theta = [sidelobe_theta 180];
    end
end

