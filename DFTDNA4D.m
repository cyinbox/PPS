function [ PS] = DFTDNA4D(seq)
% Program to compute DFT of a DNA sequence represented by 4-D binary
% indicators
% Input: DNA sequece
% Output: Fourier power spectrum of the DNA sequene
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.

seq=upper(seq);
N = length(seq);

bA = zeros(1,N);
bT = zeros(1,N);
bC = zeros(1,N);
bG = zeros(1,N);

for i=1:N
   if strcmp(seq(i),'A') 
      bA(i) = 1;
   elseif strcmp(seq(i),'T')
      bT(i) = 1;
   elseif strcmp(seq(i),'C')
      bC(i) = 1;
   elseif strcmp(seq(i),'G')
      bG(i) = 1;
   end     
end

%Calculate the general FFT spectrum
FFTA = fft(bA,N); 
PSA = abs(FFTA).^2;

FFTT = fft(bT,N); 
PST = abs(FFTT).^2;  

FFTC = fft(bC,N); 
PSC = abs(FFTC).^2;

FFTG = fft(bG,N); 
PSG = abs(FFTG).^2;

PS = PSA + PST + PSC + PSG;

end

