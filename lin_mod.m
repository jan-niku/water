function[levels] = lin_mod(time, level, drainrate, bothrate, snaptime)
    
    steps = 0; % weve gone 0 seconds
    pumpstate = 0; % pumps not on
    levels = [];
    times = [];

    while steps < time
        
        if level < 2700 % check if pump should already be on 
            pumpstate = 1;
        end

        if pumpstate == 1 % if pumps on
            level = level + bothrate; % were filling
            steps = steps + 1; % always increment after filling
            if level > 3550 % check the float
                pumpstate = 0; % if its good, turn it off
            end
        
        else

            % no pump
            level = level + drainrate;
            steps = steps + 1;

        end
        
        % this controls the timestep for the return vector
        if mod(steps, snaptime) == 0
            levels(end+1) = level;
            times(end+1) = steps;
        end

    end

end
