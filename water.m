% A linear approximation for water flow in a tank
% a simple approach to the problem proposed in
% https://www.comap.com/undergraduate/contests/matrix/PDF/1991/1991B.pdf

format short g % nice round values

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
     2697, NaN, NaN,...
     3550, 3445, 3350,...
     3260, 3167, 3087,...
     3012, 2927, 2842,...
     2797, 2697, NaN,...
     NaN, 3475, 3397,...
     3340];

% plot the raw data
% plot(t,l)

% create a plot of delta volume per hour
deltaV = zeros(1, 28);

for i = 2:28
    deltaV(i) = l(i) - l(i-1);
end

% plot the deltaV
% plot(t, deltaV)
% print a summary table
% table(n',t',l',deltaV')

% find an average of the sensible deltaV's
good = 0; % holds the sensible values
low = -500; % ignore changes below this
high = 0; % ignore changes above this
deltaVmod = []; % an empty holder array
deltaTmod = []; % holds the good delta T's

% populate delV
% TODO confirm we arent artificially elevating the slope of the
% TODO filling function by having positive values in here 
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
% this is only good for pump off

% we find these two slopes directly:
% keep in mind these are the SUM of two functions:
% the pump function and the drain function
% we need to account for this still!
drainrate = mean(deltaVavgs);

% first pump:
% note: these values are averages between last valid measurement
% and when the pump was seen on
% TODO: TRIPLE CHECK AN AVERAGE MAKES SENSE HERE
% TODO: IS IT EASIER TO JUST EXTRAPOLATE LINEARLY WHEN IT SHOULD TURN ON?
tpump1 = 39384 - 34108;

% as the pump stopped halfway between the first valid measurement
% and the pump on non-measurement, we add as draining which would have 
% occured
vchange1 = 3550 - (2697 + drainrate*(35932-32284)/2);
delVpump(1) = vchange1/tpump1;

% second pump
% similarly as above, see notes and todo's
tpump2 = 84309 - 77138; % averages between points
vchange2 = 3475 - drainrate*(85968-82649)/2 - 2697;
delVpump(2) = vchange2/tpump2;

% this is the mean of pump dels
bothrate = mean(delVpump); % this is 0.095177

% assuming both linear, we can account for drainage rate to find
% the 'true' linear pump rate
pumprate = mean(delVpump) - drainrate;

% find our filling rate (with draining, so both rates combined)
time2fill = (3550-2700)/bothrate;






