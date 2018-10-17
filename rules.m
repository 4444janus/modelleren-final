function [ fncs ] = rules()
    % DO NOT EDIT
    fncs = l2.getRules();
    for i=1:length(fncs)
        fncs{i} = str2func(fncs{i});
    end
end

%ADD RULES BELOW
function result = ddr1( trace, params, t )
    result = {};
    
    for the_loneliness = trace(t).loneliness
        reduced_performance = trace(t).reduced_performance;
        has_loneliness = the_loneliness.arg{2};
            for reduced_performance = trace(t).reduced_performance
        the_agent = the_loneliness.arg{1}; %agent name
        
        
                if strcmpi(the_loneliness, 'very_lonely') && randi(10) > 3
                    reduced_performance = true;
                else
                    reduced_performance = false;
            
            end
        disp(reduced_performance);
        result = { result{:} {t+1, 'reduced_performance', {the_agent, reduced_performance}} };
        end
    end
end
function result = ddr2( trace, params, t )
    result = {};
    
    for the_loneliness = trace(t).loneliness
        alcoholism = trace(t).alcoholism;
        has_loneliness = the_loneliness.arg{2};
            for alcoholism = trace(t).alcoholism
        the_agent = the_loneliness.arg{1}; %agent name
        

                if strcmpi(the_loneliness, 'very_lonely') && randi(10) > 6
                    alcoholism = true;
                else
                    alcoholism = false;
            
                end
        disp(alcoholism);
        result = { result{:} {t+1, 'alcoholism', {the_agent, alcoholism}} };
        end
    end
end
function result = ddr3( trace, params, t )
    result = {};
    for the_loneliness = trace(t).loneliness
        cardiovascular_disease = trace(t).cardiovascular_disease;
        has_loneliness = the_loneliness.arg{2};
            for cardiovascular_disease = trace(t).cardiovascular_disease
        the_agent = the_loneliness.arg{1}; %agent name
        
        
                if strcmpi(the_loneliness, 'very_lonely') && randi(10) > 8
                    cardiovascular_disease = true;
                else
                    cardiovascular_disease = false;
            
                end
        disp(cardiovascular_disease);
        result = { result{:} {t+1, 'cardiovascular_disease', {the_agent, cardiovascular_disease}} };
            end
    end
end