function process_abf(T,owr)

for ii = 1:size(T,1)
    recordingFolder = cell2mat(T{ii,6});
    disp(recordingFolder);
    if ~isempty(strfind(recordingFolder,'Missing'))
        continue;
    end
    db = get_db(recordingFolder);
    ei = get_thor_experiment_info(recordingFolder);
    ei.recordingFolder = recordingFolder;
    for jj = 1:length(db)
        ei.db = db(jj);
        abf2behavior_1(ei,cell2mat(T{ii,7}),'overwrite_behavior',owr);
    end
end