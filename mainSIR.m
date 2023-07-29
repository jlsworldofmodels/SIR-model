clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% solve SIR model
N  = 100000;
I0 = 100;
S0 = N-I0;
R0 = 0;
[t, pars] = ode45(@SIR, [0 100], [S0 I0 R0]');
% constants
beta  = 4/10/N; % contact rate
gamma = 1/5;      % removal rate
% calculate Imax
St = gamma/beta;
R = beta*N/gamma;
Imax = N*(1-1/R*(1+log(R)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot solution of SIR model
% 
% make figure
figure;
hold on;
% add solution to SIR model
p1=plot(t,pars(:,1),'-r','linewidth',2);
p2=plot(t,pars(:,2),'-b','linewidth',2);
p3=plot(t,pars(:,3),'-k','linewidth',2);
% add line indicating Imax
line([0 100],[Imax Imax],'color','black','linewidth',1)
text(102, Imax, 'I_{max}')
% add legend and axis titles
legend([p1 p2 p3],'S(t)','I(t)','R(t)')
xlabel('time')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
