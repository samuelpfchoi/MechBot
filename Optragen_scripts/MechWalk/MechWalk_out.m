function och = MechWalk_out()

och.icf = @MechWalk_out_icf; 
och.tcf = @MechWalk_out_tcf; 
och.fcf = @MechWalk_out_fcf; 

och.nlicf = @MechWalk_out_nlicf; 
och.nltcf = @MechWalk_out_nltcf; 
och.nlfcf = @MechWalk_out_nlfcf; 
och.nlgcf = @MechWalk_out_nlgcf; 



function [f,df] = MechWalk_out_icf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 


end


function [f,df] = MechWalk_out_tcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 
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


function [f,df] = MechWalk_out_fcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 


end


function [f,df] = MechWalk_out_nlicf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 
	 f(1,:) = 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a7) - 10.0.*cos(a6 + a7) + 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7);
	 f(2,:) = 10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7);

	 df(1,1,:) = zeros(size(a1)); 
	 df(2,1,:) = zeros(size(a1d)); 
	 df(3,1,:) = 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) + 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(4,1,:) = zeros(size(a2d)); 
	 df(5,1,:) = 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(6,1,:) = zeros(size(a3d)); 
	 df(7,1,:) = zeros(size(a4)); 
	 df(8,1,:) = zeros(size(a4d)); 
	 df(9,1,:) = - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(10,1,:) = zeros(size(a5d)); 
	 df(11,1,:) = 10.0.*sin(a6 + a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(12,1,:) = zeros(size(a6d)); 
	 df(13,1,:) = 10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(14,1,:) = zeros(size(a7d)); 
	 df(1,2,:) = zeros(size(a1)); 
	 df(2,2,:) = zeros(size(a1d)); 
	 df(3,2,:) = 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) + 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(4,2,:) = zeros(size(a2d)); 
	 df(5,2,:) = 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(6,2,:) = zeros(size(a3d)); 
	 df(7,2,:) = zeros(size(a4)); 
	 df(8,2,:) = zeros(size(a4d)); 
	 df(9,2,:) = - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(10,2,:) = zeros(size(a5d)); 
	 df(11,2,:) = 10.0.*cos(a6 + a7) - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(12,2,:) = zeros(size(a6d)); 
	 df(13,2,:) = 10.0.*cos(a6 + a7) + 12.0.*cos(a7) - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(14,2,:) = zeros(size(a7d)); 

end


