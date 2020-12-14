classdef employeeA
    properties
        Name
        Category = 'Trainee'
        IDNumber
    end
    methods
        function E = set.Name(E,name)
            % Name must be single row, char
            if ischar(name) && ndims(name)==2 && size(name,1)==1
                E.Name = name;
            else
                error('Invalid Name');
            end
        end
        
        function E = set.Category(E, newCategory)
            % Control allowable Category values
            possCategory = {'Trainee', 'Intern', 'PartTime'}
            switch newCategory
                case possCategory % Possible Category
                    E.Category = newCategory;
                otherwise
                    error('Invalid Category');
            end
        end
        
        function E = set.IDNumber(E,idn)
           % IDNumber must be positive, scalar integer.
           if isnumeric(idn) && isscalar(idn) && ceil(idn)==floor(idn) && idn>0
              E.IDNumber = idn;
           else
               error('Invalid IDNumber');
           end
        end
        
    end
end