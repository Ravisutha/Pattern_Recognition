function validation(A)
i1 = 0;
i2 = 0;
i3 = 0;
    for i=1:15000
        if (A(i) == 1)
            i1 = i1 + 1;
        elseif (A(i) == 2)
            i2 = i2 + 1;
        else
            i3 = i3 + 1;
        end
    end
    i1
    i2
    i3
end