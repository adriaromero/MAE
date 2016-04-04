function [ bitmap ] = bar_encoder( data, height, margin, code_bin, chars, digraphs )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MAE Unit 2, Set 2b, Exercise #2 - Bar Encoder
% ETSETB-UPC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input:
%       data: the string whose barcode is to be obtained
%       height: the height in pixels of each bar in the barcode
%       margin: the size in pixels of the horizontal and vertical
%           margins in white to be included in the barcode bitmaps.
%       code_bin: (binary) 44x12 matrix that contains code_bin(i,:)
%           the pixels n one row of the barcode of chars(i).
%           Narrow bars (0), narrow spaces (1), wide bars (00) and 
%           wide spaces (11).
%       chars: list of characters included in the original Code39
%       digraphs: cell array of size 128 that contains the character or
%           pair of characters in the original Code39 that are employed to
%           encode the ASCII values, so that diagraphs{i} stores the
%           character associated to ASCII value i-1, i=1,...,128.
%
% Output:
%        bitmap: the matrix that corresponds to the binary representation 
%           of the barcode of the string in "data", including all characters 
%           and spaces between them and the white frame arround them.
ascii = double(data);   % converts the string 'data' to ASCII numbers
ascii = 1 + ascii ;    % add 1 to adapt to digraphs numeration
code_39 = digraphs(ascii(:));  % convert ASCII to Code 39
bar_str = num2str(cell2mat(code_39));   % convert cell to string
len = length(bar_str);

bar_code(1,:) = code_bin(44,:);    % add '*' at the start of bar_code
bar_code(len+2,:) = code_bin(44,:);    % add '*' at the end of bar_code
for i = 1:len
    bar_code(i+1,:) = code_bin(find(chars==bar_str(i)),:); % get a matrix 
% with every Code39 binary character in each row
end

% Characters are separated by an additional narrow space (1 at the end)
ones_col = ones([size(bar_code,1) 1]);
bar_code = [ bar_code ones_col];

% Next step is to reshape bar_code to get the entire wide bar
bar_wide = numel(bar_code);
bar_code = reshape(bar_code', bar_wide, 1)';

% Compute the bar code dimensions
wide = 2*margin + bar_wide;
bar_height = height - 2*margin;

bar_code = repmat(bar_code, bar_height, 1); % Repeat bar_code line downwards

% Creat white margins
horizontal_margin = ones([margin bar_wide]);
vertical_margin = ones([height margin]);
% Add horizontal margins
bitmap = [horizontal_margin; bar_code; horizontal_margin];
% Add vertical margins
bitmap = [vertical_margin bitmap vertical_margin];

end

