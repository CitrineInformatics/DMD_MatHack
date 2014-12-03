Ntrain = 1000;
Ncombos = 1;

[input_data solution_data] = loadData;
[normalData means ranges] = featureNorm(input_data);
addData = featureCreator(normalData, Ncombos);
X = [ones(size(normalData,1),1) normalData addData];


trainSet = randperm(size(X,1), Ntrain);
param = zeros(size(X,2),size(solution_data,2));

%  scale all energies
solution_data(:,1) = solution_data(:,1) - 4.5;
solution_data(:,4) = solution_data(:,4) - 4.5;
solution_data(:,6) = solution_data(:,6) - 4.5;
solution_data(:,7) = solution_data(:,7) - 4.5;

prior_samples = [];
for i=1:2
    [new_samples,new_scores] = directedSearch(X,solution_data,prior_samples,Ntrain);
    prior_samples = [prior_samples; new_samples];
end


scatter(predictedMerit, totalMerit, 'r');
%  xlim([0,30]);
%  ylim([0,30]);




