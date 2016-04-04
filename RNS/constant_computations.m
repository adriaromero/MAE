function [ M_i, alpha_i ] = constant_computations( prime_list )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MAE Unit 2, Set 2b, Exercise #2 - Constant Computation
% ETSETB-UPC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input:
%       prime_list: (vector) set of N prime numbers {m(1), m(2), ..., m(N)}
% 
% Output:
%       M_i: (vector) set of N values {M(1), M(2), ..., M(N)} computed as 
%                     M(i)=M/m(i)
%       alpha_i: (vector) set of N values {alpha(1), ..., alpha(N)} 
%                         computed as  alpha(i) =  mod(M(i)^-1, m(i))

N = length(prime_list);

% Compute M as M=m(1)*m(2)*...*m(N)
M = prod(prime_list);

M_i = M ./ prime_list;

alpha_i = mod(M_i, prime_list);

end

