function [theta1, theta2, theta3] = mean_covariance()
[Class] = File_reading();
ClassA = Class(:, 1:5000);
ClassB = Class(:, 5001:10000);
ClassC = Class(:, 10001:15000);
    
    % Mean vector for each class
    meanA = mean (ClassA, 2);
    meanB = mean (ClassB, 2);
    meanC = mean (ClassC, 2);

    % Covariance Vector for each class
    C1 = cov (ClassA')
    C2 = cov (ClassB')
    C3 = cov (ClassC')
    
    theta1 = [meanA C1];
    theta2 = [meanB C2];
    theta3 = [meanC C3];
end