function [d, lle] = LyapunovExponent(Xmat, meanperiod, maxiter, fs, first_positive)
% an implementation of largest lyapunov exponent using Rosenstein's Algorithm

% ===== inputs =====
% meanperiod: 
% Xmat: reconstructed phase space trajectories (numD * M)
% fs: sampling frequency

% ===== outputs =====
% d: divergence of nearest trajectoires
% lle: largest lyapunov exponent


M=size(Xmat,2);
for i=1:M
    x0=ones(1,M).*Xmat(:,i);
    distance=sqrt(sum((Xmat-x0).^2,1));
    for j=1:M
        if abs(j-i)<=meanperiod
            distance(j)=1e10;
        end
    end 
    [neardis(i) nearpos(i)]=min(distance);
end

for k=1:maxiter
    maxind=M-k;
    evolve=0;
    pt=0;
    for j=1:M
        if j<=maxind && nearpos(j)<=maxind
            if first_positive == 0
                dist_k=sqrt(sum((Xmat(:,j+k)-Xmat(:,nearpos(j)+k)).^2,1));
                if dist_k~=0
                    evolve=evolve+log(dist_k);
                end
            else
                dist = Xmat(:,j+k)-Xmat(:,nearpos(j)+k);
                evolve=evolve+max(log(abs(dist)));    
%                 log(abs(dist))
%                 disp(log(dist));
            end
            pt=pt+1;
             
        end
    end
    if pt > 0
        d(k)=evolve/pt;
    else
        d(k)=0;
    end
    
end


%% LLE Calculation
tlinear=1:maxiter;
F = polyfit(tlinear,d(tlinear),1);
lle = F(1)*fs;




