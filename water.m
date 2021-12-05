% some stuff for water project
format short g

% time values from table 1
% all in seconds
t = [0, 3316, 6635,...
     10619, 13937, 17921,...
     21240, 25223, 28543,...
     32284, 35932, 39332,...
     39435, 43318, 46636,...
     49953, 53936, 57254,...
     60574, 64554, 68535,...
     71654, 75021, 79254,...
     82649, 85968, 89953,...
     93270];

% heights given from table 1
% all in hundreths of feet
% a -1 entry indicates pumping
l = [3175, 3110, 3054,...
     2994, 2947, 2892,...
     2850, 2797, 2752,...
     2697, -1, -1,...
     3550, 3445, 3350,...
     3260, 3167, 3087,...
     3012, 2927, 2842,...
     2797, 2697, -1,...
     -1, 3475, 3397,...
     3340];

% plot the raw data
plot(t,l)

% create a plot of delta volume per hour
deltaV = zeros(1, 28);

for i = 2:28
    deltaV(i) = l(i) - l(i-1);
end

% plot the deltaV
%plot(t, deltaV)

% print a summary table
table(t',l',deltaV')

% find an average of the sensible deltaV's
good = 0; % holds the sensible values
low = -500; % ignore changes below this
high = 0; % ignore changes above this
deltaVmod = []; % an empty holder array
deltaTmod = []; % holds the good delta T's

%populate deltaV
for i = 1:length(deltaV)
    if high > deltaV(i)
        if low < deltaV(i)
            good = good + 1;
            deltaVmod(good) = deltaV(i);
            deltaTmod(end+1) = t(i)-t(i-1);
        end
    end
end

% get average changes per second
deltaVavgs = zeros(length(deltaTmod),1);
for i = 1:length(deltaTmod)
    deltaVavgs(i) = deltaVmod(i)./deltaTmod(i);
end

% this is the mean of delta v per second over good values
% mean(deltaVavgs) % -0.019532
% we want to treat this as slope of one section


% TODO: find the fill rate similarly

% TODO: create a single period by averaging around similar values

% TODO: fourier series periodic extension type deal

%function [time, levels] = model(times, startLev)
% MODELLING STUFF HERE
%end










