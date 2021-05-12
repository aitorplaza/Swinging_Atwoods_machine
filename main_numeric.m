% Swinging Atwood's machine
% https://en.wikipedia.org/wiki/Swinging_Atwood%27s_machine
%%
clear all; close all; clc
%% set up
mu = 2; % mu = M/m

m = 1;
M = m*mu; 

g = 9.8;

param = [M;m;g];

t_final =150.0;
delta_t = 0.01;
tspan = [0: delta_t: t_final];


%% Initial Conditions:
r_0 = 1.0;
dr_0 = 0.0;
theta_0 = pi/2;
dtheta_0 = 0.0;

init_cond = [r_0; theta_0; dr_0;dtheta_0];

options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t, state] = ode15s (@deriv, tspan, init_cond, options, param);
q = state(:,1:2);
dq = state(:,3:4);

%% Plot
fig1 = figure()
plot(t, state(:,1),t, state(:,2) )
legend('r','theta')


fig2 = figure();
plot(q(:,1).*sin(q(:,2)),-q(:,1).*cos(q(:,2)),'k');
axis equal
hold on
