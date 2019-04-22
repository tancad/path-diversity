%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Copyright (c) 2010-2019 Justin P. Rohrer <jprohrer@tancad.org> 
 % All rights reserved.  
 %
 % Program:     $Id: AllPairsShortestPath.m $
 % Description: PathDiversity.  
 % https://cdn.jprohrer.org/documents/publications/Rohrer-Jabbar-Sterbenz-2012.pdf
 %
 % Attribution: Justin P. Rohrer, Abdul Jabbar, James P.G. Sterbenz,
 %              "Path Diversification for Future Internet End-to-End 
 %              Resilience and Survivability", In Telecommunication Systems, 
 %              Springer US, vol. 56 iss. 1, May, 2014, pp. 49-67.
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 function [D, P] = AllPairsShortestPath (CostMatrix)

% Use the Floyd-Warshall algorithm to compute all pairs shortest path
% matrix D. Input is cost matrix, outputs - D is cost of shortest path
% matrix and P is previous vertex of shortest path matrix. Reference: 
% Introduction to Algorithms: Cormen and Rivest

% Note that when there is a negative-weight cycle in the given graph, 
% then D=0 will be returned and an error message is displayed. The main 
% program does not display the shortest path matrix in this case. 

D = 0; P = 0;
n = size (CostMatrix,1); %Number of vertices
D = CostMatrix;
for i = 1:n
    for j = 1:n
        if ((i==j)||(CostMatrix(i,j)==inf))
            P(i,j)=nan;
        else
            P(i,j)=i;
        end
    end
end
        
for k = 1:n
    for i = 1:n
        for j = 1:n
            if ((D(i,j))<=(D(i,k)+D(k,j)))
            else
                D(i,j) = D(i,k)+D(k,j);
                P(i,j) = P(k,j);
            end
        end
    end
end
            
for i = 1:n
    if (D(i,i)<0)
        disp('There is a negative-weight cycle in the graph, shortest paths cannot be computed');
        D = 0;
        break;
    end
end
end