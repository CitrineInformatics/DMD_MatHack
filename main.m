% takes in input_data and solution_data
% input_data is format Nperovskites x Nelementalfeatures
% solution_data is format Nperovskites x 7
% (Hf,CBdir,CBind,VBdir,VBind,DirGap,IndGap)

% number of random feature combinations to use
Ncombos = 10000;
% number of new samples to take on each iteration
Nsample_per_itr = 10;

Nperovskites = size(input_data,1);

% compute random combined feature set for each perovskite
% features is Nperovskite x (Ncombos+Nelementalfeatures)
features = feature_combined(input_data,Ncombos);

% samples is a logical array of size Nperovskites x 1
% 0 if unsampled, 1 if sampled
samples = zeros(Nperovskites,1);

% select random initial samples
init_samples = randperm(Nperovskites,Nsample_per_itr);
samples(init_samples) = true;

% model fit
Hf = lasso(features(samples,:),solution_data(samples,1));
CBdir = lasso(features(samples,:),solution_data(samples,2));
CBind= lasso(features(samples,:),solution_data(samples,3));
VBdir = lasso(features(samples,:),solution_data(samples,4));
VBind= lasso(features(samples,:),solution_data(samples,5));
DirGap = lasso(features(samples,:),solution_data(samples,6));
IndGap= lasso(features(samples,:),solution_data(samples,7));

% takes the different lasso'd models and computes a single value for each
% case, setting all previously sampled values to -Inf
objective = obj_func(Hf,CBdir,CBind,VBdir,VBind,DirGap,IndGap,samples);
