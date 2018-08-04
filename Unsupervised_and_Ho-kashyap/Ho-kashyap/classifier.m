function [result] = classifier (num)
    [w1, b1, w2, b2, w3, b3] = ho_kashyap(140);
        
    if (num == 1)
        Class = get_data();
        Class = Class';
        ClassA = Class(1:5000,:);
        ClassB = Class(5001:10000,:);
        ClassC = Class(10001:15000,:);

        ClassA(:,5) = 1;
        ClassB(:,5) = 1;
        ClassC(:,5) = 1;
        
        c1 = 0;
        c2 = 0;
        c3 = 0;
        
        for i=1:5000
            temp1 = ClassA(i, :) * w1;
            temp2 = ClassA(i, :) * w2;
            temp3 = ClassA(i, :) * w3;
            
            if ((temp1 >= 0.0) & (temp2 >= 0.0))
                c1 = c1 + 1;
            elseif ((temp1 < 0.0) & (temp3 > 0.0))
                c2 = c2 + 1;
            else
                c3 = c3 + 1;
            end
        end
        
        c1
        c2
        c3
        c1 = 0;
        c2 = 0;
        c3 = 0;
        
        for i=1:5000
            temp1 = ClassB(i, :) * w1;
            temp2 = ClassB(i, :) * w2;
            temp3 = ClassB(i, :) * w3;
            
            if ((temp1 >= 0.0) && (temp2 >= 0.0))
                c1 = c1 + 1;
            elseif ((temp1 < 0.0) && (temp3 > 0.0))
                c2 = c2 + 1;
            else
                c3 = c3 + 1;
            end
        end
        c1
        c2
        c3
        c1 = 0;
        c2 = 0;
        c3 = 0;
        for i=1:5000
            temp1 = ClassC(i, :) * w1;
            temp2 = ClassC(i, :) * w2;
            temp3 = ClassC(i, :) * w3;
            
            if ((temp1 >= 0.0) && (temp2 >= 0.0))
                c1 = c1 + 1;
            elseif ((temp1 < 0.0) && (temp3 > 0.0))
                c2 = c2 + 1;
            else
                c3 = c3 + 1;
            end
        end
        c1
        c2
        c3
    else
        
        ref = [3 1 2 3 2 1];
        Class = get_test_data ();
        %Class = Class';
        C1 = 0; C2 = 0; C3 = 0;
        C12 = 0; C13 = 0; 
        C21 = 0; C23 = 0;
        C31 = 0; C32 = 0;
        Class = Class';
        Class(:,5) = 1;
        fileID = fopen ('C:\Users\ravis\Desktop\result2', 'wt');
        formatSpec = '%d\n';
        for i = 1:15000
            n = mod (i, 6);
            
            if (n == 0)
                n = 6;
            end

            temp1 = Class(i, :) * w1;
            temp2 = Class(i, :) * w2;
            temp3 = Class(i, :) * w3;
            
            if ((temp1 >= 0.0) && (temp2 >= 0.0))
                result(i, 1) = 1;
            
            elseif ((temp1 < 0.0) && (temp3 > 0.0))
                result(i, 1) = 2;
            else
                result(i, 1) = 3;
            end
            
            temp = result (i, 1);
            fprintf(fileID, formatSpec, temp);
            
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
    end
    fclose('all');
end