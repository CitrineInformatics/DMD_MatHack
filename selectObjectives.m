function [new_selection,new_scores] = selectObjectives(scores,prior_samples,Ntrain)
    masked_scores = scores;
    masked_scores(prior_samples) = 0;
    [sorted_scores,sort_perm] = sort(masked_scores,'descend');
    new_selection = sort_perm(1:Ntrain)';
    new_scores = sorted_scores(1:Ntrain)';
end