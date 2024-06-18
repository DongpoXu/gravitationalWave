load .mat;
xn=X;
fe = max(eig(xn*xn.'));
mu =;
[w,en,yn] = my_LMS(xn,mu);
%�����˲�������źź�����ź�ͼ��
figure;
plot(xn,'b');
xlabel('ԭʼ�ź�')
figure;
plot(yn,'b');
xlabel('LMSȥ����ź�')     
noisePower=sum(abs(yn'-xn).^2)/length(yn'-xn) ;      
SNR_10=10*log10(sigPower/noisePower);           
disp(['�����Ϊ',num2str(SNR_10)])
MSE = sum(abs(yn'-xn).^2)/length(yn'-xn)
function [w,en,yn] = my_LMS(xn,mu)
%LMSʵ�ֳ���
%   ���룺
% xn   �����ź�       ������
% dn   �����ź�       ������
% mu   ��������       ����
% itr  ��������       ����
% M    �˲����Ľ���   ����
%   �����
% w    �˲�����ϵ������    ��СΪM��itr  ÿһ�д���һ�ε������ϵ��
% en   ����ź�           ��СΪitr��1  ÿһ�д���һ�ε�������������
% yn   �˲���������ź�    ������

M = ; %�����˲����Ľ���
itr = length(xn); %ʹ�õ�������Ϊ�����ź�xn�ĳ���

w = zeros(M,itr);%���˲����ĳ�ʼֵ����Ϊ0
en = zeros(itr,1);%����ʼ�������Ϊ0

%���������˲����Ĳ���
for k = M:itr    
    x = xn(k:-1:k-M+1);
    y = w(:,k-1).'*x;  
    en(k) = xn(k)-y;  
    w(:,k) = w(:,k-1)+mu*en(k)*x;
end
%�˲��������̶��󣬵ó������Ż��˲����˲��������ź�
% yn = inf*ones(length(xn));%inf��Ϊ����󣬽�yn�ĳ�ʼֵ��Ϊ����󣬻���ͼ���ʱ���޷���ʾ

for k = M:itr
    x = xn(k:-1:k-M+1);
    yn(k) = w(:,k).'*x;
end
    
end