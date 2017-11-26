%Aobs is the observation matrix
%Aest is the estimation matrix
%N is the width of the sliding window;
% k1 is the threshold of the mean value for falure;
% k2 is the threshold of the standard deviation for failure;
function [Stati,Resi]=ResidualSeq(Aobs,Aest,N)
[rowObs,colObs]=size(Aobs);
[rowEst,colEst]=size(Aest);
if colEst~=colObs || rowObs~=rowEst
    ME=MException('MyComponent:noSuchVariable','The number of rows and columns of the input matrix does not match!');
    throw(ME);
end
if N>colObs
    ME=MException('MyComponent:noSuchVariable','The width of the sliding window is greater than the width of the residual sequence!');
    throw(ME);
end
% if k1<0 || k1>2 || k2<0 || k2>2
%     ME=MException('MyComponent:noSuchVariable','Warning:The threshold may be set unreasonable!');
%     throw(ME);
% end
%Deifne and compute the residual sequence
ResiSeq=zeros(1,colObs);
for index=1:colObs
    ResiSeq(index)=normest(Aobs(:,index)-Aest(:,index));
end
%Define the sequence of the mean value and the standard deviation
MeanSeq=zeros(1,colObs-N+1);
StandDev=zeros(1,colObs-N+1);
%Slide the window
for index=N:colObs
    %Take out the data depending on the window
    WindSeq=ResiSeq(:,index-N+1:index);
    MeanSeq(:,index)=mean(WindSeq);
    StandDev(:,index)=std(WindSeq);
end
Stati=[MeanSeq;StandDev];
Resi=ResiSeq;
end