
tspan = [0:1:100];

x(1) = 10; 
y(1) = 10;
u0 = [x(1) y(1)]';   
    
[t,u] = ode45(@system,tspan,u0); 

figure
hold on
plot(t,u(:,1))
plot(t,u(:,2))
legend("prey","preadator")


t = [0, 3316, 6635,10619, 13937, 17921, 21240, 25223, 28543, 32284, 35932, 39332, 39435, 43318,...
    46636, 49953, 53936, 57254, 60574, 64554, 68535, 71654, 75021, 79254, 82649, 85968, 89953, 93270];

% heights in hundreths of feet -1 indicates pumping
l = [3175, 3110, 3054, 2994, 2947, 2892, 2850, 2797, 2752, 2697, -1, -1, 3550, 3445,... 
    3350, 3260, 3167, 3087, 3012, 2927, 2842, 2797, 2697, -1, -1, 3475, 3397, 3340];

figure
plot(t,l)



function dudt=system(t,u) %u = [x,y]

a = 1.1; % prey growth rate
b = 0.4; % prey interation decay rate
c = 0.1; % preadtor interaction growth rate
d = 0.1; % preadtor decay rate

x = u(1);
y = u(2);
dudt(1) = a*x -b*x*y;  %prey
dudt(2) = c*x*y - d*y; %predator

dudt = dudt';
end 


