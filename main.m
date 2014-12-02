[input_data,solution_data] = loadData;
% takes in input_data and solution_data
% input_data is format Nperovskites x Nelementalfeatures
% solution_data is format Nperovskites x 7
% (CBind, EGind, Hf, CBdir, EGdir, VBdir, VBind)

% number of random feature combinations to use
Ncombos = 100;
% number of new samples to take on each iteration
Nsample_per_itr = 10;

Nperovskites = size(input_data,1);

% compute random combined feature set for each perovskite
% features is Nperovskite x (Ncombos+Nelementalfeatures)
features = feature_combiner(input_data,Ncombos);

% samples is a logical array of size Nperovskites x 1
% 0 if unsampled, 1 if sampled
samples = zeros(Nperovskites,1);
%%
% select random initial samples
init_samples = randperm(Nperovskites,Nsample_per_itr);
samples(init_samples) = 1;
samples = logical(samples);

% model fit
fprintf('Starting Hf Lasso\n');
Hf = lasso(features(samples,:),solution_data(samples,3));
fprintf('Starting CBdir Lasso\n');
CBdir = lasso(features(samples,:),solution_data(samples,4));
fprintf('Starting CBind Lasso\n');
CBind= lasso(features(samples,:),solution_data(samples,1));
fprintf('Starting VBdir Lasso\n');
VBdir = lasso(features(samples,:),solution_data(samples,6));
fprintf('Starting VBind Lasso\n');
VBind= lasso(features(samples,:),solution_data(samples,7));
fprintf('Starting EGind Lasso\n');
EGind = lasso(features(samples,:),solution_data(samples,2));
fprintf('Starting EGdir Lasso\n');
EGdir= lasso(features(samples,:),solution_data(samples,5));
fprintf('Finished Lasso Steps\n');
%%

% takes the different lasso'd models and computes a single value for each
% case, setting all previously sampled values to -Inf
objective = obj_func(Hf,CBdir,CBind,VBdir,VBind,EGdir,EGind,samples);
