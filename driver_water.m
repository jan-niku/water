% this is a driver script for the water modeling project

% populate workspace first

% get a linear approximation of flow
% matching parameters of the given data
lin_approx = lin_mod(93300, 3175, drainrate, bothrate, 1);

% plot both against each other
plot(lin_approx);
hold on
plot(t,l,'o');
hold off
title('Linear Approximation vs. Provided Data')
xlabel('Time since First Measurement (seconds)')
ylabel('Water Height (0.01 ft)')
legend('Model','Given Data','Location','northwest')
figure()

% TODO: approximate total usage linearly
%sec_in_day = 60 * 60 * 24;
%use = @(x) -drainrate * x;
%lin_usage = volChange(0, use(sec_in_day)) % does this seem right?

% EVALUATION

% create an array to hold the errors
errors = [];

% for each given time in the original data
for t_index = 2:length(t)
    % check if we have level information
    if l(t_index) ~= -1
        % grab the time and level
        time = t(t_index);
        level = l(t_index);
        
        % compare against the model
        % TODO: if we do not wish to hardcode timestep 1 in lin_mod,
        % this will need to be changed to account for that
        errors(end+1) = lin_approx(time) - level;
    end
end
avgerr = nanmean(errors);

plot(errors,'o')
set(gca,'xtick',[])
hold on
%plot(nanmean(errors)*ones(length(errors),1))
yline(avgerr, '-', ['Mean Error=16'], 'color', 'red')
hold off
title('Model Error')
ylabel('Relative Error')
legend('Relative Error','Mean Error','Location','northeast')
figure()


plot(t,deltaV, 'o')
hold on
yline(nanmean(deltaV),'-', ['Average Height Change'], 'color', 'red')
set(gca,'xtick',[])
ylabel('Change in Height (0.01 feet)')
title('Variability in Usage Rates')
hold off
