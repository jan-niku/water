% this is a driver script for the water modeling project

% get a linear approximation of flow
% matching parameters of the given data
lin_approx = lin_mod(93300, 3175, drainrate, bothrate, 1);

% plot both against each other
plot(lin_approx);
hold on
plot(t,l);
hold off

% TODO: approximate total usage linearly
sec_in_day = 60 * 60 * 24;
use = @(x) -drainrate * x;
lin_usage = volChange(0, use(sec_in_day)) % does this seem right?



