function out1 = sim_ddq(in1,in2,in3)
%SIM_DDQ
%    OUT1 = SIM_DDQ(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    12-May-2021 09:42:59

M = in3(1,:);
dr = in2(1,:);
dtheta = in2(2,:);
g = in3(3,:);
m = in3(2,:);
r = in1(1,:);
theta = in1(2,:);
out1 = [(-M.*g+dtheta.^2.*m.*r+g.*m.*cos(theta))./(M+m);-(dr.*dtheta.*2.0+g.*sin(theta))./r];