function [normalData means ranges] = featureNorm(data)

means = mean(data);
ranges = max(data)-min(data);
normalData = bsxfun(@ldivide,ranges,bsxfun(@minus,means,data));

