function bigB = BigBmat(nnpe,nqptv,dndx,dndy,dndz)% compute the bigB matrix for stiffness matricesbigB = zeros(6,3*nnpe,nqptv);for i=1:1:nqptv        for j=1:1:nnpe             j3 = 3*j;      j2 = j3-1;      j1 = j3-2;      bigB(1,j1,i) = dndx(j,i);      bigB(2,j2,i) = dndy(j,i);      bigB(3,j3,i) = dndz(j,i);      bigB(4,j2,i) = dndz(j,i);      bigB(4,j3,i) = dndy(j,i);      bigB(5,j1,i) = dndz(j,i);      bigB(5,j3,i) = dndx(j,i);      bigB(6,j1,i) = dndy(j,i);      bigB(6,j2,i) = dndx(j,i);  end   end 