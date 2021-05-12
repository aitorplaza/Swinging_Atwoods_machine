% Swinging Atwood's machine
% https://en.wikipedia.org/wiki/Swinging_Atwood%27s_machine
%%
clear all; close all; clc
%%
syms M m g real
syms r theta real
syms dr dtheta real
syms ddr ddtheta real

q   = [r; theta];
dq  = [dr; dtheta];
ddq = [ddr; ddtheta];
param = [M;m;g];

T = (1/2)*M*dr^2 +  (1/2)*m*(dr^2 + r^2*dtheta^2);
U = M*g*r - m*g*r*cos(theta);
L = T - U;


L_dq = jacobian (L , dq )';
dL_dq = jacobian ( L_dq , dq ) * ddq + jacobian ( L_dq , q )* dq; 
L_q = jacobian (L , q )';

Eq = dL_dq - L_q;


M     = jacobian(Eq, ddq);
delta = (Eq - M*ddq); % Eq = M*ddq+delta = 0 

matlabFunction(M,'file','sim_M.m', 'vars', {q,param})
matlabFunction(delta,'file','sim_delta.m', 'vars', {q,dq,param})
matlabFunction(simplify(-inv(M)*delta),'file','sim_ddq.m', 'vars', {q,dq,param})



