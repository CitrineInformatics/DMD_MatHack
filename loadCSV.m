% parsing the databaseb

function [dataA dataB dataX] = loadCSV(filename);

soup = csvread(filename);
sumCols = sum(soup);
nonNullIdx = sumCols!=0;
strs = textread(filename, '%s');
dataA = strs(2:20:end,1);
dataB = strs(4:20:end,1);
dataX = soup(:,nonNullIdx);
dataA = arrayfun(@(x)(strtrunc(dataA{x,1}, length(dataA{x,1})-1)), 1:size(dataA,1), 'uniformoutput', false);
dataB = arrayfun(@(x)(strtrunc(dataB{x,1}, length(dataB{x,1})-1)), 1:size(dataB,1), 'uniformoutput', false);