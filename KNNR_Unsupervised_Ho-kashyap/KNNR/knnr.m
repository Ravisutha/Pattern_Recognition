function knnr()
    [Class] = get_data ();
    ClassA = Class (:, 1:5000);
    ClassB = Class (:, 5001:10000);
    ClassC = Class (:, 10001:15000);

    [X] = get_test_data ();
    
    for i = 1:15000
        for j = 1:15000
            d(1, j) = distance (Class(:, j), X(:, i));
        end
        [A, B] = sort (d);
        result (i, :) = B(1, 1:5);
    end
    
    knnr1 (result);
    knnr3 (result);
    knnr5 (result);
end

function knnr1 (result)
    ref = [3 1 2 3 2 1];
    temp = 0;
    n = 1;
    C1 = 0; C2 = 0; C3 = 0;
    C12 = 0; C13 = 0; 
    C21 = 0; C23 = 0;
    C31 = 0; C32 = 0;
    
    fileID = fopen ('E:\Spring 2017\Pattern Recognition\Assignment 2\DATA\knnr1', 'wt');
    formatSpec = '%d\n';
    for i=1:15000
        if (result(i,1) < 5001)
            temp = 1;
        elseif (result(i, 1) > 5000 & result (i, 1) < 10001)
            temp = 2;
        else
            temp = 3;
        end
        fprintf(fileID, formatSpec, temp);    
        
        n = mod (i, 6);
        if (n == 0)
            n = 6;
        end
       
        if (temp == ref(1, n))
            if (temp == 1)
                C1 = C1 + 1;
            elseif (temp == 2)
                C2 = C2 + 1;
            else
                C3 = C3 + 1;
            end
        else
            if (ref(1, n) == 1)
                if (temp == 2)
                    C12 = C12 + 1;
                elseif (temp == 3)
                    C13 = C13 + 1;
                end
            elseif (ref(1, n) == 2)
                if (temp == 1)
                    C21 = C21 + 1;
                elseif (temp == 3)
                    C23 = C23 + 1;
                end
            else
                if (temp == 1)
                    C31 = C31 + 1;
                elseif (temp == 2)
                    C32 = C32 + 1;
                end
            end
        end
    end
    K11 = [C1 C12 C13]
    K12 = [C2 C21 C23]
    K13 = [C3 C31 C32]
    fclose('all');
end

function knnr3 (result)
    ref = [3 1 2 3 2 1];
    temp1 = 0;
    temp2 = 0;
    temp3 = 0;
    n = 1;
    C1 = 0; C2 = 0; C3 = 0;
    C12 = 0; C13 = 0; 
    C21 = 0; C23 = 0;
    C31 = 0; C32 = 0;
    
    fileID = fopen ('E:\Spring 2017\Pattern Recognition\Assignment 2\DATA\knnr3', 'wt');
    formatSpec = '%d\n';
    
    for i=1:15000
        temp1 = find_class (result(i, 1));        
        temp2 = find_class (result(i, 2));        
        temp3 = find_class (result(i, 3));
        
        temp = vote3 (temp1, temp2, temp3);
        fprintf(fileID, formatSpec, temp);    
        
        n = mod (i, 6);
        if (n == 0)
            n = 6;
        end
        
        if (temp == ref(1, n))
            if (temp == 1)
                C1 = C1 + 1;
            elseif (temp == 2)
                C2 = C2 + 1;
            else
                C3 = C3 + 1;
            end
        else
            if (ref(1, n) == 1)
                if (temp == 2)
                    C12 = C12 + 1;
                elseif (temp == 3)
                    C13 = C13 + 1;
                end
            elseif (ref(1, n) == 2)
                if (temp == 1)
                    C21 = C21 + 1;
                elseif (temp == 3)
                    C23 = C23 + 1;
                end
            else
                if (temp == 1)
                    C31 = C31 + 1;
                elseif (temp == 2)
                    C32 = C32 + 1;
                end
            end
        end
    end
    K11 = [C1 C12 C13]
    K12 = [C2 C21 C23]
    K13 = [C3 C31 C32]
    fclose('all');    
