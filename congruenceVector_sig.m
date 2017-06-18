function [ sigProfile] = congruenceVector_sig(signal,p)
% Computation the congruence derivative vector (signal profile) of a 1D real number signal
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.


N = length(signal);
sigProfile = zeros(1,p);


for i = 1:N
   m=mod(i,p);
   
   if m ==0
       k=p; %if no reminader, =0, periodicity set to p
   else
       k=m; 
   end
   
    sigProfile(k) = sigProfile(k)+signal(i);
end

end



