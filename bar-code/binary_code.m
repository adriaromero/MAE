function [ code_bin ] = binary_code( code )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MAE Unit 2, Set 2b, Exercise #2 - Bar Code
% ETSETB-UPC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input:
%           code: (integer) matrix of variable size that contains the
%           sequence of narrow-wide bars and spaces that corresponds to
%           each of the characters in the original Code39. code(i,:)
%           contains the barcode of chars(i). Value 1 for narrow and 2 for
%           wide. 
% Output:
%           code_bin: (binary) 44x12 matrix that contains code_bin(i,:)
%           the pixels n one row of the barcode of chars(i).
%           Narrow bars (0), narrow spaces (1), wide bars (00) and 
%           wide spaces (11).

[m n] = size(code);   % m rows; n columns of code matrix

for i = 1:m
    k = 1;
    for j = 1:n
        if mod(j,2)==0   % even = white 
            if code(i,j) == 1   % narrow 
                code_bin(i,k) = 1;  % white narrow
                k = k + 1;
            else                % wide
                code_bin(i,k) = 1;  % white narrow
                code_bin(i,k+1) = 1;
                k = k + 2;
            end
        else             % odd = black 
            if code(i,j) == 1   % narrow
                code_bin(i,k) = 0;  % black narrow
                k = k + 1;
            else                % wide
                code_bin(i,k) = 0;  % black wide
                code_bin(i,k+1) = 0; 
                k = k + 2;
            end
        end
    end
end

end

