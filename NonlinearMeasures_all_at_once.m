
for idxClass = 1:2
    for idxName = 1:3
        for idxChannel = 1:2
            for isSurrogate = 0:1
                close all;
                % Load variables
                [DIR,TITLE] = fullDir_Xmat(idxClass,idxName,idxChannel,isSurrogate);

                a = load(DIR);
                Xmat = a.Xmat;
                dt = a.dt;

                % Nonlinear measure: correlation dimension
                rVec=0:100:1900;

                CVec = CorrelationDimension(Xmat, rVec);
                D2Vec = log(CVec)./log(rVec);
                D2 = nanmax(D2Vec);

                fig_D2 = figure;
                plot(log(rVec), log(CVec));
                xlabel('log r')
                ylabel('log C(r)')
                title([TITLE,  ', D2: ', num2str(D2)])
                savefig(fig_D2,['figure1/',TITLE,'_D2']);

                % Nonlinear measure: largest lyapunov exponent
                maxiter=size(Xmat,2)/50;
                evolutionTime = (1:maxiter) * dt ;

                [d, lle]= LyapunovExponent(Xmat, 2, maxiter, 1/dt, 1);

                fig_Lya = figure;
                plot(evolutionTime, d);
                xlabel('iteration')
                ylabel('divergence')
                title([TITLE, ' Lyapunov Exp: ',num2str(lle)])
                savefig(fig_Lya,['figure1/',TITLE,'_Lya']);
            end
        end
    end
end

                