%%%%%detail process of MSET
%%%%%Data is the overall data set to calculate
%%%%%Divide data into three parts according to the set ration of L,M and N

MSETData=Data;
lengthMSETData=length(MSETData);
L=round(3/4*lengthMSETData);
M=round(1/8*lengthMSETData);
N=round(1/8*lengthMSETData);
wndWidth=50;
k1=1;
k2=1;
% Set the memory matrix,LMatrix is the memory matrix, MMatrix is used to estimate the upper and lower limits of mean value and the standard deviation
% NMatrix is the test set
LMatrix=MSETData(1:L,:)';
MMatrix=MSETData(L+1:L+M,:)';
NMatrix=MSETData(L+M+1:end,:)';


Mest=MSET(LMatrix,MMatrix);
MResi=ResidualSeq(MMatrix,Mest,wndWidth);
% Calculate the maximum value of the mean value and the standard deviation
% based on k1 and k2
Ev=k1*max(MResi(1,:));
Sv=k2*max(MResi(2,:));
Nest=MSET(LMatrix,NMatrix);
[Stati,NResi]=ResidualSeq(NMatrix,Nest,wndWidth);

[rowsNR,colsNR]=size(NResi);
% Set the x-axis data
XCor=1:colsNR;
% Define the data used for display
plotdata=zeros(2,colsNR);
% The first set of data is defined, which represents the threshold of the residual mean value;
plotdata(1,:)=Ev;
plotdata(2,:)=NResi(1,:);
plot(XCor,plotdata(1,:),XCor,plotdata(2,:));

