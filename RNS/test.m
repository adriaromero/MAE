% Script to test he proper operation of the RNS function

prime_list = [3 5 7];  % i.e.
N = length(prime_list);
% Call RNS with an integer number x of your choice to obtain its RNS repres.
x = 20;
[x_i] = RNS(x,prime_list);

% Call it again with the RNS representation you have just obtained to 
% retrieve the number you had chosen.
[x] = RNS(x_i,prime_list);

% Call the RNS function with two random generated vectors x,y of length 100
% to compute vector x + y and verify that the function returns the right
% vector values.
x = randi(100,1,N);
y = randi(100,1,N);
[z] = RNS(x,y,'+',prime_list);
x_scalar = RNS(x,prime_list);
y_scalar = RNS(y,prime_list);
z_scalar = x_scalar + y_scalar;
isequal(z,RNS(z_scalar,prime_list))

% Call it with two randomly generated vectors x,y of length 100 to compute
% vector x · y and verify that the function returns the right vector
% values.
x = randi(100,1,N);
y = randi(100,1,N);
[z] = RNS(x,y,'·',prime_list);
x_scalar = RNS(x,prime_list);
y_scalar = RNS(y,prime_list);
z_scalar = x_scalar * y_scalar;
isequal(z,RNS(z_scalar,prime_list))