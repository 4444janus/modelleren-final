function [ fncs ] = rules()
    % DO NOT EDIT
    fncs = l2.getRules();
    for i=1:length(fncs)
        fncs{i} = str2func(fncs{i});
    end
end

%Domain motivation to exercise
function result = ddr1a( trace, params, t )
    result = {};
    
    for intrinsic_motivation = trace(t).intrinsic_motivation
        intrinsic = trace(t).intrinsic_motivation.arg{2};
        
        agent = intrinsic_motivation.arg{1}; %agent name
        
        %for motivation = trace(t).motivation
        %motivatie = trace(t).motivation.arg{2};
        motivation = trace(t).motivation;
        motivatie = trace(t).motivation.arg{2};
        motivatie = 0;
        
        
        if intrinsic == true
            motivatie = motivatie + 1;
        else
            motivatie = motivatie - 1;
            
        end
        disp(motivatie);
        
        goals = trace(t).goals;
        goal = trace(t).goals.arg{2};
        
        if strcmp(goal, 'high')
            motivatie = motivatie + 1;
        elseif strcmp(goal, 'medium')
            motivatie = motivatie + 0;
        elseif strcmp(goal, 'low')
            motivatie = motivatie - 1;
        disp(goal);
        
        social_environment = trace(t).social_environment;
        social = trace(t).social_environment.arg{2};
        
        if strcmp(social, 'high')
            motivatie = motivatie + 1;
        elseif strcmp(social, 'medium')
            motivatie = motivatie + 0;
        elseif strcmp(social, 'low')
            motivatie = motivatie - 1;
        end
        disp(social);
        
        weather = trace(t).weather;
        
        if weather == true
            motivatie = motivatie + 1;
        else
            motivatie = motivatie - 1;
        end
        disp(weather);
        
        
        
        result = { result{:} {t+1, 'motivation', {agent, motivatie}} };
        end
    end
end

%Domain exercise
function result = ddr1b( trace, params, t )
    result = {};
    
     for motivation = trace(t).motivation
        motivation_exercise = trace(t).motivation.arg{2};
        agent = trace(t).motivation.arg{1};
        exercise = trace(t).exercise.arg{2};
        exercise = 0;
        display(motivation_exercise);
        
        
        if ge(motivation_exercise, 5)
            exercise = exercise + 1;
        else
            exercise = exercise - 1;
        end
        
        result = { result{:} {t+1, 'exercise', {agent, exercise}} };
        
     end
end
