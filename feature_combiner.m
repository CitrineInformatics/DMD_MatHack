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
            k3 = eval(sprintf('f%d(k1,k2)',permFuncs(3,j)));
            if isinf(k3) || isnan(k3)
                k3 = 0;
            end
            features(i,j+Nfeatures) = k3;
        end
        if mod(i,100) == 0
            fprintf('i:%d\n',i);
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

