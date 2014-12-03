function [figMerit] = objective(predicted_data);

%  score enthalpy
s1 = 10*min(1,exp(0.4-2*predicted_data(:,3)));

%  score direct band gaps
s2 = 10*min(1,min(exp(6-2*predicted_data(:,5)),0.1*exp(2*(predicted_data(:,5)-0.5))));

%  score indirect band gaps
s3 = 10*min(1,min(exp(6-2*predicted_data(:,2)),0.1*exp(2*(predicted_data(:,2)-0.5))));

%  score indirect conduction band minimum
s4 = 5*min(1,exp(-4*predicted_data(:,1)));

%  score direct conduction band minimum
s5 = 5*min(1,exp(-4*predicted_data(:,4)));

%  score indirect valance band maximum
s6 = 5*min(1,exp(-4*(1.23-predicted_data(:,7))));

%  score direct valance band maximum
s7 = 5*min(1,exp(-4*(1.23-predicted_data(:,6))));

figMerit = s1 + max(s2,s3) + max(s4,s5) + max(s6,s7);