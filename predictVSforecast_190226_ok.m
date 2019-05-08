clear
clc
close all

% load iddata9 z9
% observed_data = z9(1:128); 
% Ts = observed_data.Ts;
% t = observed_data.SamplingInstants;
% y = observed_data.y;
% sys = ssest(observed_data,4,'Ts',Ts);
% H = 100;
% yh1 = forecast(sys,observed_data,H);
% A = sys.A;
% K = sys.K;
% C = sys.C;
% Predictor = idss((A-K*C),K,C,0,'Ts',Ts);
% x0 = findstates(sys,observed_data,1);
% Input = iddata([],y,Ts);
% opt = simOptions('InitialCondition',x0);
% [~,~,x] = sim(Predictor,Input,opt);
% xfinal = x(end,:)';
% x0_for_forecasting = Predictor.A*xfinal + Predictor.B*y(end);
% opt = simOptions('InitialCondition',x0_for_forecasting);
% Input = iddata([],zeros(H,0),Ts,'Tstart',t(end)+Ts);
% yh2 = sim(sys,Input,opt);
% plot(yh1,yh2,'r.')

t = 0:0.1:12; t = t';
pastdata = 20*sin(t) + rand([length(t) 1]);
pastdata = iddata(pastdata,'Ts',0.1,'Tstart',0);
sys = ar(pastdata,20);
Kp = 20;
yp = predict(sys,pastdata,Kp);
Kf = 100;
yf = forecast(sys,pastdata,Kf);
% figure
plot(pastdata,'r',yp,yf,'.');
%% 
% predict������forecast����ʹ�ù��ܶԱ�_20190226
% 
% ͼ�к�ɫʵ��Ϊ���Ի�õ����ݣ���ʷ���ݣ���
% 
% ǳ��ɫʵ��Ϊpredict���������������ʷ���ݣ�pastdata������ϵ�ģ�͵������һ��Ԥ�⣩��������֤���ģ�͵ĺû���
% 
% ����ɫ����Ϊforecast�����������������ϵ�ģ�ͣ���δ��ʱ���Ԥ�⡣
% 
%