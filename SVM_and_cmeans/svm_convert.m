function [label] = svm_convert(min, max)
Class = File_reading ();
Class = Class';
j = 1;
  for i=1:15000
      if (mod (i, 6) == 2)
          label(j)=1;
          Class2(j, :) = Class(i, :);
          j = j + 1;
      elseif ((mod (i, 6)) == 3)
          label(j)=-1;
          Class2(j, :) = Class(i, :);
          j = j + 1;
      elseif (mod (i, 6) == 5)
          label (j)=-1;
          Class2(j, :) = Class(i, :);
          j = j + 1;
      elseif (mod (i, 6) == 0)
          label(j)=1;
          Class2(j, :) = Class(i, :);
      end
  end
  %{
  Class2 = Class2';
    for i=1:4
          range = (max - min);
          Class2(i,:) = Class2(i,:) - min;
          Class2(i, :) = Class2(i, :) ./ range;
     end
    Class2 = Class2'
  %}
  size(Class2)
  label = label';
  size(label)
  features_sparse = sparse(Class2);
  
  libsvmwrite('E:\Spring 2017\Pattern Recognition\Assignment3\DATA\SPECTFlibsvm.test2', label, features_sparse);
  fprintf('Done\n');
end