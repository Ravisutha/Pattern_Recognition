[theta1, theta2, theta3] = mean_covariance();
[Class] = File_reading2();

countA = 0;
countB = 0;
countC = 0;

fileID = fopen ('E:\Spring 2017\Pattern Recognition\Assignment 1\Data\ravisutha-classified-takehome1.txt', 'wt');
formatSpec = '%d\n';

for i=1:15000
    x = Class(:,i);
    [decision] = calculate_class(theta1, theta2, theta3, x);
    fprintf(fileID, formatSpec, decision); 
end

fclose('all');