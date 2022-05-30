%Change the value of R3 to apply the effect on audio file for playback 
[sigIn,fs] = audioread('finalonlystring1.M4A');
t = [0:length(sigIn)-1]*1/fs;

C1 = 95e-9;
C2 = 96.4e-9;
R2 = 33e+3;  
R1 = 14.72e+3; 
R3 = 1000;  %sweep resistor 
Re = (R1*R3)/(R1+R3);

num =[-R2*C2*R3/(R1+R3),  0];
den =[(R2*Re*C1*C2), Re*(C1+C2), 1];
H = tf(num,den);
[impH] = impulse(H,t);  %impulse response 

figure(1)
bode(H)%bode plots 

sigOut = conv(sigIn, impH); %convolution integral using impulse response
sigOut = sigOut(1:length(sigOut)/2 + 1)/abs(max(sigOut));

sound(sigIn, fs)%original audio 
pause(2)
sound(sigOut, fs)%effect applied 


%---Frequency-domain signals-----
fax = [0:length(sigIn)-1]*fs/length(sigIn);
[Mag, Phase] = bode(H, 2*pi*fax);
Mag = 20*log10(squeeze(Mag));
Phase = squeeze(Phase);

SigIn = fft(sigIn);
SigOut = fft(sigOut);
figure(2) 
clf
  plot(fax, abs(SigIn), "DisplayName", "Input")
  hold on
  plot(fax, abs(SigOut),'--', "DisplayName", "Output")
  xlabel("Frequency [Hz]")
  ylabel("Magnitude")
  title("Magnitude content")
  legend("show")


