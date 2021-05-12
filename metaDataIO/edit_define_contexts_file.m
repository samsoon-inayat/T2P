function edit_define_contexts_file(ei,dcfilename)
if ~exist('dcfilename','var')
	dcfilename = 'define_contexts.m';
else
    if isemtpy(dcfilename)
        dcfilename = 'define_contexts.m';
    end
end

fileName = fullfile(ei,dcfilename);

if ~exist(fileName,'File')
    if strcmp(dcfilename,'define_contexts.m')
        copyfile('./Essential_Mat_Files/define_contexts.m',fileName);
    else
        fileName1 = fullfile(ei,'define_contexts.m');
        copyfile(fileName1,fileName);
    end
end

edit(fileName);
