%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Copyright (c) 2010-2019 Justin P. Rohrer <jprohrer@tancad.org> 
 % All rights reserved.  
 %
 % Program:     $Id: run.m $
 % Description: PathDiversity.  
 % https://cdn.jprohrer.org/documents/publications/Rohrer-Jabbar-Sterbenz-2012.pdf
 %
 % Attribution: Justin P. Rohrer, Abdul Jabbar, James P.G. Sterbenz,
 %              "Path Diversification for Future Internet End-to-End 
 %              Resilience and Survivability", In Telecommunication Systems, 
 %              Springer US, vol. 56 iss. 1, May, 2014, pp. 49-67.
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function run(filename)

p_link_fail = 0.05;
p_node_fail = 0.00;

tic;
a = dlmread(filename);

rng('default')
rng(1)
flow_robustness = LN_failures(a, p_link_fail, p_node_fail);
fprintf('Flow robustness after failures: %f\n', flow_robustness)

rng(1)
flow_robustness = LN_failures_reconv(a, p_link_fail, p_node_fail);
fprintf('Flow robustness after reconvergence: %f\n', flow_robustness)
 
toc;
end
