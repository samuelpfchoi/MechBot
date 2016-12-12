function och = MechWalk_out4()

och.icf = @MechWalk_out4_icf; 
och.tcf = @MechWalk_out4_tcf; 
och.fcf = @MechWalk_out4_fcf; 

och.nlicf = @MechWalk_out4_nlicf; 
och.nltcf = @MechWalk_out4_nltcf; 
och.nlfcf = @MechWalk_out4_nlfcf; 
och.nlgcf = @MechWalk_out4_nlgcf; 



function [f,df] = MechWalk_out4_icf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 


end


function [f,df] = MechWalk_out4_tcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 
	 f(1,:) = a1d.^2+a2d.^2+a3d.^2+a4d.^2+a5d.^2+a6d.^2+a7d.^2;

	 df(1,:)= zeros(size(a1)); 
	 df(2,:)= 2.*a1d; 
	 df(3,:)= zeros(size(a2)); 
	 df(4,:)= 2.*a2d; 
	 df(5,:)= zeros(size(a3)); 
	 df(6,:)= 2.*a3d; 
	 df(7,:)= zeros(size(a4)); 
	 df(8,:)= 2.*a4d; 
	 df(9,:)= zeros(size(a5)); 
	 df(10,:)= 2.*a5d; 
	 df(11,:)= zeros(size(a6)); 
	 df(12,:)= 2.*a6d; 
	 df(13,:)= zeros(size(a7)); 
	 df(14,:)= 2.*a7d; 

end


function [f,df] = MechWalk_out4_fcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 


end


function [f,df] = MechWalk_out4_nlicf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 


end


