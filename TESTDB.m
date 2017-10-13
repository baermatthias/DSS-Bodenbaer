%Datenbanktest
%//start
clear all; clc;

h = actxserver('DAO.DBEngine.36');
[filename,pathname]=uigetfile();
database = fullfile(pathname,filename)
db = h.OpenDatabase(database);

tbl_names = {'Kunden'};
sql = ['SELECT * FROM ' char(tbl_names(1))]; % skonstruuj zapytanie

rs = db.OpenRecordset(sql);

[row,col] = size(rs.GetRows(1));
rs.MoveLast;
ile_wierszy = rs.RecordCount;
rs.MoveFirst;

A = rs.GetRows(ile_wierszy)';

rs.Close;
db.Close;

%//end