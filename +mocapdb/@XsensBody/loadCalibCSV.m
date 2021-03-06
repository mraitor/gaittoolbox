function obj = loadCalibCSV(fname)
	% Save calibration as CSV file
	%
	% :param obj: this XsensBody
	% :param fname: filename of file to be saved
	%
	% .. Author: - Luke Sy (UNSW GSBME)

    T = readtable(fname);
    
    obj = mocapdb.XsensBody();
    for i=1:size(T, 1)
        n = T.name(i); n = n{1};
        obj.(n) = table;
        obj.(n).ori = T{i,2:5};
    end
end