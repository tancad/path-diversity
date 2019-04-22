%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Copyright (c) 2010-2019 Justin P. Rohrer <jprohrer@tancad.org> 
 % All rights reserved.  
 %
 % Program:     $Id: find_shortest_paths.m $
 % Description: PathDiversity.  
 % https://cdn.jprohrer.org/documents/publications/Rohrer-Jabbar-Sterbenz-2012.pdf
 %
 % Attribution: Justin P. Rohrer, Abdul Jabbar, James P.G. Sterbenz,
 %              "Path Diversification for Future Internet End-to-End 
 %              Resilience and Survivability", In Telecommunication Systems, 
 %              Springer US, vol. 56 iss. 1, May, 2014, pp. 49-67.
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [paths,path_count] = find_shortest_paths(adj_matrix)

paths = cell(size(adj_matrix));
path_count = 0;
cost_matrix = Adj2Cost(adj_matrix);
[~, P] = AllPairsShortestPath (cost_matrix);
for src=1:length(cost_matrix)
    for dest=1:length(cost_matrix)
        if src ~= dest
            path = [dest];
            successor = dest;
            while path(1) ~= src
                pred = P(src, successor);
                path = [pred, path]; %#ok<AGROW>
                successor = pred;
            end
            paths{src,dest} = path;
            path_count = path_count + 1;
        end
    end
end

end

