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
        motivation = trace(t).motivation.arg{2};
     
        
        if intrinsic_motivation == true
            motivation = motivation + 1;
        else
            motivation = motivation - 1;
            
        end
        disp(motivation);
        result = { result{:} {t+1, 'motivation', {the_agent, motivation}} };
        
    end
end
