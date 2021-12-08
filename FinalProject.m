Time = [0, 3316, 6635, 10619, 12937, 17921, 21240, 25223, 28543, 32284, 35932, 39332, 39435, 43318, 46636, 49953, 53936, 57254, 60574, 64554, 68535, 71854, 75021, 79254, 82649, 85968, 89953, 93270];
Level = [3175, 3110, 3054, 2994, 2947, 2892, 2850, 2797, 2752, 2697, 0, 0, 3550, 3445, 3350, 3260, 3167, 3087, 3012, 2927, 2842, 2767, 2697, 0, 0, 3475, 3397, 3340];
scatter(Time, Level)

x = linspace(0,50)

%definitely needs some refinement - wondering if we need to somehow feed in
%time to this...
%funct1 has the right shape, just want it to be periodic

funct = @(x) (heaviside(35-x)).*cos(x);
funct1 = @(x) (heaviside(35-x)-heaviside(27-x)).*exp(-x)*2*10^(12);
plot(x, funct(x)+funct1(x))
figure;
plot(x, funct1(x))

% xprime = @(x,y) a*x-b*x*y;
% yprime = @(x,y) h*x*y-k*y;

