function [dndx,dndy,dndz,detj,elvolume] = SFDerivatives(iele,nnpe,nqptv,wtqp,np,x,y,z,dndxi,dndet,dndze)% compute shape function derivatives in global coordinatesdetj = zeros(1,nqptv);dndx = zeros(nnpe,nqptv);dndy = zeros(nnpe,nqptv);dndz = zeros(nnpe,nqptv);elvolume=0.;for i=1:1:nqptv          tjac=zeros(3,3);           for j=1:1:nnpe  	      j1=np(iele,j) ;  	        tjac(1,1)=tjac(1,1)+dndxi(j,i)*x(j1);                                 tjac(1,2)=tjac(1,2)+dndet(j,i)*x(j1);	        tjac(1,3)=tjac(1,3)+dndze(j,i)*x(j1);                                tjac(2,1)=tjac(2,1)+dndxi(j,i)*y(j1);                                tjac(2,2)=tjac(2,2)+dndet(j,i)*y(j1);                               tjac(2,3)=tjac(2,3)+dndze(j,i)*y(j1); 	        tjac(3,1)=tjac(3,1)+dndxi(j,i)*z(j1);                                 tjac(3,2)=tjac(3,2)+dndet(j,i)*z(j1);                                tjac(3,3)=tjac(3,3)+dndze(j,i)*z(j1);  	    end                                                                                                                                   detj(i)=det(tjac);            elvolume = elvolume + detj(i)*wtqp(i);	        tjaci = inv(tjac);                                                                                                             for  j=1:1:nnpe	      dndx(j,i)=tjaci(1,1)*dndxi(j,i)+tjaci(2,1)*dndet(j,i)+tjaci(3,1)*dndze(j,i);                  dndy(j,i)=tjaci(1,2)*dndxi(j,i)+tjaci(2,2)*dndet(j,i)+tjaci(3,2)*dndze(j,i);             dndz(j,i)=tjaci(1,3)*dndxi(j,i)+tjaci(2,3)*dndet(j,i)+tjaci(3,3)*dndze(j,i);  end        end 