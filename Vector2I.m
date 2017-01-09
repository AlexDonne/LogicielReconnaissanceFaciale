function I=Vector2I(V)
  H=size(V);
  h=sqrt(H);
  h=h(1,1)
  I=reshape(V, [h,h]);
endfunction 