end

function knnr5 (result)
    ref = [3 1 2 3 2 1];
    temp1 = 0;
    temp2 = 0;
    temp3 = 0;
    temp4 = 0;
    temp5 = 0;
    
    n = 1;
    C1 = 0; C2 = 0; C3 = 0;
    C12 = 0; C13 = 0; 
    C21 = 0; C23 = 0;
    C31 = 0; C32 = 0;
    
    fileID = fopen ('E:\Spring 2017\Pattern Recognition\Assignment 2\DATA\knnr5', 'wt');
    formatSpec = '%d\n';
    for i=1:15000
        temp1 = find_class (result(i, 1));        
        temp2 = find_class (result(i, 2));        
        temp3 = find_class (result(i, 3));
        temp4 = find_class (result(i, 4));
        temp5 = find_class (result(i, 5));
        
        temp = vote5 (temp1, temp2, temp3, temp4, temp5);
        fprintf(fileID, formatSpec, temp);    
        
        n = mod (i, 6);
        if (n == 0)
            n = 6;
        end
        
        if (temp == ref(1, n))
            if (temp == 1)
                C1 = C1 + 1;
            elseif (temp == 2)
                C2 = C2 + 1;
            else
                C3 = C3 + 1;
            end
        else
            if (ref(1, n) == 1)
                if (temp == 2)
                    C12 = C12 + 1;
                elseif (temp == 3)
                    C13 = C13 + 1;
                end
            elseif (ref(1, n) == 2)
                if (temp == 1)
                    C21 = C21 + 1;
                elseif (temp == 3)
                    C23 = C23 + 1;
                end
            else
                if (temp == 1)
                    C31 = C31 + 1;
                elseif (temp == 2)
                    C32 = C32 + 1;
                end
            end
        end
    end
    K11 = [C1 C12 C13]
    K12 = [C2 C21 C23]
    K13 = [C3 C31 C32]
    fclose('all');    
end

function [d] = distance (v1, v2)
    x = v1 - v2;
    d = norm (x);
    %x = x.^2;
    %d = sqrt (x(1, 1) + x(2, 1) + x(3, 1) + x(4, 1));
end

function [temp] = find_class(r)
    if (r < 5001)
                temp = 1;
    elseif ((r > 5000) && (r < 10001))
                temp = 2;
    else
                temp = 3;
    end
end

function [temp] = vote3(temp1, temp2, temp3)
    C1 = 0;
    C2 = 0;
    C3 = 0;
    
    r = [temp1 temp2 temp3];
    for i= 1:3
        if (r(i) == 1)
            C1 = C1 + 1;
        elseif (r(i) == 2)
            C2 = C2 + 1;
        else 
            C3 = C3 + 1;
        end
    end
    
    A = [C1 C2 C3];
    [B, temp] = max (A);
    %{
    if ((C1 >= C2) && (C1 >= C3))
        temp = 1;
    elseif ((C2 >= C1) && (C2 > C3))
        temp = 2;
    else
        temp = 3;
    end
    %}
end
function [temp] = vote5(temp1, temp2, temp3, temp4, temp5)
    C1 = 0;
    C2 = 0;
    C3 = 0;
    
    r = [temp1 temp2 temp3 temp4 temp5];
    for i= 1:5
        if (r(i) == 1)
            C1 = C1 + 1;
        elseif (r(i) == 2)
            C2 = C2 + 1;
        else 
            C3 = C3 + 1;
        end
    end
    
    A = [C1 C2 C3];
    [B, temp] = max(A); 
    %{
    if ((C1 >= C2) && (C1 >= C3))
        temp = 1;
    elseif ((C2 >= C1) && (C2 >= C3))
        temp = 2;
    else
        temp = 3;
    end
    %}
end