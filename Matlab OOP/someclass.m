classdef someclass
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        a
        b
        c
    end
    
    methods
        function obj = someclass(inputArg1,inputArg2)
            %UNTITLED4 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = myfunc1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

