function M = sim_M(in1,in2)
%SIM_M
%    M = SIM_M(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    12-May-2021 09:42:58

M = in2(1,:);
m = in2(2,:);
r = in1(1,:);
M = reshape([M+m,0.0,0.0,m.*r.^2],[2,2]);
