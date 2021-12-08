function [deltaVol] = volChange(initH,endH)
% Provided initial height and ending height
% gives delta cubic feet

initVol = 2*pi*(26.5)*initH;
endVol = 2*pi*(26.5)*endH;
deltaVol = endVol - initVol;
end