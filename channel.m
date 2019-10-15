% Function that simulates a low-pass channel with given cut-off frequency and Gaussian noise of given
% variance.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Usage: y = channel(x,T,dt,fcut,nvar,figvar)
% Inputs: (1) x - the sampled waveform to be transmitted.
%         (2) T - duration of the PCM waveform. The symbol rate R is R =
%                 1/T Hz.
%         (3) dt - Sampling rate used for simulating the analog waveforms.
%         (4) fcut - The 3 dB cut-off frequency of the channel (digital low pass filter) is 
%                     (fcut*R)/(fs/2) cycles/sample. The maximum value of
%                     fcut is fs/(2R).
%         (5) nvar - variance of the Gaussian noise to be introduced.
%         (6) figvar - Setting figvar = 1, will plot the magnitude response
%                      of the filter (channel) over 0 - fs/2 Hz. 
% Output: y - Channel output (incl channel and noise effects). It is of the same size as the input vector x.          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = channel(x,T,dt,fcut,nvar,figvar)
fs = 1/dt;
R = 1/T;
Wn = fcut*R/(fs/2);
[b,a] = butter(5,Wn);
if figvar == 1
    f = [0:dt:fs/2];
    Hf = freqz(b,a,f,fs);
    figure;
    plot(f,abs(Hf),'k');grid on;
end

y = filter(b,a,x) + sqrt(nvar)*randn(size(x));
end