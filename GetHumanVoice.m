function y=GetHumanVoice(x,fs)
% x is the original signal
% fs is the sample frequency
% y is the human voice (300~3400Hz)

y=Filter_cheby1(x,3400,3400+50,5,60,fs,'low');
y=Filter_cheby1(y,300-50,300,5,60,fs,'high');
dy=dst(y);
y=idst(3.*dy);