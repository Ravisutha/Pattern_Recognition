function [decision] = calulate_class(theta1, theta2, theta3, x)
    %   theta   : Parameters
    %   x       : Input vector
    %   decision: Class 1,2 or 3
    
    %   C : Covariance
    %   M : Mean
    C1 = theta1(:,2:end);
    M1 = theta1(:,1);
    
    C2 = theta2(:,2:end);
    M2 = theta2(:,1);
    
    C3 = theta3(:,2:end);
    M3 = theta3(:,1);
    
    %   iC: Inverse of Covariance
    iC1 = inv(C1);
    iC2 = inv(C2);
    iC3 = inv(C3);
    
    % Discriminant Function for each class 
    decision1 = (-0.5 * (x - M1)' * iC1 * (x - M1)) - 0.5 * log(det (C1));
    
    decision2 = (-0.5 * (x - M2)' * iC2 * (x - M2)) - 0.5 * log(det (C2));
    
    decision3 = (-0.5 * (x - M3)' * iC3 * (x - M3)) - 0.5 * log(det (C3));
    
    %Classify 'x' into one of three classes
    if (decision1 >= decision2 && decision1 >= decision3)
        decision = 1;
    elseif (decision2 >= decision1 && decision2 >= decision3)
        decision = 2;
    elseif (decision3 >= decision1 && decision3 >= decision2)
        decision = 3;
    else
        decision = 2;
    end
end