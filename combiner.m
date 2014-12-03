[newFeat] = function combiner(V1, V2)
  
  choice = randi(4);
  
  if (choice==1),
    newFeat = V1.*V2;
  elseif (choice==2),
    newFeat = V1./(1+V2);
  elseif (choice==3),
    newFeat = V1+V2;
  else (choice==4),
    newFeat = V1-V2;
  end;
  
