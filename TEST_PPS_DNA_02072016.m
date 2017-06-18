% Test program for computation Periodic Power Spectrum (PPS) of DNA sequences
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.

clear
% MATLAB Bioinformatics toolbox is required
%seq=getgenbank('EU834863','sequenceonly','true');

seq ='TAGCCTCCTTATTCGAGCCGAGCTGGGCCAGCCAGGCAACCTTCTAGGTAACGACCACATCTACAACGTTATCGTCACAGCCCATGCATTTGTAATAATCTTCTTCATAGTAATACCCATCATAATCGGAGGCTTTGGCAACTGACTAGTTCCCCTAATAATCGGTGCCCCCGATATGGCGTTTCCCCGCATAAACAACATAAGCTTCTGACTCTTACCTCCCTCTCTCCTACTCCTGCTCGCATCTGCTATAGTGGAGGCCGGAGCAGGAACAGGTTGAACAGTCTACCCTCCCTTAGCAGGGAACTACTCCCACCCTGGAGCCTCCGTAGACCTAACCATCTTCTCCTTACACCTAGCAGGTGTCTCCTCTATCTTAGGGGCCATCAATTTCATCACAACAATTATCAATATAAAACCCCCTGCCATAACCCAATACCAAACGCCCCTCTTCGTCTGATCCGTCCTAATCACAGCAGTCCTACTTCTCCTATCTCTCCCAGTCCTAGCTGCTGGCATCACTATACTACTAACAGACCGCAACCTCAACACCACCTTCTTCGACCCCGCCGGAGGAGGAGACCCCATTCTATACCAACACCTATTCTTGATTCTTA';
seq=seq(1:615); %To test periodicity 3, make the length as multiple of 3 so that we can verify that FFT power sepctrum at periodicity 3 equals to PPS(3)

%1. Compute DFT of DNA sequence using 4D Voss binary indicator mapping
PW=DFTDNA4D(seq); %using FFT
PLOT_DNADFT(PW);
L=length(seq);
f=L/3+1;
PW_P3=PW(f) %Fourier power spectrum at periodicty 3 (frequency : L/3 +1)

%========================================================
% 2. Compute PPS for periodicities 1..100
% 2.1 computing
maxP=50;
PPS=PPSDNA(seq,maxP);
PLOT_DNAPPS(PPS);
computed=PPS(1:maxP); %Display first 50 periodictyies
PPS_P3=PPS(3) %Periodic power spectrum at periodicity 3

% 2.2 Stem plotting for clarity
figure
PPS(1)=0; %Ignore PPS for periodicity 1 (DC) when plotting
x=PPS(1:maxP);
N=length(seq); 
hFig0=stem(x,'Marker','none');
hold on
plot(find(x>=N),x(x>=N),'ro')
plot(find(x<N),x(x<N),'*')

set(hFig0                        , ...
  'LineWidth' , 1.5 );
hXLabel = xlabel('Periodicity'                     );
hYLabel = ylabel('Power spectrum'                      );
title('Power power spectrum of a DNA sequence')
set([hXLabel, hYLabel]  , ...
    'FontName'   , 'AvantGarde', ...
    'FontSize'   , 10, ...
    'FontWeight' , 'bold');

% Set axies properties
set(gca, ...
  'Box'         , 'off'     , ...  %No rectangle cover the figure
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'XColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1,... 
  'YColor'      , [.3 .3 .3]);

%========================================================
% 3. Compute PPS SNR for periodicities 1..100
PPS_SNR=PPSDNA(seq,maxP)/N;

figure
PPS_SNR(1)=0; %Ignore PPS for periodicity as 1 (DC) when plotting
x=PPS_SNR(1:maxP);
hFig1=stem(x,'Marker','none');
hold on
plot(find(x>=1),x(x>=1),'ro')
plot(find(x<1),x(x<1),'*')

set(hFig1                        , ...
  'LineWidth' , 1.5 );
hXLabel = xlabel('Periodicity'                     );
hYLabel = ylabel('Power spectrum SNR'                      );
title('Power power spectrum SNR of a DNA sequence')
set([hXLabel, hYLabel]  , ...
    'FontName'   , 'AvantGarde', ...
    'FontSize'   , 10, ...
    'FontWeight' , 'bold');

% Set axies properties
set(gca, ...
  'Box'         , 'off'     , ...  %No rectangle cover the figure
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'XColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1,... 
  'YColor'      , [.3 .3 .3]);





