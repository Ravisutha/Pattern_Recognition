clear;
%trainingdata=xlsread('E:\Spring 2017\Pattern Recognition\Assignment 2\DATA\train_sp2017_v19'); %Extracting data
trainingdata = File_reading ()';
c=5;
ci=ones(c,1);
mx=0;
ix=0;
ic=1;

m=mean(trainingdata);
var=cov(trainingdata);

[dp,ip]=sort(diag(var));

j1=1;
j2=1;
j=1;
jm=1;
jd=1;

for(i=1:15000)
    if(trainingdata(i,ip(4)) <= m(ip(4)))
        C{j}(j1,:)=trainingdata(i,:);
        j1=j1+1;
    else
        C{j+1}(j2,:)=trainingdata(i,:);
        j2=j2+1;
    end
end
j=1;
j1=1;
j2=1;
if(floor(c/2)==1)
    m1{jm}=mean(C{jm});
    m1{jm+1}=mean(C{jm+1});
    jm=jm+2;
    if(mod(c,2) ~= 0)
        m1{jm}= (m1{jm-1} + m1{jm-2})/2;
        jm=jm+1;
    end
else
    m=mean(C{j});
    var=cov(C{j});

    [dp,ip]=sort(diag(var));
    for(i=1:size(C{j},1))
        if(C{j}(i,ip(4)) <= m(ip(4)))
            D{jd}(j1,:)=C{j}(i,:);
            j1=j1+1;
        else
            D{jd+1}(j2,:)=C{j}(i,:);
            j2=j2+1;
        end
    end
    m1{jm}=mean(D{jd});
    m1{jm+1}=mean(D{jd+1});
    jm=jm+2;
    j=j+1;
    j1=1;
    j2=1;
    jd=jd+2;
    m=mean(C{j});
    var=cov(C{j});

    [dp,ip]=sort(diag(var));
    for(i=1:size(C{j},1))
        if(C{j}(i,ip(4)) <= m(ip(4)))
            D{jd}(j1,:)=C{j}(i,:);
            j1=j1+1;
        else
            D{jd+1}(j2,:)=C{j}(i,:);
            j2=j2+1;
        end
    end
    m1{jm}= mean(D{jd});
    m1{jm+1}=mean(D{jd+1});
    jd=jd+2;
    jm=jm+2;
    if(mod(c,2) ~= 0)
        m1{jm}=(m1{jm-1}+m1{jm-2})/2;
    end
end
    
    
% diff1=bsxfun(@minus,C1,m1);
% diff2=bsxfun(@minus,C2,m2);
% 
% dist1=sqrt(sum(diff1.^2,2));
% dist2=sqrt(sum(diff2.^2,2));
% 
% [sortd1,ind1]=sort(dist1);
% [sortd2,ind2]=sort(dist2);
% 
% center1=trainingdata(ind1(1),:);
% center2=trainingdata(ind2(1),:);

% oldm1=zeros(1,4);
% oldm2=zeros(1,4);
% oldm3=zeros(1,4);

j=0;
flag = 1;
for(i=1:c)
    oldm{i}=zeros(1,4);
end
while(j<10000)
    flag = 1;
    for(ic=1:c)
        if(oldm{ic} == m1{ic})
            flag = flag & 1;
        else
            flag = flag & 0;
        end
    end
    if(flag == 1)
        break;
    end
        
    j=j+1;
    
    for(ic=1:c)
%         diff{ic} = bsxfun(@minus,trainingdata,m1{ic});
%         dist(:,ic)=sqrt(sum(diff{ic}.^2,2));
          dist(:,ic)=pdist2(trainingdata,m1{ic},'euclidean');
    end
    clear C;
    ci=ones(c,1);
    for(i=1:15000)
        [mx,ix]=min(dist(i,:));
        C{ix}(ci(ix),:)=trainingdata(i,:);
        ci(ix)=ci(ix)+1;
%         if(dist1(i) < dist2(i) && dist1(i)<dist3(i))
%             C1(j1,:) = trainingdata(i,:);
%             j1=j1+1;
%         elseif(dist2(i) < dist3(i) && dist2(i)<dist1(i))
%             C2(j2,:) = trainingdata(i,:);
%             j2=j2+1;
%         else
%             C3(j3,:) = trainingdata(i,:);
%             j3=j3+1;
%         end
    end
        for(ic=1:c)
            oldm{ic}=m1{ic};
            m1{ic}=mean(C{ic});
        end
end
            
