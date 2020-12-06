clear
numElements = 500;
numB = 24;
C = zeros(1,numB);

for i=1:numB
   A = rand(numElements); % Create a random grid of size numElements x numElements - A
   B = A;
   idx = A < 0.5;
   B(idx) = -A(idx); % Get B; B = A if A > 0.5, otherwise B = -A
   
   % Compute max eigenvalue
   C(:,i) = max(eig(B));
end