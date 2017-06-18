function [ PPS ] = getPPSFromDNAProfile(profile,p )
% Compute periodic power spectrum of a DNA sequence.
% Inputs: profile:the congruence derivative vector, periodicity p
%
% Example usage:
% p=5
% seq='ATCGGTCGTCGAATGCATGGTCA';
% profile=getPositionProfile(seq,p)  
% PS5_fromFormula=getPSFromProfile(profile,p)
%
% Changchuan Yin, Ph.D.
% Dept. of Mathematics, Statistics and Computer Science
% University of Illinois at Chicago
% Last update 02/08/2016
%
% Citation
% Yin, C., & Wang, J. (2016).Periodic power spectrum with applications in detection of latent periodicities 
% in DNA sequences. Journal of Mathematical Biology.

% 1. Construct the spectrum matrix (SM) at periodicity p
for j=1:p
    v1(j)=cos(2*(j-1)*pi/p);
    v2(j)=sin(2*(j-1)*pi/p);
end

c = v1'* v1;
s = v2'* v2;
cs = c+s;

for i=1:p
    for j=1:p
        if i==j
            SM(i,j)=1;
        else
            SM(i,j)=cs(i,j)+cs(j,i);
        end
        
        if (i>j)
             SM(i,j)=cs(i,j)+cs(j,i);
        end
        
        if (i<j)
             SM(i,j)=0; %make upper diagonal be zero
        end
    end
end

% 2. Compute the periodic power spectrum using profile (the congruence derivative vector) and periodicity p
% and the spectral matrix
pa=profile(1,:);
pt=profile(2,:);
pc=profile(3,:);
pg=profile(4,:);

x=pa*SM*pa';
y=pt*SM*pt';
z=pc*SM*pc';
r=pg*SM*pg';

PPS=x+y+z+r;

end