function [f,df] = MechWalk_out4_nltcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 
	 f(1,:) = angle(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i));
	 f(2,:) = 1.21635036.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6 - 0.694738276) - 11.0929382.*cos(a4 + 0.0702545565) - 7.67759563.*cos(a3 + a4) - 2.52459016.*cos(a2 + a3 + a4) + 2.32240437.*cos(a2 + a3 + a4 - 1.0.*a5);
	 f(3,:) = 10.0.*cos(a2 + a3 + a4 - 1.0.*a5) - 12.0.*cos(a4) - 10.0.*cos(a3 + a4) + 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6);
	 f(4,:) = 10.0.*sin(a3 + a4) + 12.0.*sin(a4) - 10.0.*sin(a2 + a3 + a4 - 1.0.*a5) - 12.0.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6);
	 f(5,:) = angle((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i));
	 f(6,:) = 10.0.*sin(a3 + a4) + 12.0.*sin(a4) - 10.0.*sin(a2 + a3 + a4 - 1.0.*a5) - (10.0.*sin(a3 + a4) + 12.0.*sin(a4) - 10.0.*sin(a2 + a3 + a4 - 1.0.*a5) - 12.0.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6));

	 df(1,1,:) = -(real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2.*(imag((cos(a1 + a2 + a3 + a4).*1.0i - sin(a1 + a2 + a3 + a4))./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i).^2)./real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)) - (imag(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).*real((cos(a1 + a2 + a3 + a4).*1.0i - sin(a1 + a2 + a3 + a4))./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i).^2))./real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2))./(imag(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2 + real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2); 
	 df(2,1,:) = zeros(size(a1d)); 
	 df(3,1,:) = -(real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2.*(imag((cos(a1 + a2 + a3 + a4).*1.0i - sin(a1 + a2 + a3 + a4))./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i).^2)./real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)) - (imag(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).*real((cos(a1 + a2 + a3 + a4).*1.0i - sin(a1 + a2 + a3 + a4))./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i).^2))./real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2))./(imag(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2 + real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2); 
	 df(4,1,:) = zeros(size(a2d)); 
	 df(5,1,:) = -(real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2.*(imag((cos(a1 + a2 + a3 + a4).*1.0i - sin(a1 + a2 + a3 + a4))./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i).^2)./real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)) - (imag(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).*real((cos(a1 + a2 + a3 + a4).*1.0i - sin(a1 + a2 + a3 + a4))./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i).^2))./real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2))./(imag(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2 + real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2); 
	 df(6,1,:) = zeros(size(a3d)); 
	 df(7,1,:) = -(real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2.*(imag((cos(a1 + a2 + a3 + a4).*1.0i - sin(a1 + a2 + a3 + a4))./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i).^2)./real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)) - (imag(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).*real((cos(a1 + a2 + a3 + a4).*1.0i - sin(a1 + a2 + a3 + a4))./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i).^2))./real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2))./(imag(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2 + real(1./(cos(a1 + a2 + a3 + a4) + sin(a1 + a2 + a3 + a4).*1.0i)).^2); 
	 df(8,1,:) = zeros(size(a4d)); 
	 df(9,1,:) = zeros(size(a5)); 
	 df(10,1,:) = zeros(size(a5d)); 
	 df(11,1,:) = zeros(size(a6)); 
	 df(12,1,:) = zeros(size(a6d)); 
	 df(13,1,:) = zeros(size(a7)); 
	 df(14,1,:) = zeros(size(a7d)); 
	 df(1,2,:) = zeros(size(a1)); 
	 df(2,2,:) = zeros(size(a1d)); 
	 df(3,2,:) = 2.52459016.*sin(a2 + a3 + a4) - 1.21635036.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6 - 0.694738276) - 2.32240437.*sin(a2 + a3 + a4 - 1.0.*a5); 
	 df(4,2,:) = zeros(size(a2d)); 
	 df(5,2,:) = 7.67759563.*sin(a3 + a4) - 1.21635036.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6 - 0.694738276) + 2.52459016.*sin(a2 + a3 + a4) - 2.32240437.*sin(a2 + a3 + a4 - 1.0.*a5); 
	 df(6,2,:) = zeros(size(a3d)); 
	 df(7,2,:) = 11.0929382.*sin(a4 + 0.0702545565) - 1.21635036.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6 - 0.694738276) + 7.67759563.*sin(a3 + a4) + 2.52459016.*sin(a2 + a3 + a4) - 2.32240437.*sin(a2 + a3 + a4 - 1.0.*a5); 
	 df(8,2,:) = zeros(size(a4d)); 
	 df(9,2,:) = 1.21635036.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6 - 0.694738276) + 2.32240437.*sin(a2 + a3 + a4 - 1.0.*a5); 
	 df(10,2,:) = zeros(size(a5d)); 
	 df(11,2,:) = 1.21635036.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6 - 0.694738276); 
	 df(12,2,:) = zeros(size(a6d)); 
	 df(13,2,:) = zeros(size(a7)); 
	 df(14,2,:) = zeros(size(a7d)); 
	 df(1,3,:) = zeros(size(a1)); 
	 df(2,3,:) = zeros(size(a1d)); 
	 df(3,3,:) = - 10.0.*sin(a2 + a3 + a4 - 1.0.*a5) - 12.0.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(4,3,:) = zeros(size(a2d)); 
	 df(5,3,:) = 10.0.*sin(a3 + a4) - 10.0.*sin(a2 + a3 + a4 - 1.0.*a5) - 12.0.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(6,3,:) = zeros(size(a3d)); 
	 df(7,3,:) = 10.0.*sin(a3 + a4) + 12.0.*sin(a4) - 10.0.*sin(a2 + a3 + a4 - 1.0.*a5) - 12.0.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(8,3,:) = zeros(size(a4d)); 
	 df(9,3,:) = 10.0.*sin(a2 + a3 + a4 - 1.0.*a5) + 12.0.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(10,3,:) = zeros(size(a5d)); 
	 df(11,3,:) = 12.0.*sin(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(12,3,:) = zeros(size(a6d)); 
	 df(13,3,:) = zeros(size(a7)); 
	 df(14,3,:) = zeros(size(a7d)); 
	 df(1,4,:) = zeros(size(a1)); 
	 df(2,4,:) = zeros(size(a1d)); 
	 df(3,4,:) = - 10.0.*cos(a2 + a3 + a4 - 1.0.*a5) - 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(4,4,:) = zeros(size(a2d)); 
	 df(5,4,:) = 10.0.*cos(a3 + a4) - 10.0.*cos(a2 + a3 + a4 - 1.0.*a5) - 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(6,4,:) = zeros(size(a3d)); 
	 df(7,4,:) = 10.0.*cos(a3 + a4) + 12.0.*cos(a4) - 10.0.*cos(a2 + a3 + a4 - 1.0.*a5) - 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(8,4,:) = zeros(size(a4d)); 
	 df(9,4,:) = 10.0.*cos(a2 + a3 + a4 - 1.0.*a5) + 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(10,4,:) = zeros(size(a5d)); 
	 df(11,4,:) = 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(12,4,:) = zeros(size(a6d)); 
	 df(13,4,:) = zeros(size(a7)); 
	 df(14,4,:) = zeros(size(a7d)); 
	 df(1,5,:) = zeros(size(a1)); 
	 df(2,5,:) = zeros(size(a1d)); 
	 df(3,5,:) = -(real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2.*(imag(((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4)).*(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i).^2)./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)) - (real(((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4)).*(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i).^2).*imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2))./(imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2 + real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2); 
	 df(4,5,:) = zeros(size(a2d)); 
	 df(5,5,:) = -(real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2.*(imag(((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4)).*(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i).^2)./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)) - (real(((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4)).*(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i).^2).*imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2))./(imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2 + real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2); 
	 df(6,5,:) = zeros(size(a3d)); 
	 df(7,5,:) = -(real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2.*(imag(((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4)).*(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i).^2)./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)) - (real(((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4)).*(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i).^2).*imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2))./(imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2 + real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2); 
	 df(8,5,:) = zeros(size(a4d)); 
	 df(9,5,:) = (real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2.*(imag((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)) - (real((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).*imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2))./(imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2 + real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2); 
	 df(10,5,:) = zeros(size(a5d)); 
	 df(11,5,:) = (real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2.*(imag((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)) - (real((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).*imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2))./(imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2 + real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2); 
	 df(12,5,:) = zeros(size(a6d)); 
	 df(13,5,:) = (real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2.*(imag((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)) - (real((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7))./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).*imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)))./real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2))./(imag((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2 + real((cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)./(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)).^2); 
	 df(14,5,:) = zeros(size(a7d)); 
	 df(1,6,:) = zeros(size(a1)); 
	 df(2,6,:) = zeros(size(a1d)); 
	 df(3,6,:) = 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(4,6,:) = zeros(size(a2d)); 
	 df(5,6,:) = 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(6,6,:) = zeros(size(a3d)); 
	 df(7,6,:) = 12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(8,6,:) = zeros(size(a4d)); 
	 df(9,6,:) = -12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(10,6,:) = zeros(size(a5d)); 
	 df(11,6,:) = -12.0.*cos(a2 + a3 + a4 - 1.0.*a5 - 1.0.*a6); 
	 df(12,6,:) = zeros(size(a6d)); 
	 df(13,6,:) = zeros(size(a7)); 
	 df(14,6,:) = zeros(size(a7d)); 

end


function [f,df] = MechWalk_out4_nlfcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 


end


function [f,df] = MechWalk_out4_nlgcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 


end


end