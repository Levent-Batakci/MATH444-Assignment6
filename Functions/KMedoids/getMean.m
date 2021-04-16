function mean = getMean(D)
%GETMEAN gets the center of mass of the data points of D
    mean = 1/size(D,2) * sum(D, 2);
end

