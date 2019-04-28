clear
clc
close all

ridx_fp=[[1,3,5];[2,4,6]];


pairs=[{'patient', 'control'},
    {'patient', 'patientSurrogate'},
    {'control', 'controlSurrogate'},
    {'patient','controlSurrogate'},
    {'control','patientSurrogate'},
    {'patientSurrogate', 'controlSurrogate'}];
%% embedding dimension
% 
% T=readtable('EstED.csv');
% mat=table2array(T(:,pairs(1,:)));
% [p,tbl]=anova2(mat');

%% D2 

T=readtable('D2_temp.csv');
mat=table2array(T(ridx_fp(1,:),pairs(6,:)));
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