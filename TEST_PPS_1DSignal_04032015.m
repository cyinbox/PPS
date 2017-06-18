% Test program for computation periodic power spectrum (PPS) of 1D real number signal
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
%======================================
% 1.Siangal and singal plotting
p1=20;
p2=50;
n=300;

t=1:n;
L=length(t);
theta=pi/4;
signal = sin(2*pi*(t/p1)+theta) + cos(2*pi*(t/p2)+theta)+ 2*randn(size(t));     % Good one

figure
fig1=plot(signal);
%-------------------------
set(fig1                        , ...
  'LineWidth'       , 1.5         );

hXLabel = xlabel('Time (second)'                     );
hYLabel = ylabel('Signal'                      );
title('Periodic signal')

set([hXLabel, hYLabel]  , ...
    'FontName'   , 'AvantGarde', ...
    'FontSize'   , 10, ...
    'FontWeight' , 'bold');
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

%======================================
% 2.DFT plotting
FT_s=fft(signal);
PS_s=abs(FT_s).^2;
N=length(PS_s);
half=floor(N/2);

figure
PS_s(1)=0; %Ignore the constant, for plotting only
fig2=plot(PS_s(1:half));
%-------------------------
set(fig2                        , ...
  'LineWidth'       , 1.5         );
my=max(PS_s(2:half))+500;
ylim([1,my])

hXLabel = xlabel('Frequency'                     );
hYLabel = ylabel('Fourier power spectrum'                      );
title('Fourier power spectrum of periodic signal');
set([hXLabel, hYLabel]  , ...
    'FontName'   , 'AvantGarde', ...
    'FontSize'   , 10, ...
    'FontWeight' , 'bold');

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


%======================================
% 3. PPS plotting
maxP=n;
vPPS=PPS(signal,maxP)

figure
vPPS(1)=0; %Ignore the constant, for plotting only
fig3=plot(vPPS(1:maxP));

set(fig3                        , ...
  'LineWidth'       , 1.5         );
%mx=max(PPS(2:p))+500;
%ylim([1,mx])
%ylim([1,16])

hXLabel = xlabel('Periodicity'                     );
hYLabel = ylabel('Power spectrum'                      );
title('Power power spectrum of periodic signal');

set([hXLabel, hYLabel]  , ...
    'FontName'   , 'AvantGarde', ...
    'FontSize'   , 10, ...
    'FontWeight' , 'bold');
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





