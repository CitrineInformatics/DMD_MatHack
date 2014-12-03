Ntrain = 1000;
lambda = 10;
Niter = 10000;
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

for i=1:size(solution_data,2),
  x = X(trainSet,:);
  initial_theta = rand(size(X, 2), 1);
  y = solution_data(trainSet,i);
  options = optimset('GradObj', 'on', 'MaxIter', Niter);
  [theta, J, exit_flag] = ...
  fminunc(@(t)(computeCost(t, x, y, lambda)), initial_theta, options);
  param(:,i) = theta;
end;

predicted_data = X*param;

[predictedMerit] = objective(predicted_data);

[totalMerit] = objective(solution_data);


scatter(predictedMerit, totalMerit, 'r');
%  xlim([0,30]);
%  ylim([0,30]);




