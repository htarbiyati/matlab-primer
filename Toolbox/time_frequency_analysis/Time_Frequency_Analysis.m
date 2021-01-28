% +------------------------------------------------------+
% |  Time-Frequency Analysis with MATLAB Implementation  |
% |                                                      |
% | Author: M.Sc. Eng. Hristo Zhivomirov        02/01/14 | 
% +------------------------------------------------------+

clear, clc, close all

% load a signal
[x, fs] = audioread('track.wav');   % load an audio file
x = x(:, 1);                        % get the first channel
xlen = length(x);                   % signal length
t = (0:xlen-1)/fs;                  % time vector

% time-frequency analysis parameters
wlen = 1024;                        % window length (recommended to be power of 2)
nfft = 2*wlen;                      % number of fft points (recommended to be power of 2)
hop = wlen/4;                       % hop size (recommended to be 1/4 of the window length)

% perform STFT
w1 = blackman(wlen, 'periodic');
[~, fS, tS, PSD] = spectrogram(x, w1, wlen-hop, nfft, fs);
Samp = 20*log10(sqrt(PSD.*enbw(w1, fs))*sqrt(2));

% perform spectral analysis
w2 = blackman(xlen, 'periodic');
[PS, fX] = periodogram(x, w2, xlen, fs, 'power');
Xamp = 20*log10(sqrt(PS)*sqrt(2));

% plot the signal waveform
figure(1)
subplot(3, 3, [2 3])
plot(t, x)
grid on
xlim([0 max(t)])
ylim([-1.1*max(abs(x)) 1.1*max(abs(x))])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Time, s')
ylabel('Amplitude')
title('The signal in the time domain')

% plot the spectrum
subplot(5, 3, [7 10 13])
plot(fX, Xamp)
grid on
xlim([0 max(fX)])
ylim([-120 max(Xamp)+10])
view(-90, 90)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
title('Amplitude spectrum of the signal')

% plot the spectrogram
subplot(5, 3, [8 9 11 12 14 15])
surf(tS, fS, Samp)
shading interp
axis tight
box on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Amplitude spectrogram of the signal')
view(0, 90)

% ensure -120 dBV noise floor and maximum 120 dB dynamix range
[~, cmax] = caxis;
caxis([max(-120, cmax-120), cmax])

% enable colorbar
hcol = colorbar('East');
set(hcol, 'FontName', 'Times New Roman', 'FontSize', 12)
ylabel(hcol, 'Magnitude, dB')

% % mark the dominant frequencies in the spectrogram
% [~, inds] = max(Samp, [], 1);
% fmax = fS(inds);
% hold on
% plot3(tS, fmax, zeros(length(tS)), 'r')