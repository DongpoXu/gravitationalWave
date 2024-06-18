load .mat;
xn=X;
fe = max(eig(xn*xn.'));
mu =;
[w,en,yn] = my_LMS(xn,mu);
%绘制滤波器输出信号和误差信号图像
figure;
plot(xn,'b');
xlabel('原始信号')
figure;
plot(yn,'b');
xlabel('LMS去噪后信号')     
noisePower=sum(abs(yn'-xn).^2)/length(yn'-xn) ;      
SNR_10=10*log10(sigPower/noisePower);           
disp(['信噪比为',num2str(SNR_10)])
MSE = sum(abs(yn'-xn).^2)/length(yn'-xn)
function [w,en,yn] = my_LMS(xn,mu)
%LMS实现程序
%   输入：
% xn   输入信号       列向量
% dn   理想信号       列向量
% mu   收敛常数       标量
% itr  迭代次数       标量
% M    滤波器的阶数   标量
%   输出：
% w    滤波器的系数矩阵    大小为M×itr  每一列代表一次迭代后的系数
% en   误差信号           大小为itr×1  每一行代表一次迭代后产生的误差
% yn   滤波器的输出信号    列向量

M = ; %定义滤波器的阶数
itr = length(xn); %使得迭代次数为输入信号xn的长度

w = zeros(M,itr);%将滤波器的初始值设置为0
en = zeros(itr,1);%将初始误差设置为0

%迭代更新滤波器的参数
for k = M:itr    
    x = xn(k:-1:k-M+1);
    y = w(:,k-1).'*x;  
    en(k) = xn(k)-y;  
    w(:,k) = w(:,k-1)+mu*en(k)*x;
end
%滤波器参数固定后，得出经过优化滤波器滤波后的输出信号
% yn = inf*ones(length(xn));%inf意为无穷大，将yn的初始值置为无穷大，绘制图像的时候将无法显示

for k = M:itr
    x = xn(k:-1:k-M+1);
    yn(k) = w(:,k).'*x;
end
    
end