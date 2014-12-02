function [input_data solution_data] = loadData;

load elem_data.mat;
load perovskite.dat;

prv = perovskite;
elm = elem_data;
input_data = zeros(size(prv,1), 2*size(elm,2)+1);
solution_data = prv(:,4:end);

for i=1:size(prv,1),
  input_data(i,:) = [elm(elm(:,1)==prv(i,1),:) elm(elm(:,1)==prv(i,2),:) prv(i,3)];
end;
