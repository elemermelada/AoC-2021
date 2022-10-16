clc
clear

fid = fopen('Day16 - test.txt');
txt = textscan(fid,'%s','delimiter','\n');
txt = txt{1}{1};
data = hexToBinaryVector(txt);