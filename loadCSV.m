% parsing the database

function [data] = loadCSV(filename);

soup = csvread(filename);
sumCols = sum(soup);
nonNullIdx = sumCols!=0;
data = soup(:,nonNullIdx);