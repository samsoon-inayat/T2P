function contexts = get_contexts(recordingFolder,dcfilename)

if ~exist('dcfilename','var')
	dcfilename = 'define_contexts.m';
else
    if isemtpy(dcfilename)
        dcfilename = 'define_contexts.m';
    end
end

fileName = fullfile(recordingFolder,dcfilename);
cvs = get_mfile_vars(fileName);

allContexts = contextDefinitions;

% cvs = get_define_contexts_file(recordingFolder,dcfilename);
fields = fieldnames(cvs);
for ii = 1:length(fields)
    cmdTxt = sprintf('%s = cvs.%s;',fields{ii},fields{ii}); eval(cmdTxt);
end
table(contextIDs,allContexts.names(contextIDs))

table(contextIDs,allContexts.names(contextIDs),contextTrials)

% what do you want to look at in the trials
typesOfMarkers = allContexts.typesOfMarkers;
table((1:length(typesOfMarkers))',typesOfMarkers)

for ii = 1:length(contextIDs)
    cid = contextIDs(ii);
    thisContext = allContexts.names{cid};
    thisTrials = contextTrials{ii};
    thisMarkers = typesOfMarkers(contextTypeOfMarkers{ii});
    cmdTxt = sprintf('contexts(ii).name = thisContext;');
    eval(cmdTxt);
    cmdTxt = sprintf('contexts(ii).trials = thisTrials;');
    eval(cmdTxt);
    cmdTxt = sprintf('contexts(ii).stimMarkers = thisMarkers;');
    eval(cmdTxt);
end