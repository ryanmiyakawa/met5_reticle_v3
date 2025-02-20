% Script to generate hexagonal gratings

mpm addpath

mgds = MGDS();
mgds.clearAll();

% Render to super MGDS:

bGratingLabelsOff = false; % speeds up render
bProduction = false;
    



% Fields:



%% Make all primitive:

% Basic hexagonal grating


cField = 'VL_ZOrder_FIDH';

mgds.init(cField, 'autogen structures', true);

cFieldRef = 'VL_ZOrder_FIDH_ref';

cSubFieldH = 'VL_HGrat_sf';
dPitch = 2;
dCD = 1;
dLen = 10;
dHeight = 10;
mBLCoord = 'center';
dLayer = 1;

% mgds.makeHGrating(cSubFieldH, dPitch, 0.5, dLen, dHeight, mBLCoord, dLayer);
% mgds.makeARef(cField,cSubFieldH, 3, 3,  40, 40, -40, -40);

cBorderFieldH = 'VL_HGrat_bfh';
cBorderFieldV = 'VL_HGrat_bfv';

mgds.makeHGrating(cBorderFieldH, dPitch, 0.5, 1000, 4, 'center', dLayer);
mgds.makeHGrating(cBorderFieldV, dPitch, 0.5, 5, 148, 'center', dLayer);

mgds.makeRef(cFieldRef, cBorderFieldH, [0, -75; 0, 75]);
mgds.makeRef(cFieldRef, cBorderFieldV, [-498, 0; 498, 0]);

cCrossFieldH = 'VL_HGrat_cfh';
cCrossFieldV = 'VL_HGrat_cfv';

mgds.makeHGrating(cCrossFieldH, dPitch, 0.5, 40, 4, 'center', dLayer);
mgds.makeHGrating(cCrossFieldV, dPitch, 0.5, 3, 40, 'center', dLayer);

mgds.makeRef(cFieldRef, cCrossFieldH, [ -30, 0.5; 30, 0.5]);
mgds.makeRef(cFieldRef, cCrossFieldV, [0, -30; 0, 30]);

mgds.makeRef(cField, cFieldRef, [500, 75]);

    mgds.makeGDS();
%%
% 
% 
% cField = 'VL_ZOrder_FIDV';
% 