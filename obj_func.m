% returns best matching 
function objective = obj_func(Hf,CBdir,CBind,VBdir,VBind,DirGap,IndGap,samples)
    objective = zeros(size(samples));

% screening out bad structures    
    % first step: Stability of structure Hf < 0.2eV
    % if > 0.2eV, then structure is unstable
    objective(Hf > 0.2) = -Inf;
    % second step: want non-metallic material
    % need a band gap either direct or indirect
    objective(DirGap == 0 && IndGap == 0) = -Inf;
    
    % third step: need VB maximum above O2/H2O potential (=1.23eV)
    objective(VBdir < 1.23 && VBind < 1.23) = -Inf;
    
    % fourth step: need CB minimum below H2/H+ potential (=0eV)
    objective(CBdir > 0 && CBind > 0) = -Inf;
    
    % fifth step: remove previously sampled points
    objective(samples) = -Inf;
    
% actual objective function, want to minimize band gap around 1.23
    remainder = (objective == 0);
    objective(remainder) = 1./sqrt((DirGap-1.23).^2+(IndGap-1.23).^2);
end