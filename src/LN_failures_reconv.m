%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Copyright (c) 2010-2019 Justin P. Rohrer <jprohrer@tancad.org> 
 % All rights reserved.  
 %
 % Program:     $Id: LN_failures_reconv.m $
 % Description: PathDiversity.  
 % https://cdn.jprohrer.org/documents/publications/Rohrer-Jabbar-Sterbenz-2012.pdf
 %
 % Attribution: Justin P. Rohrer, Abdul Jabbar, James P.G. Sterbenz,
 %              "Path Diversification for Future Internet End-to-End 
 %              Resilience and Survivability", In Telecommunication Systems, 
 %              Springer US, vol. 56 iss. 1, May, 2014, pp. 49-67.
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function flow_robustness = LN_failures_reconv(adj_matrix, p_link_fail, p_node_fail)

a=adj_matrix;
rand_link_failures = rand(size(a));
rand_node_failures = rand(1,length(a));
failed_nodes = zeros(size(rand_node_failures));
failed_flows = zeros(size(a));

if p_link_fail > 0
    for i=1:length(a)
        for j=(i+1):length(a)
            if a(i,j)
                if rand_link_failures(i,j) <= p_link_fail
                    %failed_links(i,j) = 1;
                    %failed_links(j,i) = 1;
                    a(i,j) = 0;
                    a(j,i) = 0;
                end
            end
        end
    end
end

%sum(sum(failed_links))

if p_node_fail > 0
    for i=1:length(failed_nodes)
        if rand_node_failures(i) <= p_node_fail
            failed_nodes(i) = 1;
            for j=1:length(a)
                if a(i,j) == 1
                    %failed_links(i,j) = 1;
                    %failed_links(j,i) = 1;
                    a(i,j) = 0;
                    a(j,i) = 0;
                end
            end
        end
    end
end

%sum(failed_nodes)
%sum(sum(failed_links))

CostMatrix = Adj2Cost(a);
[D, P] = AllPairsShortestPath (CostMatrix);

count_paths = 0;

for i=1:length(a)
    for j=1:length(a)
        if i~=j
            if D(i,j) < length(a)
                count_paths = count_paths + 1;
            end
        end
    end
end

flow_robustness = count_paths / (numel(a)-length(a));

end

