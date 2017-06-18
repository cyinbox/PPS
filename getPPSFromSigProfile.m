function [ PPS] = getPPSFromSigProfile(sigProfile,p) 
% Computation Periodic power spectrum (PPS) from congruence vector of a singal
% Inputs: sigProfile:congruence derivative vector, p:perodicity
% Output: Power spectrum at the periodicity p
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.

Sp=spectrumMatrix(p); 
PPS=sigProfile*Sp*sigProfile';
end

