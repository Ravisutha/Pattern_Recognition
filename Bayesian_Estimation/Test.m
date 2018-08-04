[theta1, theta2, theta3] = mean_covariance();
[Class] = File_reading();
ClassA = Class(:, 1:5000);
ClassB = Class(:, 5001:10000);
ClassC = Class(:, 10001:15000);

for i=1:5000
    x = ClassA(:,i);
    [decision] = calculate_class(theta1, theta2, theta3, x);
    
    if (decision == 1)
        countA = countA + 1;
    end

    if (decision == 2)
        countB = countB + 1;
    end
    
    if (decision == 3)
        countC = countC + 1;
    end
    
end 
countA
countB
countC
countA = 0;
countB = 0;
countC = 0;
for i=1:5000
    x = ClassB(:, i);
    [decision] = calculate_class(theta1, theta2, theta3, x);
    
    if (decision == 1)
        countA = countA + 1;
    end
    
    if (decision == 2)
        countB = countB + 1;
    end
    
    if (decision == 3)
        countC = countC + 1;
    end
    
end
countA
countB
countC
countA = 0;
countB = 0;
countC = 0;

for i=1:5000
    x = ClassC(:,i);
    [decision] = calculate_class(theta1, theta2, theta3, x);
  
    if (decision == 1)
        countA = countA + 1;
    end
    
    if (decision == 2)
        countB = countB + 1;
    end
    
    if (decision == 3)
        countC = countC + 1;
    end
    
end
countA
countB
countC
countA = 0;
countB = 0;
countC = 0;