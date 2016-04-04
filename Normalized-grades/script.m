%EX4  NORMALIZED STUDENT GRADES

% Grading student performance fairly is not a trivial task when considering 
% the different relative difficulty of the different units of one typical 
% academic course. One possible procedure, used extensively, applies normalization 
% to the student grading of every unit prior to average grade computation. 
% Eventually, the average grade is also normalized and a Gaussian-type 
% approximation is used for the final grade.

% 1. Read xls file
filename = 'Ex4_data.xls';
A = xlsread(filename);

% 1.1. Get weight (w) of each unit 
w = A(1,:);
    % 1.1.1. Check if w is normalized to 1
    if sum(w) ~= 1
        error('Course units weigth not normalized to 1');
    end

% 1.2. Get number of units (M) and students (N)
M = length(w);
N = length(A)-1;

% 1.3. Build G matrix: G matrix contains M columns (course units) and
%                      N student rows
G = A(2:length(A),1:M);

% 2. Ask for expected ratio of failing students (p) and average course 
%    grade (a)
p = input('Enter the expected students failing ratio: ');
a = input('Enter the expected average course grade: ');
    %2.1. Check that expected failing ratio is smaller than 0.5
    if p >= 0.5
        error('Expected failing ratio must be smaller than 0.5');
    end
    %2.2. Check that expected average course grade is grater than 5
    if a <= 5
        error('Expected average course grade must be grater than 5');
    end
    
% 3. Compute the normalized unit grade
    % 3.1. Compute the estimated mean of each unit j: m(j)
    m = mean(G);
    
    % 3.2. Compute the standard deviation of grades of unit j
    sigma = std(G);

for j = 1:M
    Z(:,j) = (G(:,j) - m(j))./sigma(j);
end   
    
% 4. Compute the averaged grade
for j = 1:M
    prod(:,j) = w(j)*Z(:,j);
end  
i = 1:N;
avg_G = sum(prod')';
    % 4.1. Compute the mean of average grades
    avg_m = mean(avg_G);
    % 4.2. Compute the std of averaged grades
    avg_sigma = std(avg_G);
    
% 5. Compute the normalized average grade
avg_Z = (avg_G - avg_m)./avg_sigma;

% 6. Compute the student final course grade
    % 6.1. Compute the avg_Z increase
    in_avg_Z = erfcinv(p);

out_Z = max ( min (a + (a - 5)*(avg_Z/in_avg_Z),10),0);

    % 6.2. Round grade to one decimal value
    out_Z = round(out_Z,1);

% 7. Compute the grades histogram with 11 bins
histogram(out_Z,11);

% 8. Return XLS file with the final course grade 
    % 8.1. Copy existing XLS file to another new one
    copyfile('Ex4_data.xls','Ex4_final.xls')
    
    % 8.2. Add title 'Final grades' to cell G1
    xlswrite('Ex4_final.xls','final grade','G1');
    
    % 8.3. Write final grades to the new created file
    xlswrite('Ex4_final.xls',out_Z,'G3');

