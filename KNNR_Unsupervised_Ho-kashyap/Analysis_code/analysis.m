function analysis()
    Test = get_results ();
    C1 = 0; C2 = 0; C3 = 0;
    C12 = 0; C13 = 0; 
    C21 = 0; C23 = 0;
    C31 = 0; C32 = 0;

    ref = [3 1 2 3 2 1];
    for i=1:15000
        temp = Test(i);
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
    K12 = [C21 C2 C23]
    K13 = [C31 C32 C3]
end