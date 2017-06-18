function [ vPPS ] = PPS(signal,maxP)
% Computation Periodic power spectrum (PPS) of 1D real number singal
% Input: singal, maxP: maximum periodicity in computation range
% Output: Periodic power spectrum (PPS) for the periodicities 1, 2, ..., maxP
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.

 vPPS=zeros(1,maxP);
 for p=1:maxP
  sigProfile = congruenceVector_sig(signal,p);
  vPPS(p) = getPPSFromSigProfile(sigProfile,p);
 end

end

