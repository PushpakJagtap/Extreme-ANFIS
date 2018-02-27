load('banana_data.mat')
trainData=[data'  2*label'];
[finalRMSE,Parameters] = extremeanfis(trainData, 7);
train_output = simextremeanfis(data' ,Parameters);
    for j=1:length(train_output)
        if(train_output(j,1)<0)
            train_output(j,1)=-2;
        end
        if(train_output(j,1)>=0)
            train_output(j,1)=2;
        end
    end
err1= sum(train_output==2*label')

test_output = simextremeanfis(data(:,4001:5300)' ,Parameters);
    for j=1:length(test_output)
        if(test_output(j,1)<0)
            test_output(j,1)=-2;
        end
        if(test_output(j,1)>=0)
            test_output(j,1)=2;
        end
        
    end
err2= sum(test_output==2*label(:,4001:5300)')



