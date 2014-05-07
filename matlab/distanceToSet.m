function [ histInter ] = distanceToSet( wordHist, histograms )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    histInter = sum(bsxfun(@min, wordHist, histograms));

end

