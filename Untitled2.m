load  .mat;
X=BB;
xn=X;
alpha=;
K=;
tau = 0; % noise-tolerance (no strict fidelity enforcement)
DC = 0; % no DC part imposed
init = 1; % initialize omegas uniformly



[u, u_hat, omega] = VMD(X, alpha, tau, K, DC, init, tol);

[m,n]=size(u);

figure
subplot(size(u,1)+1,1,1)
plot(X,'b-','linewidth',1)
ylabel('ԭʼ�ź�');
grid on; 

for i= 2:size(u,1)+1
subplot(size(u,1)+1,1,i)
plot(u(i-1,:),'b-','linewidth',1)
ylabel(['IMF',num2str(i-1)]);
axis tight
end

Z(1,:)=X';
Z(2:6,:)=u(1:5,:);
[X,Y] = meshgrid(1:size(Z,1),1:size(Z,2));     %���� x��y ��������
figure;

plot3(X,Y,Z);grid on;
Y = u(1,:)+u(2,:)+u(3,:)+u(4,:)+u(5,:);

figure
plot(X,'b');
xlabel('ԭʼ�ź�')%���ƾ����˲����˲����ź�
figure
plot(Y,'b');
xlabel('VMDȥ����ź�')