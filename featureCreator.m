function [newFeatures] = featureCreator(input_data, Ncombos)
    Nsamples = size(input_data,1);
    Nfeatures = size(input_data,2);
    permlist = randi(Nfeatures,4,Ncombos);
    newFeatures = zeros(Nsamples,Ncombos);
    for i=1:Ncombos,
      curPerm = input_data(:,permlist(:,i));
      features(:,i) = combiner(combiner(curPerm(:,1),curPerm(:,2)),combiner(curPerm(:,3),curPerm(:,4)));
    end;