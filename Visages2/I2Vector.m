function V=I2Vector(I)
  [H,L]=size(I);

  V=reshape(I,[H*L,1]);
  
endfunction