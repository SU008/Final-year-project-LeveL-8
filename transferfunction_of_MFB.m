%---measured resistors only 
clear all;
close all;

C = 100e-9; %100nF
R2 = 33e+3;  % kohms   (<-measured Resistance of R2 33e+3)
R1 = 14.72e+3; % kohms (<-measured Resistance of R1a    14.72e+3)
R3 = 20;
 



S_Numerator = -(R2*R3*C)/(R1+R3);
S = (2*R1*R3*C)/(R1+R3);
S2 = ((R2*R1*R3*C^2)/(R1+R3));





b = [ S_Numerator 0 ];% numerator top  
a = [S2 S 1 ];    % put in order-> s^2 S 1 


zeros = roots(b)% get real & imag values of zeros|b|x[n]|dips
poles = roots(a)% get real & imag values of poles|a|y[n]|peeks
fvtool(b,a)% mag response given a b values 

figure(1)% plots on filter visualization tool
hold on 
zplane(zeros,poles)% show poles on unit circle 

figure(2)% plots unit circle
H = tf(b,a)
figure(3)% bode plots 
bode(H)
%figure(22)
%zplane(b,a)
%figure(23)
%step(H)
%figure(24)
%impulse(H)




%%
%--with measured C's & R's


C1 = 95e-9;
C2 = 96.4e-9;
R2 = 33e+3;  % kohms   (<-measured Resistance of R2 33e+3)
R1 = 14.72e+3; % kohms (<-measured Resistance of R1a    14.72e+3)
R3 = 20;  %sweep

Re = (R1*R3)/(R1+R3);

S_Numerator = -R2*C2*R3/(R1+R3);
S = Re*(C1+C2);
S2 = (R2*Re*C1*C2);


b = [ S_Numerator 0 ];% numerator top  
%H(z)=---------------------
a = [S2 S 1 ];    % put in order-> s^2 S 1 denominator bottom


zeros = roots(b)% get real & imag values of zeros|b|x[n]|dips
poles = roots(a)% get real & imag values of poles|a|y[n]|peeks
fvtool(b,a)% mag response given a b values 





figure(1)% plots on filter visualization tool
zplane(zeros,poles)% show poles on unit circle 

figure(2)% plots unit circle
H = tf(b,a)
figure(3)% bode plots 
bode(H)
%figure(22)
%zplane(b,a)
%figure(23)
%step(H)
%figure(24)
%impulse(H)


