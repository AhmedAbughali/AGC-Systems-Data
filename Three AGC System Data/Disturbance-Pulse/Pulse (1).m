clear; clc; close all;

list = dir('*.mat');
filename = {list.name};
timetable = ts2timetable(load(filename{1}).Data);

for n = 2:250
    timetable_n = timeseries2timetable(load(filename{n}).Data);   
    timetable = [timetable; timetable_n];
end

writetimetable(timetable,'ThreeArea_Ramp_WithZeros.csv');

Matrix= table2array(timetable);
Matrix_without_Zero=[];
count=0
index=1

for i=1:length(Matrix)
    if Matrix(i,1) == 0 && Matrix(i,2) == 0 && Matrix(i,3) == 0 && Matrix(i,4) == 0
        count=count+1
    else
        Matrix_without_Zero(index,:) = Matrix(i,:);
        index=index+1;
    end
end

writematrix(Matrix_without_Zero,'ThreeArea_Ramp_WithoutZeros.csv');

