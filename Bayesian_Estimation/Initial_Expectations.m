function [decision12, decision13, decision23] = Initial_Expectations(x, theta1, theta2, theta3)
%{
    %calculate_decision region
    if (calculate_class(theta1, theta2, x) == 1)
        decision12 = 'A';
    else
        decision12 = 'B';
    end
    
    if (calculate_class(theta1, theta3, x) == 1)
        decision13 = 'A';
    else
        decision13 = 'C';
    end
    
    if (calculate_class(theta2, theta3, x) == 1)
        decision23 = 'B';
    else
        decision23 = 'C';
    end
end
%}