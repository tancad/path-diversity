# path-diversity
Path-diversity calculator for network graphs

## Usage
1. Change working directory to `/path-diversity/src/`
2. Set desired node and link failure probabilities in run.m
3. Call `run(<topology>)`, where `<topology>` is the adjacency matrix for the network graph to be evaluated.  An example graph is provided in `/path-diversity/topologies/sprint-l1.txt`.  To use it you would execute `run('../topologies/sprint-l1.txt')` in the MATLAB command window.