function [ varargout ] = call_bar_encoder( varargin )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MAE Unit 2, Set 2b, Exercise #2 - Call Bar Encoder
% ETSETB-UPC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input:
%       data: the string whose barcode is to be obtained
%       height: the height in pixels of each bar in the barcode
%       margin: the size in pixels of the horizontal and vertical
%           margins in white to be included in the barcode bitmaps.
% 
% Output:
%       bitmap: the matrix that corresponds to the binary representation 
%           of the barcode of the string in "data", including all characters 
%           and spaces between them and the white frame arround them.

% Load Code 39 data (chars, code and digraphs)
load('FullASCIICode39.mat');

% check number of inputs
inputs = nargin;

if inputs == 3
    data = varargin{1};
    height = varargin{2};
    margin = varargin{3};
elseif inputs == 2
    data = varargin{1};
    height = varargin{2};
    margin = 10;
elseif inputs == 1
    data = varargin{1};
    height = 40;
    margin = 10;
end
    
% Check string data only contains ASCII symbols
if any(double(data) > 128) || any(double(data) < 1) || isempty(data)
    error('String must contain only ASCII characters');
end

% Call functions to generate the bar code
code_bin = binary_code( code );
bitmap = bar_encoder( data, height, margin, code_bin, chars, digraphs);

% Check number of outputs
outputs = nargout;

if outputs == 0
    bar_code_plot( bitmap, data, margin )
elseif outputs == 1
    varargout{1} = bitmap;
end

end

