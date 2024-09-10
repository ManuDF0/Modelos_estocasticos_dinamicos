function [P,Q,R,S]=llinsolve_modif(A,B,C,D,F,G,H,J,K,L,M,N,unitr)
%set unitr=1 if there is a unit root in the model.  Any other value assumes
%that all |eigenvalues|<1.  Error message is sent if number of acceptable
%eigenvalues does not equal the number of state variables (and
%expectational equations).
[numj nums]=size(A);
I1=eye(nums);
Z1=zeros(nums);
invC=inv(C);
psy=F-J*invC*A;
lambda=J*invC*B-G+K*invC*A;
T=K*invC*B-H;
AA1=[lambda T
    I1 Z1];
AA2=[psy Z1
    Z1 I1];
[eigvec eigval]=eig(AA1,AA2);
diageigval=diag(eigval);
if unitr==1
    iz=find(abs(diageigval)<=1.00001);
else
    iz=find(abs(diageigval)<1.);
end
if length(iz)>= nums
    iz = iz(randperm(numel(iz), nums));
end
DD=diag(diageigval(iz));
ei=size(eigvec);
EE=eigvec(ei/2+1:ei,iz);
P=EE*DD*inv(EE);
R=-invC*(A*P+B);
I2=eye(size(N));
QQ=kron(N',(F-J*invC*A))+kron(I2,(J*R+F*P+G-K*invC*A));
invQQ=inv(QQ);
QQQ=((J*invC*D-L)*N+K*invC*D-M);
[aa,bb]=size(QQQ);
Qfindvert=QQQ(:);
Qvert=invQQ*Qfindvert;
Q=reshape(Qvert,aa,bb);
S=-invC*(A*Q+D);
