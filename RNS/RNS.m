function [ varargout ] = RNS( varargin )
% RNS: Representation of numbers and computation in the RNS domain 
% 
% [x_i] = RNS(x,prime_list), being x a scalar
%      Compute the RNS representation of the integer in x in terms of 
%      prime numbers in vector 'prime_list' and return the residues in 
%      vector 'x_i' having the same dimensions as 'prime_list'.
% [x] = RNS(x_i,prime_list), being x_i a vector
%      Reconstruct the integer number x from its residue representation 
%      stored in 'x_i' in terms of prime numbers in vector 'prime_list'.
% [z] = RNS(x,y,op,prime_list) being x,y either scalars or vectors
%      Compute the vector z that has the same size as x and y and contains 
%      the operation 'op' of vectors x and y, either the addition or 
%      subtraction (if 'op' is '+' or '-') or the Schur or element-wise 
%      product (if op is '·'). The computation is done using the RNS 
%      representation of x, y and z

% check number of inputs
inputs = nargin;

if (inputs == 2 && length(varargin{1}) == 1)   % First function case
    x = varargin{1};
    prime_list = varargin{2};
    x_i = mod(x,prime_list);
    varargout{1} = x_i;
elseif (inputs == 2 && length(varargin{1}) > 1) % Second function case      
    x_i = varargin{1};
    prime_list = varargin{2};
    N = length(prime_list);
    M = prod(prime_list);
    [ M_i, alpha_i ] = constant_computations( prime_list );
    i = 1:1:N;
    j = M_i(i).*mod(alpha_i(i).*x_i(i),prime_list(i));
    x = mod(sum(j),M);
    varargout{1} = x;
else          % Third function case
    x = varargin{1};
    y = varargin{2};
    op = varargin{3};
    prime_list = varargin{4};
    if(length(x) == 1 && length(y) == 1)    % x, y scalars
        if(strcmp(op,'+'))
            z = x + y;
        elseif(strcmp(op,'-'))
            z = x - y;
        elseif(strcmp(op,'·'))
            z = x*y;
        end
    else
        if(strcmp(op,'+'))
            z = mod(x+y,prime_list);
        elseif(strcmp(op,'-'))
            z = mod(x-y,prime_list);
        elseif(strcmp(op,'·'))
            z = mod(x.*y,prime_list);
        end
    end
    varargout{1} = z;
end
end

