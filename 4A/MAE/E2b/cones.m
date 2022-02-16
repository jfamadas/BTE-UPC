function [xx, yy, z ] = cones( arg1, arg2, arg3 )
% » help cones
% CONES: function that plots cones and cone cuts.
% [xx,yy,z]=cones(alpha)    Compute a cone with vertex at the origin and
%                           vertex angle equal to alpha (degrees)
%                           To plot it use surf(xx,yy,z) or contour(xx,yy,z)
% [xx,yy,z]=cones(alpha,beta) Compute the cone cut using a plane with angle
%                           beta (degrees)
% cones(alpha,'3D') or cones(alpha,beta,'3D'): 3D plot of the cone or the cone cut
% cones(alpha,'C') or cones(alpha,beta,'C'): contour plot of the cone or the cone cut


    alpha = arg1*pi/180;
    x = -10:0.5:10;
    y = x;
    
    [xx,yy] = meshgrid(x,y);
    
    z = -sqrt(xx.^2+yy.^2)/tan(alpha);
    z(find(z<z(1,21))) = z(1,21);
    
    
    
    
     
    if(nargin == 1)
       
        %cone without specific plot
        figure(1)
        surf(xx,yy,z);
        title(sprintf('alpha = %dº', arg1));
        figure(2)
        contour(xx,yy,z); 
        
    elseif(nargin == 2)
    
        if(ischar(arg2))
            % cone with specific plot (arg2)
            switch arg2
                case '3D'
                    surf(xx,yy,z);
                    title(sprintf('alpha = %dº', arg1));
                case 'C'
                    contour(xx,yy,z);
            end
                    
            
        elseif(isnumeric(arg2))
            
            %cut without specific plot
            beta = arg2*pi/180;
            z = min(z,tan(beta)*(abs(min(min(xx)))+xx)+ min(min(z)));
            
            
        
        end
        
    
    elseif(nargin == 3)
        
        %cut with specific plot (arg3)
        beta = arg2*pi/180;
        z = min(z,tan(beta)*(abs(min(min(xx)))+xx)+ min(min(z)));
        switch arg3
                case '3D'
                    surf(xx,yy,z);
                    title(sprintf('alpha = %dº , beta = %dº', arg1, arg2));
                case 'C'
                    contour(xx,yy,z);
        end 
        
    end
    
end

