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
        
        physical_ability = trace(t).physical_ability;
        physical = trace(t).physical_ability.arg{2};
        
        if physical == true
            exercise = exercise + 0;
        else
            exercise = false; % misschien 0 ipv false?
        end
        
        result = { result{:} {t+1, 'exercise', {agent, exercise}} };
        
     end
end

%Domain time not exercised
function result = ddr1c( trace, params, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        time_not_exercised = trace(t).time_not_exercised.arg{2};
              
        
        if exercise == -1
            time_not_exercised = time_not_exercised + 1;
        else
            time_not_exercised = time_not_exercised - 1;
        end
        
        result = { result{:} {t+1, 'time_not_exercised', {agent, time_not_exercised}} };
        
     end
end

%Domain obesity
function result = ddr1d( trace, params, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        time = trace(t).time_not_exercised.arg{2};
        obesity = trace(t).obesity;
        obesity_chance = trace(t).obesity.arg{2};
        
        if sport == false && time > 9
            obesity_chance = true;
        else
            obesity_chance = false;
        end
        
       
        result = { result{:} {t+1, 'obesity_chance', {agent, obesity_chance}} };
        
     end
end

%Domain depression
function result = ddr1e( trace, params, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        time = trace(t).time_not_exercised.arg{2};
        depression = trace(t).depression;
        depression_chance = trace(t).depression.arg{2};
        
        if sport == false && time > 9
            depression_chance = true;
        else
            depression_chance = false;
        end
        
        result = { result{:} {t+1, 'depression_chance', {agent, depression_chance}} };
        
     end
end

%Domain self_esteem
function result = ddr1f( trace, params, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        time = trace(t).time_not_exercised.arg{2};
        self_esteem = trace(t).self_esteem;
        low_self_esteem = trace(t).self_esteem.arg{2};
        
        if sport == false && time > 9
            low_self_esteem = true;
        else
            low_self_esteem = false;
        end
               
        result = { result{:} {t+1, 'low_self_esteem', {agent, low_self_esteem}} };
        
     end
end

%Domain heart rate
function result = ddr1g( trace, params, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        heart_rate = trace(t).heart_rate;
        hartslag = trace(t).heart_rate.arg{2};
        
        if sport == true
            hartslag = 'high';
        else
            hartslag = 'low';
        end
               
        result = { result{:} {t+1, 'heart_rate', {agent, hartslag}} };
        
     end
end

%Domain skin conductance
function result = ddr1h( trace, params, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        skin_conductance = trace(t).skin_conductance;
        conductance = trace(t).skin_conductance.arg{2};
        
        if sport == true
            conductance = 'high';
        else
            conductance = 'low';
        end
               
        result = { result{:} {t+1, 'skin_conductance', {agent, conductance}} };
        
     end
end

%Analysis belief heart rate
function result = ddr2a( trace, params, t )
    result = {};
    
     
               
        result = { result{:} {t+1, 'skin_conductance', {agent, conductance}} };
       
end