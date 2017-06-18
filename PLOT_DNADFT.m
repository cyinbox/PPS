function [ ] = PLOT_DNADFT( PW )
% Program to plot FFT power spectrum 
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.

N=length(PW);
half = floor(N/2);

figure
PW(1)=0; %For plotting purpose only
hFig0=plot(PW(1:half),'b'); %For DFT, only plot first half of spectrum.


xlim([0,half+5])
set(hFig0                        , ...
  'LineWidth' , 1.5 );

%Set label properties
hXLabel = xlabel('Frequency'                     );
hYLabel = ylabel('Power spectrum'                      );
title('Fourier power spectrum of a DNA sequence')
set([hXLabel, hYLabel]  , ...
    'FontName'   , 'AvantGarde', ...
    'FontSize'   , 10, ...
    'FontWeight' , 'bold');

% Set axis properties
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

end



