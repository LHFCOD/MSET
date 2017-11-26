function result=EuroOpera(A,B)
[rowA,colA]=size(A);
[rowB,colB]=size(B);
if colA ~= rowB
    ME=MException('MyComponent:noSuchVariable','The number of rows and columns of the input matrix does not match!');
    throw(ME);
end
result=zeros(rowA,colB);
for i=1:rowA
    for j=1:colB
 	result(i,j)=normest(A(i,:)'-B(:,j));
    end
end
end