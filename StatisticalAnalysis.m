clear
clc
close all

%% embedding dimension
T=readtable('EstED.csv');
mat=table2array(T(:,{'patient', 'patientSurrogate'}));
[p,tbl]=anova2(mat');

%% Lyapunov Exponent


% maxiter=2000/50;
% evolutionTime = (1:maxiter) * dt ;
% 
% for ii=1:2
%     for jj=1:3
%         for kk=1:2
%             for ll=1:2
%                 [DIR,TITLE] = fullDir_Xmat(ii,jj,kk,ll);
% 
%                 a = load(DIR);
%                 Xmat = a.Xmat;
%                 dt = a.dt;
%                 [d, lle]= LyapunovExponent(Xmat, 2, maxiter, 1/dt, 1);
%             end
%         end
%     end
% end