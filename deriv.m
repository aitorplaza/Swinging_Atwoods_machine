function f = deriv(t, state, param)

  q   = state(1:2);
  dq  = state(3:4);
  
  %M_ = sim_M(q,param);
  %delta_ = sim_delta(q,dq,param);   
  %ddq = -M_ \ delta_;
  
  ddq = sim_ddq(q,dq,param); 

 
  f = zeros (4, 1);
  f(1) = dq(1);
  f(2) = dq(2);
  f(3) = ddq(1);
  f(4) = ddq(2);
end
