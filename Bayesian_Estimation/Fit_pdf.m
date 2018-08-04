[ClassA, ClassB, ClassC] = File_opening

pd1 = fitdist(ClassA(1,:)','Normal')  
pd2 = fitdist(ClassA(2,:)','Normal')  
pd3 = fitdist(ClassA(3,:)','Normal')  

C1 = cov (ClassA')
C2 = cov (ClassB')
C3 = cov (ClassC')
