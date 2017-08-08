function [ gain ] = getGain( testclient, testreq, x )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
testreq.X = x;
gain=call(testclient,testreq,'Timeout',3);
end

