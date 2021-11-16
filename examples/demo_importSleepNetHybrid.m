%% Load model
net = importSleepNetHybrid()

%% Predict sleep stage

net = importSleepNetHybrid(4);

% load validation data for model 4
load('sleep_net_validation_data','-mat','X_test_4','Y_test_4');

% WARNING: Inputs need to be z-score normalized
X = normalize(X_test_4);

% classify() returns class labels instead of probability vectors
YClass = net.classify(X);
YClass(1:3,:)

%% Sleep stage probabilities

% load validation data for model 2
load('sleep_net_validation_data','-mat','X_test_2','Y_test_2');

% WARNING: Inputs need to be z-score normalized
X = normalize(X_test_2);

% predict() returns predicted probabilities for each sleep stage (Awake,NREM,REM)
YPred = net.predict(X);
YPred(1:3,:)

%% Calculate Accuracy
% use onehotdecode() to convert probability vectors into class predictions

% Load validation data true values
YPred_oh = onehotdecode(YPred,[1 2 3],2);
YTrue = categorical(Y_test_2);

% Calculate accuracy
accuracy = sum(YPred_oh == YTrue)/numel(YTrue);

disp('YTrue num label examples:')
disp(histcounts(YTrue))

disp('YPred histcounts:')
disp(histcounts(YPred_oh))

disp('Overall Accuracy:')
disp(accuracy)