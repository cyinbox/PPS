function [ profile] = congruenceVector_DNA(DNA,periodicity)
% Computation the congruence derivative vector (sequence position profile) of a DNA sequence
% Inputs: DNA sequence and periodicity
% Output: DNA position profile (4x4 matrix), which is formed by four congruence derivative
% vectors
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.

f = periodicity;
N = length(DNA);
profile = zeros(4,f);

for i=1:N
   m=mod(i,f);
   
   if m==0
       p=f; 
   else
       p=m; 
   end
   
   if strcmp(DNA(i),'A') 
     profile(1,p)=profile(1,p)+1;
   elseif strcmp(DNA(i),'T')
     profile(2,p)=profile(2,p)+1;
   elseif strcmp(DNA(i),'C')
     profile(3,p)=profile(3,p)+1;
   elseif strcmp(DNA(i),'G')
     profile(4,p)=profile(4,p)+1;
   end 
   
end

end

