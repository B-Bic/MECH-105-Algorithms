% Function parameters
q0 = 10;
R = 60;
L = 9;
C = 0.00005;

% Use linspace to create an array of 100 points between 0 and 0.8
t = linspace(0,0.8,100)

% Calculate the values of q
q = q0*exp((-R*t)/(2*L)).*cos(sqrt((1/(L*C))-(R/(2*L))^2)*t)

% Plot q vs t
subplot(1,2,1)
plot(t,q,'g')
grid
title('Charge vs. Time')
xlabel('Time')
ylabel('Charge')
% Make the capacitor 10x bigger
c=.0005
q2 = q0*exp((-R*t)/(2*L)).*cos(sqrt((1/(L*c))-(R/(2*L))^2)*t)

% Plot q2 vs t
subplot(1,2,2)
plot(t,q2)
grid
title('Charge vs. Time (Capacitor x10')
xlabel('Time')
ylabel('Charge')