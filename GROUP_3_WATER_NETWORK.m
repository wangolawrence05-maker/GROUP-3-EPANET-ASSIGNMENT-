% GROUP 3 WATER DISTRIBUTION NETWORK SIMULATION

clc;
clear;
close all;

d = epanet('group_3_water_network.inp');

d.openHydraulicAnalysis;
d.initializeHydraulicAnalysis;
t = d.runHydraulicAnalysis;

fprintf('Number of nodes: %d\n', d.getNodeCount);
fprintf('Number of links: %d\n', d.getLinkCount);

P = d.getNodePressure;
disp('Node pressures:');
disp(P);

Q = d.getLinkFlows;
disp('Pipe flow rates:');
disp(Q);

d.plot;
d.plot('nodes', 'yes', 'fontsize', 12);
d.plot('links', 'yes', 'fontsize', 12);
d.plot('highlightnode',{'1', '4'});

d.closeHydraulicAnalysis;

d.unload;