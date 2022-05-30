%-----------------for demo---------------
%----each section 1-3 is the same code but with different R3 value to apply
%----on the audio file and for playback.


%%%%%%%%section 1%%%%%%%%%%%%%%%%%%%
% 20 ohms 
[sigIn,fs] = audioread('finalonlystring1.M4A');
t = [0:length(sigIn)-1]*1/fs;

C1 = 95e-9;
C2 = 96.4e-9;
R2 = 33e+3;  
R1 = 14.72e+3; 
R3 = 20;  %sweep resistor 
Re = (R1*R3)/(R1+R3);

num =[-R2*C2*R3/(R1+R3),  0];
den =[(R2*Re*C1*C2), Re*(C1+C2), 1];
H = tf(num,den);
[impH] = impulse(H,t);  %impulse response 


sigOut_highq = conv(sigIn, impH); %convolution integral using impulse response
sigOut_highq = sigOut_highq(1:length(sigOut_highq)/2 + 1)/abs(max(sigOut_highq));


sound(sigIn, fs)
pause(2)
sound(sigOut_highq, fs)%20 ohms R3 value

%%%%%%%%section 2%%%%%%%%%%%%%%%%%%%
R3 = 1000;  %sweep resistor 
Re = (R1*R3)/(R1+R3);

num =[-R2*C2*R3/(R1+R3),  0];
den =[(R2*Re*C1*C2), Re*(C1+C2), 1];
H = tf(num,den);
[impH] = impulse(H,t);  %impulse response 

sigOut_midq = conv(sigIn, impH); %convolution integral using impulse response
sigOut_midq = sigOut_midq(1:length(sigOut_midq)/2 + 1)/abs(max(sigOut_midq));

pause(2)
sound(sigOut_midq, fs)%1000 ohms R3 value

%%%%%%%%section 3%%%%%%%%%%%%%%%%%%%
R3 = 2000;  %sweep resistor 
Re = (R1*R3)/(R1+R3);

num =[-R2*C2*R3/(R1+R3),  0];
den =[(R2*Re*C1*C2), Re*(C1+C2), 1];
H = tf(num,den);
[impH] = impulse(H,t);  %impulse response 

sigOut_smlq = conv(sigIn, impH); %convolution integral using impulse response
sigOut_smlq = sigOut_smlq(1:length(sigOut_smlq)/2 + 1)/abs(max(sigOut_smlq));

pause(2)
sound(sigOut_smlq, fs)%2000 ohms R3 value
