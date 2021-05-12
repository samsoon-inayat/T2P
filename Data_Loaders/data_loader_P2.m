for ii = 1:60
    pause(1);
end
%%
% clear all
%%
colormaps = load('./Essential_Mat_Files/Downloaded/colorblind_colormap.mat');
colormaps.colorblind = flipud(colormaps.colorblind);
% mData.colors = mat2cell(colormaps.colorblind,[ones(1,size(colormaps.colorblind,1))]);%
mData.colors = {[0 0 0],[0.1 0.7 0.3],'r','b','m','c','g','y'}; % mData.colors = getColors(10,{'w','g'});
mData.axes_font_size = 6; mData.sigColor = [0.54 0.27 0.06]; 
Uleth_one_drive = 'G:\OneDrives\OneDrive - University of Lethbridge';
Uleth_one_drive = 'E:\Users\samsoon.inayat\OneDrive - University of Lethbridge';
mData.pdf_folder = [Uleth_one_drive '\PDFs\P15']; 
mData.pd_folder = [Uleth_one_drive '\ProcessedData\Matlab'];
disp('Done');
%%
data_folder = '\\mohajerani-nas.uleth.ca\storage\homes\brendan.mcallister\2P\Data\RSEG_PSEG_more_data';
processed_data_folder = '\\mohajerani-nas.uleth.ca\storage\homes\brendan.mcallister\2P\Processed_Data_Basic_Char';
[dS,T] = get_exp_info_from_folder(data_folder,processed_data_folder);
disp('Done');
%%
sel_T_ind = [2 11 20];
sel_T = T(sel_T_ind,:);
if 0
    make_db(sel_T);
    process_abf(sel_T,1);
end
%%
for ii = 1:size(sel_T,1)
    this_table_row = sel_T(ii,:);
    recording_folder = get_recording_folder_from_table_row(this_table_row);
    pd_folder = get_processed_data_folder_from_table_row(this_table_row);
    disp(recording_folder);
    te{ii} = get_thor_experiment_info(recording_folder);
    b{ii} = get_behavior_data(recording_folder,pd_folder);
    dcs{ii} = get_cluster_deconv(pd_folder);
end

%% for context definitions (only need to be run in the start)
% for ii = 1:size(sel_T,1)
ii = 1;
    this_table_row = sel_T(ii,:);
    recording_folder = get_recording_folder_from_table_row(this_table_row);
    pd_folder = get_processed_data_folder_from_table_row(this_table_row);
    edit_define_contexts_file(recording_folder);
    plotMarkers(b{ii}{1},[],[],100,0);
% end

%% Loading contexts

for ii = 1:size(sel_T,1)
    this_table_row = sel_T(ii,:);
    recording_folder = get_recording_folder_from_table_row(this_table_row);
    pd_folder = get_processed_data_folder_from_table_row(this_table_row);
    disp(recording_folder);
    contexts{ii} = get_contexts(recording_folder);
end

%% Making rasters based contexts information and whatever we want to process

for ii = 1:size(sel_T,1)
    this_table_row = sel_T(ii,:);
    recording_folder = get_recording_folder_from_table_row(this_table_row);
    pd_folder = get_processed_data_folder_from_table_row(this_table_row);
    disp(recording_folder);
    rasters{ii} = get_rasters(te{ii},b{ii},dcs{ii},contexts{ii});
end

