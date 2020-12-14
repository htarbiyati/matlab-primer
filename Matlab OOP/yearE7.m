classdef yearE7
    properties(SetAccess = private) % Properties of this class are set to private
        Value = 1;
        LeapYear = false;
        M = [31 28 31 30 31 30 31 31 30 31 30 31];
    end
    
    methods
        function Y = yearE7(Yv) % Constructor method
            if isscalar(Yv) && isnumeric(Yv) && floor(Yv)==ceil(Yv) && Yv>0
                Y.Value = Yv;
                Y.LeapYear = rem(Yv,4)==0 && (rem(Yv,100)~=0 || rem(Yv,400)==0);
                if Y.LeapYear
                    Y.M(2) = 29;
                end
            elseif isa(Yv,'yearE7')
                Y = Yv;
            else
                error('Invalid Yv');
            end
        end
        function N = nDays(Y)
            N = sum(Y,M);
        end
        function C = char(Y)
            C = int2str(Y.Value);
        end
        function display(Y)
            disp(['yearE7: ' char(Y)])
        end
        function [d,m] = n2dm(Nday, Y)
            cM = cumsum(Y,M);
            m = find(Nday<=cM,1);
            d = Nday -sum(Y.M(1:m-1));
        end
        
        function Y2 = plus(Y,N)     
            % Overloads + operator, you can do the same for subtraction(minus) &
            % others like ge(greater than or equal), gt, eq(equal), le, lt
           Y2 = yearE7(Y.Value + N); 
        end
    end
end
