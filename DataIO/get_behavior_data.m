function ob = get_behavior_data(rf,pdf)
te = get_thor_experiment_info(rf);
np = getNumberOfPlanes(te);
for pp = 1:np
    fileName = makeName(sprintf('behavior%d.mat',pp),pdf);
    b = load(fileName);
    ob{pp} = calcBehav(b);
end