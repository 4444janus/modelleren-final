function [ fncs ] = rules()
    % DO NOT EDIT
    fncs = l2.getRules();
    for i=1:length(fncs)
        fncs{i} = str2func(fncs{i});
    end
end

%Domain rules
function result = ddr1( trace, params, t )
    result = {};
    
    for intrinsic_motivation = trace(t).intrinsic_motivation
        intrinsic = trace(t).intrinsic_motivation.arg{2};
        
        agent = intrinsic_motivation.arg{1}; %agent name
        
%         motivation = trace(t).motivation
%         motivatie = trace(t).motivation.arg{2};
        motivatie = 0;
     
        
        if intrinsic == true
            motivatie = motivatie + 1;
        else
            motivatie = motivatie - 1;
            
        end
        disp(motivatie);
        result = { result{:} {t+1, 'motivation', {agent, motivatie}} };
        
    end
end
