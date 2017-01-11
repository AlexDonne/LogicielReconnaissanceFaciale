
## Author: Nahel Chazot <nachazot1@c21-42>
## Created: 2017-01-11

function D = distChiSqu( X, Y )

%%% supposedly it's possible to implement this without a loop!
m = size(X,1);  n = size(Y,1);
mOnes = ones(1,m); D = zeros(m,n);
#for i=1:n
  #yi = Y(i,:);  
  #yiRep = yi( mOnes, : );
  #s = yiRep + X; 
  #d = yiRep - X;
 # D(:,i) = sum( d.^2 ./ (s+eps), 2 );       
#end
#d(x,y) = sum( (xi-yi)^2 / (xi+yi) ) / 2;
D = sum( (Y(mOnes,:) - X).^2 ./ ((Y(mOnes,:) + X)+eps), 2 );
D = D/2;