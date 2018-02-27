% multi-class classification problem

clear all;clc;

%loading fisheriris data
load fisheriris

% Generating training data (first 45 samples of each type)
l=[[2*ones(40,1);zeros(40,1);zeros(40,1)] [zeros(40,1);2*ones(40,1);zeros(40,1)] [zeros(40,1);zeros(40,1);2*ones(40,1)]];
trainData= [[meas(1:40,:);meas(51:90,:);meas(101:140,:)] l];

% training extreme-ANFIS and simulating
[finalRMSE,Parameters] = extremeanfis(trainData, 5,3);
output = simextremeanfis([meas(1:40,:);meas(51:90,:);meas(101:140,:)],Parameters);

% Generating FIS from extreme-ANFIS
OutputFismat = extremeanfis2fis(trainData,Parameters);
output1 = evalfis([meas(1:40,:);meas(51:90,:);meas(101:140,:)], OutputFismat);

% Simuulating for remaining data
Test_data= [meas(41:50,:);meas(91:100,:);meas(141:150,:)];
test_output = simextremeanfis(Test_data,Parameters);
for i=1:3
    for j=1:length(test_output)
        if(test_output(j,i)<1)
            test_output(j,i)=0;
        end
        if(test_output(j,i)>=1)
            test_output(j,i)=2;
        end
        
    end
end
test_output
