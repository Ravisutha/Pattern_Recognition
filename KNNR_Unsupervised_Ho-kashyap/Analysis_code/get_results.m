function [Class] = get_results()
    fileID = fopen ('E:\Spring 2017\Pattern Recognition\Assignment 2\DATA\result1', 'r');
      
    formatSpec = '%f';
    
    for j=1:15000
        Class(:,j) = fscanf (fileID, formatSpec, 1);
    end
    
    fclose('all');
end