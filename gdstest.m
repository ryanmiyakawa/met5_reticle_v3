% Script to generate hexagonal gratings

mpm addpath

mgds = MGDS();
mgds.clearAll();

% Render to super MGDS:
bProduction = false;
dLayer = 1;

cRefSheetID = '10scq5ftW03R6y4zUCjtCGU8FwQPDHBUBmcfXOhbrleE';




%% Make all primitive:


% Basic horizontal grating
cField = 'rsoxs_gratings_all';

dPitches = [30, 40, 50]; % Wafer scale
dFieldLength = 1000;
dFieldHeight = 150;

mgds.init(cField, 'autogen structures', true);

for k = 1:length(dPitches)
    cGratingField = sprintf('%s_%d', cField, dPitches(k));
    mgds.makeHGrating(cField, dPitches(k), 0.5, dFieldLength, dFieldHeight, [0,0], dLayer);
end

mgds.makeRefFromGSheet(cRefSheetID, cField, 0, 0)


mgds.makeGDS();
