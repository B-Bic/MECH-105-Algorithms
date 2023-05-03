% Specify the variables needed to solve this problem (ie. height of each section, diameter, radiaus, ...)
%   It is alwasy easier to work with variables (diameter_cyl = 25) than to use numbers everywhere, since a 
%   diameter indicates something specific but the number 25 could mean anything


% Specify the height of the water
h = 20
% You can comment / uncomment lines below for testing. This will overwrite the previous line for h = 20.
% For submission, make sure all of the following lines are commented out and h = 20! (OR IT IS MARKED AS WRONG)
%h = 5
%h = 19
%h = 47
%h = -1

    
% Now compute the volume. Using conditional statments you will want to first check the height makes sense,
% and then solve the volume depending on what portion of the tank has been filled.
% Make sure that your volume is stored in the variable v! (OR IT WILL BE MARKED AS WRONG)
% You may find it more convenient to move v around in you code, it is only given here to indicate what variable to use.
r1 = 12.5;
r2 = 12.5 + ((h-19)/tand(54.5));
h1 = 19;
h2 = (r2*tand(54.5));
h3 = (r1*tand(54.5));
if 0<=h && h<=19
    v = pi()*r1^2*h
else if h > 19    
    v = (pi()*(r1)^2*h1) + ((pi()*(r2)^2*(h2/3)) - (pi()*(r1)^2*(h3/3)))
else h > 0 || h < 33
    error('Does not fit parameters of container')
end
end
fprintf('volume equals %c', v)