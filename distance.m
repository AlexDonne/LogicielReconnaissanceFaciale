function D=distance(V1, V2)
  A=abs(V2-V1);
  D=sqrt(sum(A(:,1).^2));
endfunction