function [ vPPS ] = PPSDNA(seq,maxP)
% Computation periodic power spectrum (PPS) of DNA sequences
% Input: seq:DNA sequence, maxP: maximum periodicity for computation
% Output: Power spectrum for the periodicities 1, 2, ..., maxP
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
    profile=congruenceVector_DNA(seq,p);
    vPPS(p)=getPPSFromDNAProfile(profile,p);   
end

end

