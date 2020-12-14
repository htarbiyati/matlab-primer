classdef dateE7
    properties (Access=private)
        day = 1
        month = 1
        year = yearE7(1)
    end
    
    methods
        % Constructor
        function D = dateE7(d,m,y)
            D.year = yearE7(y);
            D.month = m;
            D.day = d;
        end
    end
    
    methods(Static = true, Access = private)
        % All static methods are called this way, className.methodName
        function charMonth = m2m(numericalMonth)
            M = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';...
                'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'];
            charMonth = M(numericalMonth,:);
        end
    end
end
% The dot-notation syntax => Y = objX.SomeMethod(A2,A3,A4,...)
% The other one is => Y = SomeMethod(objX,A2,A3,A4,...)
% Method dispatching and precedence example
% The below code is in file ClassS - It defines ClassS.m class and uses the 
% InferiorClasses cell array to define ClassI as inferior class to ClassS
% classdef (InferiorClasses={?ClassI}) ClassS
% properties
%   ...
% end
% methods
%   ...
% end
% end

%% Inheritance concept is not covered in this file