function features = feature_combiner2(input_data,Ncombos)
    Nsamples = size(input_data,1);
    Nfeatures = size(input_data,2);
    permlist = randi(Nfeatures,4,Ncombos);
    features = zeros(Nsamples,Ncombos+Nfeatures);
    features(:,1:Nfeatures) = input_data;
    for i=1:Ncombos,
      feat = input_data(:,permlist(:,j));
      features(:,i+Nfeatures) = combiner(combiner(feat(:,1),feat(:,2)),combiner(feat(:,3),feat(:,4)));
    end;