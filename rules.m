function [ fncs ] = rules()
    % DO NOT EDIT
    fncs = l2.getRules();
    for i=1:length(fncs)
        fncs{i} = str2func(fncs{i});
    end
end

%Domain motivation to exercise
function result = ddr1a( trace, ~, t )
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
function result = ddr1b( trace, ~, t )
    result = {};
    
     for motivation = trace(t).motivation
        motivation_exercise = trace(t).motivation.arg{2};
        agent = trace(t).motivation.arg{1};
        exercise = trace(t).exercise.arg{2};
        exercise = 0;
        display(motivation_exercise);
        
        
        if ge(motivation_exercise, -3)
            exercise = exercise + 1;
        else
            exercise = exercise - 1;
        end
        
        physical_ability = trace(t).physical_ability;
        physical = trace(t).physical_ability.arg{2};
        
        if physical == true
            exercise = exercise + 0;
        else
            exercise = -1; 
        end
        
        result = { result{:} {t+1, 'exercise', {agent, exercise}} };
        
     end
end

%Domain time not exercised
function result = ddr1c( trace, ~, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        time_not_exercised = trace(t).time_not_exercised.arg{2};
              
        
        if sport == -1
            time_not_exercised = time_not_exercised + 1;
        else
            time_not_exercised = 0;
        end
        
        result = { result{:} {t+1, 'time_not_exercised', {agent, time_not_exercised}} };
        
     end
end

%Domain obesity
function result = ddr1d( trace, ~, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        time = trace(t).time_not_exercised.arg{2};
        obesity = trace(t).obesity;
        obesity_chance = trace(t).obesity.arg{2};
        
        if sport == -1 && time > 9
            obesity_chance = true;
        else
            obesity_chance = false;
        end
        
       
        result = { result{:} {t+1, 'obesity', {agent, obesity_chance}} };
        
     end
end

%Domain depression
function result = ddr1e( trace, ~, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        time = trace(t).time_not_exercised.arg{2};
        depression = trace(t).depression;
        depression_chance = trace(t).depression.arg{2};
        
        if sport == -1 && time > 9
            depression_chance = true;
        else
            depression_chance = false;
        end
        
        result = { result{:} {t+1, 'depression', {agent, depression_chance}} };
        
     end
end

%Domain self_esteem
function result = ddr1f( trace, ~, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        time = trace(t).time_not_exercised.arg{2};
        self_esteem = trace(t).self_esteem;
        low_self_esteem = trace(t).self_esteem.arg{2};
        
        if sport == -1 && time > 9
            low_self_esteem = true;
        else
            low_self_esteem = false;
        end
               
        result = { result{:} {t+1, 'self_esteem', {agent, low_self_esteem}} };
        
     end
end

%Domain heart rate
function result = ddr1g( trace, ~, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        heart_rate = trace(t).heart_rate;
        hartslag = trace(t).heart_rate.arg{2};
        
        if sport > 0
            hartslag = 'high';
        else
            hartslag = 'low';
        end
               
        result = { result{:} {t+1, 'heart_rate', {agent, hartslag}} };
        
     end
end

%Domain skin conductance
function result = ddr1h( trace, ~, t )
    result = {};
    
     for exercise = trace(t).exercise
        sport = trace(t).exercise.arg{2};
        agent = trace(t).exercise.arg{1};
        skin_conductance = trace(t).skin_conductance;
        conductance = trace(t).skin_conductance.arg{2};
        
        if sport > 0
            conductance = 'high';
        else
            conductance = 'low';
        end
               
        result = { result{:} {t+1, 'skin_conductance', {agent, conductance}} };
        
     end
end


%Analysis model

% Analysis belief heart rate
function result = ddr2a( trace, ~, t )
    result = {};
    
    for hartslag = trace(t).heart_rate
        hartslagen = trace(t).heart_rate.arg{2};
        agent = trace(t).heart_rate.arg{1};
     
        if strcmp(hartslagen, 'high')
            believe_heart_rate = 'high';
        else 
            believe_heart_rate = 'low';
              
       
        end
        result = { result{:} {t+1, 'belief_heart_rate', {agent, believe_heart_rate}} };
    end
end

% Analysis belief skin conductance
function result = ddr2b( trace, ~, t )
    result = {};
    
    for skin = trace(t).skin_conductance
        skin_conductances = trace(t).skin_conductance.arg{2};
        agent = trace(t).heart_rate.arg{1};
     
        if strcmp(skin_conductances, 'high')
            believe_skin_conductance = 'high';
        else 
            believe_skin_conductance = 'low';
              
       
        end
        result = { result{:} {t+1, 'belief_skin_conductance', {agent, believe_skin_conductance}} };
    end
end

% Analysis belief exercise
function result = ddr2c( trace, ~, t )
    result = {};
    
    for exercise = trace(t).exercise
        belief_skin_conductance = trace(t).belief_skin_conductance.arg{2};
        belief_heart_rate = trace(t).belief_heart_rate.arg{2};
        agent = trace(t).heart_rate.arg{1};
     
        if strcmp(belief_skin_conductance, 'high') && strcmp(belief_heart_rate, 'high')
            believe_exercise = true;
        else 
            believe_exercise = false;
              
       
        end
        result = { result{:} {t+1, 'belief_exercise', {agent, believe_exercise}} };
    end
end

% Analysis belief motivation
function result = ddr2d( trace, ~, t )
    result = {};
    
    for belief_exercise = trace(t).belief_exercise
        belief_exercises = trace(t).belief_exercise.arg{2};
        agent = trace(t).belief_exercise.arg{1};
     
        if belief_exercises == true
            believe_motivation = true;
        else 
            believe_motivation = false;
              
       
        end
        result = { result{:} {t+1, 'belief_motivation', {agent, believe_motivation}} };
    end
end

% Analysis desire and assessment
function result = ddr2e( trace, ~, t )
    result = {};
    
    for belief_motivation = trace(t).belief_motivation
        motivation = trace(t).belief_motivation.arg{2};
        agent = trace(t).belief_motivation.arg{1};
        desire_to_be_motivated = true;
        
        if motivation == false && desire_to_be_motivated == true
            assessment = true;
        else 
            assessment = false;
              
       
        end
        result = { result{:} {t+1, 'assessment', {agent, assessment}} };
    end
end


%Support model

%Support desire goals
function result = ddr3a( trace, ~, t )
    result = {};
    
    for the_assessment = trace(t).assessment
        assessment = trace(t).assessment.arg{2};
        agent = trace(t).assessment.arg{1};
        
        if assessment == true
            desire_goals = true;
        else 
            desire_goals = false;
              
       
        end
        result = { result{:} {t+1, 'desire_goals', {agent, desire_goals}} };
    end
end

%Support desire send notification
function result = ddr3b( trace, ~, t )
    result = {};
    
    for desire_goals = trace(t).desire_goals
        desire_for_goals = trace(t).desire_goals.arg{2};
        agent = trace(t).desire_goals.arg{1};
        
        if desire_for_goals == true
            desire_send_notification = true;
        else 
            desire_send_notification = false;
              
       
        end
        result = { result{:} {t+1, 'desire_send_notification', {agent, desire_send_notification}} };
    end
end

%Support proposal send notification
function result = ddr3c( trace, ~, t )
    result = {};
    
    for desire_send_notification = trace(t).desire_send_notification
        desire_to_send_notification = trace(t).desire_send_notification.arg{2};
        agent = trace(t).desire_send_notification.arg{1};
        
        if desire_to_send_notification == true
            proposal_send_notification = true;
        else 
            proposal_send_notification = false;
              
       
        end
        result = { result{:} {t+1, 'proposal_send_notification', {agent, proposal_send_notification}} };
    end
end

%Support effect support
% function result = ddr3d( trace, ~, t )
%     result = {};
%     
%     for desire_send_notification = trace(t).desire_send_notification
%         desire_to_send_notification = trace(t).desire_send_notification.arg{2};
%         agent = trace(t).desire_send_notification.arg{1};
%         
%         goals = trace(t).goals;
%         goal = trace(t).goals.arg{2};
%         
%         if desire_to_send_notification == true && strcmp(goal, 'medium')
%             goal = 'high';
%         elseif desire_to_send_notification == true && strcmp(goal, 'low')
%             goal = 'medium';
%         else
%             goal = 'high';
%               
%        
%         end
%         result = { result{:} {t+1, 'goals', {agent, goal}} };
%     end
% end