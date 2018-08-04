function [theta1, theta2, theta3] = baysian_estimator()
[ClassA, ClassB, ClassC] = File_opening();

meanA = mean (ClassA, 2);
meanB = mean (ClassB, 2);
meanC = mean (ClassC, 2);

% Covariance Vector for each class
C1 = cov (ClassA');
C2 = cov (ClassB');
C3 = cov (ClassC');

i = 5000;

c1_new = eye(4);
meanA = C1 * inv(C1 + (1/i) * c1_new) * mean(ClassA, 2) + (1 / i) * c1_new * inv(C1 + (1/i) * c1_new) * meanA;
C1 = C1 * inv(C1 + (1/i) * c1_new) * (1/i) * c1_new;
    
c2_new = (eye(4));
meanB = C2 * inv(C2 + (1/i) * c2_new) * mean(ClassB, 2) + (1 / i) * c2_new * inv(C2 + (1/i) * c2_new) * meanB;
C2 = C2 * inv(C2 + (1/i) * c2_new) * (1/i) * c2_new;
    
c3_new = eye (4);
meanC = C3 * inv(C3 + (1/i) * c3_new) * mean(ClassC, 2) + (1 / i) * c3_new * inv(C3 + (1/i) * c3_new) * meanC;
C3 = C3 * inv(C3 + (1/i) * c3_new) * (1/i) * c3_new;


theta1 = [meanA C1];
theta2 = [meanB C2];
theta3 = [meanC C3];

meanA

meanB

meanC
end
