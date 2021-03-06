function [BL1] = get_dist_air_trials(b)

d = b.dist;

onsets = b.air_puff_r;
offsets = b.air_puff_f;

if length(onsets) == length(offsets)
    BL1 = d(offsets)-d(onsets);
end

