function [Class] = cmeans2 ()
    clusters =2;
  [Class] = File_reading ();
  Class = Class';
  %k-means 
  %get random centers for each clusters
  count = 0;
  for i=1:clusters
    index(i) = rand();
  end
  index = mod(int16(index * 10000),10000)
  i = 1;
  
  
  prev_m(1,:) = Class(2000, :);
  prev_m(2,:) = Class(6000, :);
  prev_m(3,:) = Class(10000, :);
  
%{
  for i=1:clusters
      prev_m(i,:) = Class(index(1), :);
      %prev_m(i,:) = Class(2000, :);
  end
%}
  %cluster = [];
  err = 100;
  for j=1:clusters
        i1(j) = 1;
  end

  while (1)
    count = count + 1;
    %clear('cluster');
    err = 0;
    %{
    for j=1:clusters
        for k=1:i1(j)
            cluster{j}( k, :) = [0 0 0 0];
        end
        i1(j) = 1;
    end
%}
    for j=1:clusters
        i1(j) = 1;
    end

    for i=1:15000
      for j=1:clusters
        dist(j) = norm (Class(i,:) - prev_m(j,:));
      end
      
      [~, min_index] = min(dist);
      
       for j=1:clusters
          if (min_index == j) 
            cluster{j}(i1(j),:) = Class(i,:);
            i1(j) = i1(j) + 1;
            break;
          end
       end
    end
    %{
    for j=1:clusters  
        err = err + sum (abs(prev_m(j,:) - mean(cluster{j})));
        prev_m(j,:)= mean (cluster{j});
    end
    %}
    size(cluster{1});
    size(cluster{2});
    size(cluster{3});
    temp_count = 0;
    for j=1:clusters
        mean(cluster{j});
        prev_m(j, :);
        size(mean(cluster{j}));
            size(prev_m(j,:));
        if (mean(cluster{j}) == prev_m(j, :))
            size(mean(cluster{j}));
            size(prev_m);
            temp_count = temp_count + 1;
        end
    end
    if (temp_count == clusters) 
        break;
    end
    for j=1:clusters
        prev_m(j,:)= mean (cluster{j});
    end
    
  end
  for k=1:clusters
      i1(k)
  end
end