function [J, grad] = computeCost(theta, X, y, lambda)

m = size(X,1);
h = X * theta;
D = h - y;
J = (D'*D + lambda*theta'*theta)/double(2.0 * m);

grad = (1.0/double(m))*(D'*X)' + (lambda/double(m))*theta;
grad(1) = grad(1)-(lambda/double(m))*theta(1);

