function R = loadPendulumCompassMat(pendulumFName, compassFName)   
	% Calculate rotation matrix of world frame with respect vicon frame
	% from the pendulum and compass mat files generated by parseViconCSV.py
	%
	% :param pendulumFName: pendulum mat file name
	% :param compassFName: compass mat file name
	%
	% :return: R - rotation matrix of world in vicon frame
	%
	% .. Author: - Luke Sy (UNSW GSBME) - 9/24/18

    load(pendulumFName);
    z =  mean(Pendulum_top, 1) -  mean(Pendulum_bottom, 1);
    z = z / norm(z);
    
    load(compassFName);
    x = mean(Compass_n, 1) -  mean(Compass_s, 1);
    x = x - dot(x, z)*z;
    x = x / norm(x);
    
    y = cross(z, x);
    y = y / norm(y);
    
    R = [x' y' z'];
end