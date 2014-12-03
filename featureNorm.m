function [normalData means ranges] = featureNorm(data)

means = mean(data);
ranges = max(data)-min(data);
normalData = (data-means)./ranges;

