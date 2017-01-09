function J=RGB2Gray(I)

  [H,L,n]=size(I);
  J=ones(H,L); 
  
  J(1:H,1:L)=round(0.3*I(1:H,1:L,1)+0.59*I(1:H,1:L,2)+0.11*I(1:H,1:L,3));

endfunction