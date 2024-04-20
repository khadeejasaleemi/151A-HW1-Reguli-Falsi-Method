%Reguli-Falsi method
clear all
close all
tic

a=1.0; %left boundary of the interval
b=2.0; %right boundary of the interval

tol = 1e-6; %tolerance
Nmax = 100; %max number of iterations

f=@(x) x^6-x-1; %function for which we want to find a zero

i = 1; %initialize iteration counter
success = 0; %until we converge success = 0

while (i<=Nmax) && (success==0) %while the max number of iterations is not reached and success is 0
    root=a-f(a)*((b-a)/(f(b)-f(a))); %set zero of the line passing through (a, fa) and (b,fb)
    %mid(i)=root; %save current midpoint in a vector
    froot = f(root); %find the value of f at root
    if (abs(froot)<tol) %if tolerance is reached, set success=1
        success = 1;
    else
        i=i+1; %else increase iteration number
        fa=f(a); %compute f at left boundary of current interval
        if (sign(fa)*sign(froot)<0) %update the interval based on sign of f(a)*f(root)
            b=root;
        else
            a=root;
        end
    end
end

if (success == 1)
    disp('success!');
else
    disp('did not converge');
end

i %print number of iterations needed to converge
format long
display(root) %print approximated solution
toc

tic
format long
numericalsolution=fzero(@(x) x^6-x-1,1.0) %use fzero to find the "exact" numerical solution
toc

