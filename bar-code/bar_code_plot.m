function [ ] = bar_code_plot( bitmap, data, margin )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MAE Unit 2, Set 2b, Exercise #2 - Bar Code Plot
% ETSETB-UPC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input:
%       bitmap: the matrix that corresponds to the binary representation 
%           of the barcode of the string in "data", including all characters 
%           and spaces between them and the white frame arround them.
%       data: the string whose barcode is to be obtained
%       margin: the size in pixels of the horizontal and vertical
%           margins in white to be included in the barcode bitmaps.
% 
% Output:
%       bar_code_img: Final bar code image with data text printed

figure; hold on;
imagesc(bitmap);
colormap('gray');
axis equal; axis off;
x = length(bitmap)/2 - 2*length(data);
y = margin/2;
text(x, y, data);

end

