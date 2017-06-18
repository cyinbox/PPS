function [ ] = PLOT_DNAPPS( PPS )
% Program to plot periodic power spectrum 
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.

figure
PPS(1)=0; %For plotting purpose,
hFig0=plot(PPS,'b');

%xlim([0,half])
set(hFig0                        , ...
  'LineWidth' , 1.5 );

%Set label properties
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

end



