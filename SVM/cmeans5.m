function [Class] = cmeans (clusters)
  clusters = 5;  
  [Class] = File_reading ();
  Class = Class';
  %k-means 
  %get random centers for each clusters
  for i=1:clusters
    index(i) = rand();
  end
  index = mod(int16(index * 10000),10000)
  i = 1;
  %{
  prev_m(1,:) = Class(index(1));
  prev_m(2,:) = Class(index(2));
  prev_m(3,:) = Class(index(3));
  prev_m(4,:) = Class(index(4));
  prev_m(5,:) = Class(index(5));
  %}
  prev_m(1,:) = Class(5);
  prev_m(2,:) = Class(4000);
  prev_m(3,:) = Class(6500);
  prev_m(4,:) = Class(10001);
  prev_m(5,:) = Class(13000);
  cluster1 = 1;
  cluster2 = 2;
  cluster3 = 3;
  cluster4 = 4;
  cluster5 = 5;
  err = 100;
  while (abs(err) > 0.000001)
    %clear('cluster1', 'cluster2', 'cluster3');
    cluster1 = [];
    cluster2 = [];
    cluster3 = [];
    cluster4 = [];
    cluster5 = [];
    i1 = 1;
    i2 = 1;
    i3 = 1;
    i4 = 1;
    i5 = 1;
    for i=1:15000
    % Euclidean distance
      for j=1:clusters
        %Class(i,:) - prev_m(j,:)
        dist(j) = norm (Class(i,:) - prev_m(j,:));
      end
      [g, min_index] = min(dist);
        min_index;
      if (min_index == 1)
        cluster1(i1,:) = Class(i,:);
        i1 = i1 + 1;
      elseif (min_index == 2)
       cluster2(i2,:) = Class(i,:);
       i2 = i2 + 1;
      elseif (min_index == 3)
       cluster3(i3,:) = Class(i,:);
       i3 = i3 + 1;
      elseif (min_index == 4)
       cluster4(i4,:) = Class(i,:);
       i4 = i4 + 1;
      else
       cluster5(i5,:) = Class(i,:);
       i5 = i5 + 1;
     end
      %{
      else
        cluster3(i3,:) = Class(i,:);
        i3 = i3 + 1;
      end
      %}
    end
    err = sum (abs(prev_m(1,:) - mean(cluster1) + prev_m(2,:) - mean(cluster2) + prev_m(3,:) - mean(cluster3) + prev_m(4,:) - mean(cluster4) + prev_m(5,:) - mean(cluster5)))
    prev_m= [mean(cluster1);mean(cluster2);mean(cluster3);mean(cluster4)]
  end
  i1
  i2
  i3
  i4
  i5
end