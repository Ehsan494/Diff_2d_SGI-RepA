
% Function to find zeros of the visibility function
function zeros = find_zeros()
    % Define the parameter samples
    t_samples = 0:0.01:1;
    num_samples = length(t_samples);
    
    % Evaluate the visibility function at the samples
    a_values = arrayfun(@Lastvisibility_function, t_samples);
    
    zeros = [];
    
    % Iterate through the samples and check for sign changes
    for i = 1:num_samples-1
        if a_values(i) * a_values(i+1) < 0
            % when sign change detected, compute the zero using linear interpolation
            t1 = t_samples(i);
            t2 = t_samples(i+1);
            a1 = a_values(i);
            a2 = a_values(i+1);
            
            % Linear interpolation to find the zero
            zero = t1 - a1 * (t2 - t1) / (a2 - a1);
            zeros = [zeros, zero];
        end
    end
end


