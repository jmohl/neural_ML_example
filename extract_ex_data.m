%% Making example neural data
%this section requires access to the complete dataset
paths.tidy_path = 'D:\\GitHub\\AVD_SC\\data'; %main raw data path
data_options.n_trial_filter = 4; %results in 72 cells, vs 98 if no trial count filter.
data_options.match_contra = false;
data_options.save_path = 'D:\\GitHub\\AVD_SC\\data\\concat\\pseudopop\\nonmatch';
if ~exist(data_options.save_path,'dir')
    mkdir(data_options.save_path)
end
[df,~,~]=load_combined_data(data_options, paths);
%ex data for side project

this_int = [0,600];
df.spk_ct = get_spike_counts(df,df.stim_time + this_int(1),df.stim_time+this_int(2));
ex_neural_data = df(strcmp(df.trial_type,'V'),{'file_ID','trial','V_tar','spk_ct','valid_endpoints'});
ex_neural_data.file_ID = findgroups(ex_neural_data.file_ID);
for i = 1:height(ex_neural_data)
    ex_neural_data.resp(i) = ex_neural_data.valid_endpoints{i}(1);
end
ex_neural_data.valid_endpoints = [];

save('D:\\GitHub\\python_democode\\MATLABex\\ex_neural_data','ex_neural_data')