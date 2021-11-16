function net = importSleepNetHybrid(mod_ver)
%% IMPORTSLEEPNETHYBRID  Loads SleepNet Hybrid model 
%
%   net = IMPORTSLEEPNETHYBRID()  loads hybrid model (defaults to 1)
%   net = IMPORTSLEEPNETHYBRID(3) loads hybrid model trained on split #3
%
%   SleepNet Model requires input of 8x1 vector of normalized power bands 
%   and returns a prediction of sleep stage (Awake, NREM, REM).
%
%   There are 5 models total, pass 1,2,3,4,or 5 as a parameter.
%
%   see <a href="matlab:web('https://onlinelibrary.wiley.com/doi/full/10.1111/jsr.12806')">Christensen et al. 2018</a> for model details

if nargin < 1
  mod_ver = 1;
end

models = ["hybrid_0.h5" "hybrid_1.h5" "hybrid_2.h5" "hybrid_3.h5" "hybrid_4.h5"];
classNames = {'Awake','NREM','REM'};
net = importKerasNetwork(models(mod_ver),'Classes',classNames);
end