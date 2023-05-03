% Given experimental data
t_exp = 10:10:60;
c_exp = [3.4 2.6 1.6 1.3 1.0 0.5];

% Expected function
t_func = [0:.5:70]
c_func = 4.84.*exp(-0.034*t_func)

% Plot
plot(t_exp,c_exp,'rd')
hold on
plot(t_func,c_func,'g--')
hold on
title('Degradation of Aqueous Bromide')
xlabel('Time (min)')
ylabel('Concentration (ppm)')
grid
legend('Experimental Data','Expected Data')