function [f,df] = MechWalk_out_nltcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 
	 f(1,:) = 10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7);
	 f(2,:) = angle(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i));
	 f(3,:) = 0.93442623.*cos(a3).*(sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.778688525.*sin(a3).*(sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - (11.0655738.*cos(a7))./(cos(a7).^2 + sin(a7).^2) + (0.778688525.*sin(a7))./(cos(a7).^2 + sin(a7).^2) + 0.778688525.*cos(a3).*(cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 1.0.*sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) + 0.93442623.*sin(a3).*(cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 1.0.*sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) + 2.32240437.*sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + 2.32240437.*cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - (2.52459016.*cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (2.52459016.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (7.67759563.*cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (7.67759563.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2));
	 f(4,:) = 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a7) - 10.0.*cos(a6 + a7) + 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7);
	 f(5,:) = 10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7);
	 f(6,:) = angle((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i));
	 f(7,:) = 10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - (10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7));

	 df(1,1,:) = zeros(size(a1)); 
	 df(2,1,:) = zeros(size(a1d)); 
	 df(3,1,:) = 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) + 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(4,1,:) = zeros(size(a2d)); 
	 df(5,1,:) = 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(6,1,:) = zeros(size(a3d)); 
	 df(7,1,:) = zeros(size(a4)); 
	 df(8,1,:) = zeros(size(a4d)); 
	 df(9,1,:) = - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(10,1,:) = zeros(size(a5d)); 
	 df(11,1,:) = 10.0.*cos(a6 + a7) - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(12,1,:) = zeros(size(a6d)); 
	 df(13,1,:) = 10.0.*cos(a6 + a7) + 12.0.*cos(a7) - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(14,1,:) = zeros(size(a7d)); 
	 df(1,2,:) = -(real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2.*(imag((cos(a1 + a5 + a6 + a7).*1.0i - sin(a1 + a5 + a6 + a7))./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i).^2)./real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)) - (imag(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).*real((cos(a1 + a5 + a6 + a7).*1.0i - sin(a1 + a5 + a6 + a7))./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i).^2))./real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2))./(imag(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2 + real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2); 
	 df(2,2,:) = zeros(size(a1d)); 
	 df(3,2,:) = zeros(size(a2)); 
	 df(4,2,:) = zeros(size(a2d)); 
	 df(5,2,:) = zeros(size(a3)); 
	 df(6,2,:) = zeros(size(a3d)); 
	 df(7,2,:) = zeros(size(a4)); 
	 df(8,2,:) = zeros(size(a4d)); 
	 df(9,2,:) = -(real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2.*(imag((cos(a1 + a5 + a6 + a7).*1.0i - sin(a1 + a5 + a6 + a7))./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i).^2)./real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)) - (imag(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).*real((cos(a1 + a5 + a6 + a7).*1.0i - sin(a1 + a5 + a6 + a7))./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i).^2))./real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2))./(imag(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2 + real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2); 
	 df(10,2,:) = zeros(size(a5d)); 
	 df(11,2,:) = -(real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2.*(imag((cos(a1 + a5 + a6 + a7).*1.0i - sin(a1 + a5 + a6 + a7))./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i).^2)./real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)) - (imag(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).*real((cos(a1 + a5 + a6 + a7).*1.0i - sin(a1 + a5 + a6 + a7))./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i).^2))./real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2))./(imag(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2 + real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2); 
	 df(12,2,:) = zeros(size(a6d)); 
	 df(13,2,:) = -(real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2.*(imag((cos(a1 + a5 + a6 + a7).*1.0i - sin(a1 + a5 + a6 + a7))./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i).^2)./real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)) - (imag(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).*real((cos(a1 + a5 + a6 + a7).*1.0i - sin(a1 + a5 + a6 + a7))./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i).^2))./real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2))./(imag(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2 + real(1./(cos(a1 + a5 + a6 + a7) + sin(a1 + a5 + a6 + a7).*1.0i)).^2); 
	 df(14,2,:) = zeros(size(a7d)); 
	 df(1,3,:) = zeros(size(a1)); 
	 df(2,3,:) = zeros(size(a1d)); 
	 df(3,3,:) = 0.93442623.*cos(a3).*(cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.778688525.*sin(a3).*(cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.778688525.*cos(a3).*(sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + 1.0.*cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.93442623.*sin(a3).*(sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + 1.0.*cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) + 2.32240437.*cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 2.32240437.*sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)); 
	 df(4,3,:) = zeros(size(a2d)); 
	 df(5,3,:) = 0.93442623.*cos(a3).*(cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 1.0.*sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.93442623.*sin(a3).*(sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.778688525.*cos(a3).*(sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.778688525.*sin(a3).*(cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 1.0.*sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (1.0.*sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))); 
	 df(6,3,:) = zeros(size(a3d)); 
	 df(7,3,:) = zeros(size(a4)); 
	 df(8,3,:) = zeros(size(a4d)); 
	 df(9,3,:) = 0.93442623.*cos(a3).*(sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.778688525.*sin(a3).*(sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) + 0.778688525.*cos(a3).*(cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + 1.0.*sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) + 0.93442623.*sin(a3).*(cos(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + 1.0.*sin(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) + 2.32240437.*sin(a2).*((cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 2.32240437.*cos(a2).*((sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + (2.52459016.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (1.0.*sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (2.52459016.*cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2); 
	 df(10,3,:) = zeros(size(a5d)); 
	 df(11,3,:) = 0.778688525.*sin(a3).*(sin(a2).*((sin(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + cos(a2).*((cos(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.93442623.*cos(a3).*(sin(a2).*((sin(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + cos(a2).*((cos(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.778688525.*cos(a3).*(cos(a2).*((sin(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 1.0.*sin(a2).*((cos(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.93442623.*sin(a3).*(cos(a2).*((sin(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 1.0.*sin(a2).*((cos(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 2.32240437.*sin(a2).*((sin(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 2.32240437.*cos(a2).*((cos(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + (2.52459016.*cos(a5).*((1.0.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (2.52459016.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (7.67759563.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (7.67759563.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)); 
	 df(12,3,:) = zeros(size(a6d)); 
	 df(13,3,:) = 0.778688525.*sin(a3).*(sin(a2).*((sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + cos(a2).*((cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.93442623.*cos(a3).*(sin(a2).*((sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + cos(a2).*((cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) + (0.778688525.*cos(a7))./(cos(a7).^2 + sin(a7).^2) + (11.0655738.*sin(a7))./(cos(a7).^2 + sin(a7).^2) - 0.778688525.*cos(a3).*(cos(a2).*((sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 1.0.*sin(a2).*((cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 0.93442623.*sin(a3).*(cos(a2).*((sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 1.0.*sin(a2).*((cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2))) - 2.32240437.*sin(a2).*((sin(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) - (cos(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) - 2.32240437.*cos(a2).*((cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (1.0.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2)) + (2.52459016.*cos(a5).*((cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (1.0.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (2.52459016.*sin(a5).*((cos(a6).*cos(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) - (sin(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2))))./(cos(a5).^2 + sin(a5).^2) + (7.67759563.*cos(a6).*sin(a7))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)) + (7.67759563.*cos(a7).*sin(a6))./((cos(a6).^2 + sin(a6).^2).*(cos(a7).^2 + sin(a7).^2)); 
	 df(14,3,:) = zeros(size(a7d)); 
	 df(1,4,:) = zeros(size(a1)); 
	 df(2,4,:) = zeros(size(a1d)); 
	 df(3,4,:) = 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) + 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(4,4,:) = zeros(size(a2d)); 
	 df(5,4,:) = 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(6,4,:) = zeros(size(a3d)); 
	 df(7,4,:) = zeros(size(a4)); 
	 df(8,4,:) = zeros(size(a4d)); 
	 df(9,4,:) = - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(10,4,:) = zeros(size(a5d)); 
	 df(11,4,:) = 10.0.*sin(a6 + a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(12,4,:) = zeros(size(a6d)); 
	 df(13,4,:) = 10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(14,4,:) = zeros(size(a7d)); 
	 df(1,5,:) = zeros(size(a1)); 
	 df(2,5,:) = zeros(size(a1d)); 
	 df(3,5,:) = 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) + 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(4,5,:) = zeros(size(a2d)); 
	 df(5,5,:) = 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(6,5,:) = zeros(size(a3d)); 
	 df(7,5,:) = zeros(size(a4)); 
	 df(8,5,:) = zeros(size(a4d)); 
	 df(9,5,:) = - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(10,5,:) = zeros(size(a5d)); 
	 df(11,5,:) = 10.0.*cos(a6 + a7) - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(12,5,:) = zeros(size(a6d)); 
	 df(13,5,:) = 10.0.*cos(a6 + a7) + 12.0.*cos(a7) - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(14,5,:) = zeros(size(a7d)); 
	 df(1,6,:) = zeros(size(a1)); 
	 df(2,6,:) = zeros(size(a1d)); 
	 df(3,6,:) = (real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2.*(imag((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)) - (real((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).*imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2))./(imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2 + real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2); 
	 df(4,6,:) = zeros(size(a2d)); 
	 df(5,6,:) = (real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2.*(imag((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)) - (real((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).*imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2))./(imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2 + real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2); 
	 df(6,6,:) = zeros(size(a3d)); 
	 df(7,6,:) = (real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2.*(imag((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)) - (real((cos(a2 + a3 + a4).*1.0i - sin(a2 + a3 + a4))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).*imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2))./(imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2 + real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2); 
	 df(8,6,:) = zeros(size(a4d)); 
	 df(9,6,:) = -(real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2.*(imag(((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7)).*(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i).^2)./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)) - (real(((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7)).*(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i).^2).*imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2))./(imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2 + real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2); 
	 df(10,6,:) = zeros(size(a5d)); 
	 df(11,6,:) = -(real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2.*(imag(((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7)).*(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i).^2)./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)) - (real(((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7)).*(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i).^2).*imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2))./(imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2 + real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2); 
	 df(12,6,:) = zeros(size(a6d)); 
	 df(13,6,:) = -(real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2.*(imag(((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7)).*(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i).^2)./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)) - (real(((cos(a5 + a6 + a7).*1.0i - sin(a5 + a6 + a7)).*(cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i))./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i).^2).*imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)))./real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2))./(imag((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2 + real((cos(a2 + a3 + a4) + sin(a2 + a3 + a4).*1.0i)./(cos(a5 + a6 + a7) + sin(a5 + a6 + a7).*1.0i)).^2); 
	 df(14,6,:) = zeros(size(a7d)); 
	 df(1,7,:) = zeros(size(a1)); 
	 df(2,7,:) = zeros(size(a1d)); 
	 df(3,7,:) = -12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(4,7,:) = zeros(size(a2d)); 
	 df(5,7,:) = -12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(6,7,:) = zeros(size(a3d)); 
	 df(7,7,:) = zeros(size(a4)); 
	 df(8,7,:) = zeros(size(a4d)); 
	 df(9,7,:) = 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(10,7,:) = zeros(size(a5d)); 
	 df(11,7,:) = 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(12,7,:) = zeros(size(a6d)); 
	 df(13,7,:) = 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(14,7,:) = zeros(size(a7d)); 

end


function [f,df] = MechWalk_out_nlfcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 
	 f(1,:) = 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a7) - 10.0.*cos(a6 + a7) + 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7);
	 f(2,:) = 10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7);

	 df(1,1,:) = zeros(size(a1)); 
	 df(2,1,:) = zeros(size(a1d)); 
	 df(3,1,:) = 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) + 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(4,1,:) = zeros(size(a2d)); 
	 df(5,1,:) = 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(6,1,:) = zeros(size(a3d)); 
	 df(7,1,:) = zeros(size(a4)); 
	 df(8,1,:) = zeros(size(a4d)); 
	 df(9,1,:) = - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(10,1,:) = zeros(size(a5d)); 
	 df(11,1,:) = 10.0.*sin(a6 + a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(12,1,:) = zeros(size(a6d)); 
	 df(13,1,:) = 10.0.*sin(a6 + a7) + 12.0.*sin(a7) - 10.0.*sin(a5 - 1.0.*a2 + a6 + a7) - 12.0.*sin(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(14,1,:) = zeros(size(a7d)); 
	 df(1,2,:) = zeros(size(a1)); 
	 df(2,2,:) = zeros(size(a1d)); 
	 df(3,2,:) = 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) + 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(4,2,:) = zeros(size(a2d)); 
	 df(5,2,:) = 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(6,2,:) = zeros(size(a3d)); 
	 df(7,2,:) = zeros(size(a4)); 
	 df(8,2,:) = zeros(size(a4d)); 
	 df(9,2,:) = - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(10,2,:) = zeros(size(a5d)); 
	 df(11,2,:) = 10.0.*cos(a6 + a7) - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(12,2,:) = zeros(size(a6d)); 
	 df(13,2,:) = 10.0.*cos(a6 + a7) + 12.0.*cos(a7) - 10.0.*cos(a5 - 1.0.*a2 + a6 + a7) - 12.0.*cos(a5 - 1.0.*a3 - 1.0.*a2 + a6 + a7); 
	 df(14,2,:) = zeros(size(a7d)); 

end


function [f,df] = MechWalk_out_nlgcf(a1,a1d,a2,a2d,a3,a3d,a4,a4d,a5,a5d,a6,a6d,a7,a7d)
 


end


end