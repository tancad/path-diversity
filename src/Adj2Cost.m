%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Copyright (c) 2010-2019 Justin P. Rohrer <jprohrer@tancad.org> 
 % All rights reserved.  
 %
 % Program:     $Id: Adj2Cost.m $
 % Description: PathDiversity.  
 % https://cdn.jprohrer.org/documents/publications/Rohrer-Jabbar-Sterbenz-2012.pdf
 %
 % Attribution: Justin P. Rohrer, Abdul Jabbar, James P.G. Sterbenz,
 %              "Path Diversification for Future Internet End-to-End 
 %              Resilience and Survivability", In Telecommunication Systems, 
 %              Springer US, vol. 56 iss. 1, May, 2014, pp. 49-67.
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ CostMat ] = Adj2Cost( AdjMat )
%Converts adjacency matrix to a cost matrix
n = size (AdjMat,1);
CostMat = AdjMat;
for i = 1:n
    for j = 1:n
        if (i==j)
            CostMat(i,j)=0;
        elseif (AdjMat(i,j)==0)
            CostMat(i,j)=inf;
        end
    end
end

end