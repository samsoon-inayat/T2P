function deconv = get_cluster_deconv(recording)
filename = 'deconv.mat';
filename = fullfile(recording,filename);
temp = load(filename);
deconv = temp.deconv';

