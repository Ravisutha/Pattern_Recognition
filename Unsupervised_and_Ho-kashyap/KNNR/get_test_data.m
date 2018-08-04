function [Class] = get_test_data()
    fileID = fopen ('E:\Spring 2017\Pattern Recognition\Assignment 2\DATA\test_sp2017_v19', 'r');
      
    formatSpec = '%f %f %f %f';
    
    for j=1:15000
        Class(:,j) = fscanf (fileID, formatSpec, 4);
    end
    
    fclose('all');
end