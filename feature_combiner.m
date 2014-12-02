function features = feature_combiner(input_data,Ncombos)
    Nsamples = size(input_data,1);
    Nfeatures = size(input_data,2);
    permlist = randi(Nfeatures,4,Ncombos);
    permFuncs = randi(4,3,Ncombos);
    features = zeros(Nsamples,Ncombos+Nfeatures);
    features(:,1:Nfeatures) = input_data;
    for i=1:Nsamples
        for j=1:Ncombos
            feat = input_data(i,permlist(:,j));
            k1 = eval(sprintf('f%d(feat(1),feat(2))',permFuncs(1,j)));
            k2 = eval(sprintf('f%d(feat(3),feat(4))',permFuncs(2,j)));
            features(i,j+Nfeatures) = eval(sprintf('f%d(k1,k2)',permFuncs(3,j)));
        end
    end
    
end

function v = f1(x,y)
    v = x+y;
end

function v = f2(x,y)
    v = x-y;
end

function v = f3(x,y)
    v = x*y;
end

function v = f4(x,y)
    v = x/y;
end

