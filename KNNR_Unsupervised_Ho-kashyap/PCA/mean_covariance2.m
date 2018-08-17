function [theta1, theta2, theta3] = mean_covariance2(Class)
    
    % Mean vector for each class
    m = mean (Class(:, 1:5000), 2);

    % Covariance Vector for each class
    C = cov (Class(:, 1:5000)');
    
    theta1 = [m C]
    
    % Mean vector for each class
    m = mean (Class(:, 5001:10000), 2);

    % Covariance Vector for each class
    C = cov (Class(:, 5001:10000)');

    theta2 = [m C];
    
    % Mean vector for each class
    m = mean (Class(:, 10001:15000), 2);

    % Covariance Vector for each class
    C = cov (Class(:, 10001:15000)');

    theta3 = [m C];
end