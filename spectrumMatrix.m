function [ Sp] = spectrumMatrix(p) 
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

for j=1:p
    v1(j)=cos(2*(j-1)*pi/p);   
end

for j=1:p
    v2(j)=sin(2*(j-1)*pi/p);   
end

m1 = v1'* v1;
m2= v2'* v2;
cm = m1+m2;

% Use the matrix operation, set upper diagonal be zero
for i=1:p
    for j=1:p
        if i==j
            Sp(i,j)=1;
        else
            Sp(i,j)=cm(i,j)+cm(j,i);
        end
        
        if (i>j)
             Sp(i,j)=cm(i,j)+cm(j,i);
        end
        if (i<j)
             Sp(i,j)=0;
        end
    end
end

end

