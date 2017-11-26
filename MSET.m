function Xest=MSET(D,Xobs)
%%D is the memeroy matrix
%%Xobs is the vector of observation
A=EuroOpera(D',D);
detA=det(A);
[U S V]=svd(A);
%%return the estimation vector of D
Xest=D*((V')^(-1)*S^(-1)*U^(-1))*EuroOpera(D',Xobs);
end