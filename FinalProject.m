Time = [0, 3316, 6635, 10619, 12937, 17921, 21240, 25223, 28543, 32284, 35932, 39332, 39435, 43318, 46636, 49953, 53936, 57254, 60574, 64554, 68535, 71854, 75021, 79254, 82649, 85968, 89953, 93270];
Level = [3175, 3110, 3054, 2994, 2947, 2892, 2850, 2797, 2752, 2697, 0, 0, 3550, 3445, 3350, 3260, 3167, 3087, 3012, 2927, 2842, 2767, 2697, 0, 0, 3475, 3397, 3340];
scatter(Time, Level)

x = linspace(0,50)

levels = @(t) exp(-0.035*(heaviside(45-t)-heaviside(27-t)).*(t-27)) + exp(-(heaviside(27-t).*t*0.025));
flow = @(t) -0.035*(heaviside(45-t)-heaviside(27-t)).*exp(-0.035*(heaviside(45-t)-heaviside(27-t)).*(t-27))+(-0.025)*heaviside(27-t).*exp(-(heaviside(27-t).*t*0.025));
plot(x,levels(x))
figure;
plot(x,flow(x))

%definitely needs some refinement - wondering if we need to somehow feed in
%time to this...
%funct1 has the right shape, just want it to be periodic

% funct = @(t) (heaviside(35-t)).*cos(t);
% funct = @(t) (heaviside(35-t)).*exp(0.5*t);
% funct1 = @(t) (heaviside(50-t)-heaviside(27-t)).*exp(-0.25*t) + (1-(heaviside(50-t)-heaviside(27-t))).*exp(0.1*t);
% plot(x, funct(x).*funct1(x))
% figure;
% plot(x, funct1(x))
% 
% funct2 = @(t) sin(0.5*t).*cos(t).*exp(-t/5);
% figure;
% plot(x,funct2(x))

% xprime = @(x,y) a*x-b*x*y;
% yprime = @(x,y) h*x*y-k*y;

