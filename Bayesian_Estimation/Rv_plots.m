[ClassA, ClassB, ClassC] = File_opening()

xA1 = ClassA(1,:);
xA2 = ClassA(2,:);
xA3 = ClassA(3,:);
xA4 = ClassA(4,:);

figure ();
subplot (3,4,1);
histogram (xA1);
xlabel('xA1');
ylabel ('frequency');
title ('histogram of xA1 rv');

subplot (3,4,2);
histogram (xA2);
xlabel('xA2');
ylabel ('frequency');
title ('histogram of xA2 rv');

subplot (3,4,3);
histogram (xA3);
xlabel('xA3');
ylabel ('frequency');
title ('histogram of xA3 rv');

subplot (3,4,4);
histogram (xA4);
xlabel('xA4');
ylabel ('frequency');
title ('histogram of xA4 rv');

xB1 = ClassB(1,:)
xB2 = ClassB(2,:)
xB3 = ClassB(3,:)
xB4 = ClassB(4,:)

subplot (3,4,5);
histogram (xB1);
xlabel('xB1');
ylabel ('frequency');
title ('histogram of xB1 rv');

subplot (3,4,6);
histogram (xB2);
xlabel('xB2');
ylabel ('frequency');
title ('histogram of xB2 rv');

subplot (3,4,7);
histogram (xB3);
xlabel('xB3');
ylabel ('frequency');
title ('histogram of xB3 rv');

subplot (3,4,8);
histogram (xB4);
xlabel('xB4');
ylabel ('frequency');
title ('histogram of xB4 rv');

xC1 = ClassC(1,:)
xC2 = ClassC(2,:)
xC3 = ClassC(3,:)
xC4 = ClassC(4,:)

subplot (3,4,9);
histogram (xC1);
xlabel('xC1');
ylabel ('frequency');
title ('histogram of xC1 rv');

subplot (3,4,10);
histogram (xC2);
xlabel('xC2');
ylabel ('frequency');
title ('histogram of xC2 rv');

subplot (3,4,11);
histogram (xC3);
xlabel('xC3');
ylabel ('frequency');
title ('histogram of xC3 rv');

subplot (3,4,12);
histogram (xC4);
xlabel('xC4');
ylabel ('frequency');
title ('histogram of xC4 rv');