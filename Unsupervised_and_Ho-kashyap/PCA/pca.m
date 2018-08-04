function [Y, A2] = pca()
    Class = get_data();

    [m, C] = mean_covariance (Class);
    
    %Subtract mean from all vectors to get the mean as 0
    for i=1:15000
        Class1(:,i) = Class(:,i) - m;
    end
    
    [m, C] = mean_covariance (Class1);
    
    %Diagonalize covariance matrix
    [A, b] = eig (C);
    
    A2 = [A(:, 4) A(:, 3)]
    
    %Change of basis from 'I' to eigen vectors
    Y = A2' * Class;
    
end