function [w1, b1, w2, b2, w3, b3]= ho_kashyap (num)
    Class = get_data();
    Class = Class';
    ClassA = Class(1:5000,:);
    ClassB = Class(5001:10000,:);
    ClassC = Class(10001:15000,:);
    
    ClassA(:,5) = 1;
    ClassB(:,5) = 1;
    ClassC(:,5) = 1;
    
    % Decision boundary between ClassA and ClassB: w1
    [w1, b1] = get_plane (ClassA, ClassB, num);
    [w2, b2] = get_plane (ClassA, ClassC, num);
    [w3, b3] = get_plane (ClassB, ClassC, num);
   
end

function [w, b] = get_plane (ClassA, ClassB, num)
    A = ClassA;
    
    %Negate ClassB
    A(5001:10000,:) = -ClassB;

    % HO-KASHYAP PROCEDURE 
    b(1:10000,1) = 1;
    n = 0;
    temp(1:10000, 1) = 0;
    
    while (n < num)
        w = A\b;
        temp = (A * w - b);
        
        b = b + 0.5 * (temp + abs(temp));
        n = n + 1;
    end  
end