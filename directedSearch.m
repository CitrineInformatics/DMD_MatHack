function [new_samples,predicted_scores] = directedSearch(X, solution_data, prior_samples, Ntrain)

    lambda = 10;
    Niter = 10000;
    if isempty(prior_samples)
        prior_samples = randperm(size(X,1), Ntrain);
    end

    param = zeros(size(X,2),size(solution_data,2));

    for i=1:size(solution_data,2),
      x = X(prior_samples,:);
      initial_theta = rand(size(X, 2), 1);
      y = solution_data(prior_samples,i);
      options = optimset('GradObj', 'on', 'MaxIter', Niter);
      [theta, J, exit_flag] = ...
      fminunc(@(t)(computeCost(t, x, y, lambda)), initial_theta, options);
      param(:,i) = theta;
    end;
    
    predicted_data = X*param;
    [predictedMerit] = objective(predicted_data);
    
    [new_samples,predicted_scores] = selectObjectives(predicted_data,prior_samples,Ntrain);   
    
end