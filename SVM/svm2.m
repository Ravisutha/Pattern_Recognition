function [model] = svm2()
  Class = File_reading ();
  
  Class = Class(:,1:10000);
  %Scale the data 
  %{
    for i=1:4
      minimum = min (Class(i, :));
      maximum = max (Class(i, :));
      range = (maximum - minimum);
      Class(i,:) = Class(i,:) - minimum;
      Class(i, :) = Class(i, :) ./ range;
    end
    %}
  
  % Convert to svm data format
  % Consider class1(+1) and class2(-1)
  
  label = [ones(1, 5000) -ones(1, 5000)];
  label = label';
  features = Class(:,1:10000);
  features = features';
  features_sparse = sparse(features);
  libsvmwrite('E:\Spring 2017\Pattern Recognition\Assignment3\DATA\SPECTFlibsvm.train2', label, features_sparse);
  fprintf('Done\n');
  
  svm_convert (1, 1);
  %Read the data in svm format
  [label, inst] = libsvmread('E:\Spring 2017\Pattern Recognition\Assignment3\DATA\SPECTFlibsvm.train2');
  [label2, inst2] = libsvmread('E:\Spring 2017\Pattern Recognition\Assignment3\DATA\SPECTFlibsvm.test2');
  %model = svmtrain(label, inst, '-c 0.5 -g 0.0078125 -b 1');
  %model = svmtrain(label, inst, '-c 1 -g 0.07 -b 1');
  model = svmtrain(label, inst, '-b 1');
  %[label, inst] = libsvmread('E:\Spring 2017\Pattern Recognition\Assignment3\DATA\SPECTFlibsvm.train1');
  [predict_label, accuracy, prob_estimates] = svmpredict(label2, inst2, model, '-b 1');

  accuracy
  w = model.sv_coef' * full (model.SVs);
  bias = -model.rho;
  
  %{
  test1 = Class (:, 1)';
  test2 = Class(:, 5001)';
  test3 = Class(:, 7001)';
  test1 * w' + bias
  test2 * w' + bias
  test3 * w' + bias
  %}
  end