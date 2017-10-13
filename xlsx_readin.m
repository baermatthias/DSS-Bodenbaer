%% Test zum Einlesen einer .xlsx Datei
[num_k,txt_k,raw_k]=xlsread('Kippenverzeichniss.xlsx')
[num_p,txt_p,raw_p]=xlsread('Proben.xlsx')
Proben=num_p
%% Definition der Kippen
Kippen=num_k;

[a1,b1]=size(num_p)
[a2,b2]=size(Kippen)
ident=zeros(b2,b1)
nachuntersuchung=zeros(a2,b2,b1)
%% Test ob Probe in Kippe passt
%{
tmpProbe=[Proben(1,1);Proben(:,1);Proben(end,1)]
tmpKippe=Kippen(:,12)
nachpruefen=find((tmpKippe==-1)-(tmpProbe==-1)==-1)+2
%pH Abfrage
if (tmpProbe(1)~=-1) && (tmpKippe(1)~=-1)
    tmpProbe(1)=tmpProbe(1)*-1
    tmpKippe(1)=tmpKippe(1)*-1
end
if (tmpProbe(end-1)~=-1) && (tmpKippe(end-1)~=-1)
    tmpProbe(end-1)=tmpProbe(end-1)*-1
    tmpKippe(end-1)=tmpKippe(end-1)*-1
end
parameter_k=find(tmpKippe~=-1)
tmpProbe=tmpProbe(parameter_k)
tmpKippe=tmpKippe(parameter_k)
parameter_p=find(tmpProbe~=-1)
tmpKippe=tmpKippe(parameter_p)
tmpProbe=tmpProbe(parameter_p)
test=(tmpKippe-tmpProbe)>=0
if sum(test)==length(test)
    ident(1,1)=1
end
txt_k(nachpruefen,2)
%}

for i=1:b1
    
    for j=1:b2
    tmpProbe=[Proben(1,i);Proben(:,i);Proben(end,i)]
    tmpKippe=Kippen(:,j)
    %nachpruefen=find((tmpKippe==-1)-(tmpProbe==-1)==-1)+2
    nachpruefen=(tmpKippe==-1)-(tmpProbe==-1)==-1
    %nachuntersuchung(nachpruefen,j,i)=txt_k(nachpruefen,2);
        if (tmpProbe(1)~=-1) && (tmpKippe(1)~=-1)
            tmpProbe(1)=tmpProbe(1)*-1
            tmpKippe(1)=tmpKippe(1)*-1
        end
        if (tmpProbe(end-1)~=-1) && (tmpKippe(end-1)~=-1)
            tmpProbe(end-1)=tmpProbe(end-1)*-1
            tmpKippe(end-1)=tmpKippe(end-1)*-1
        end
    parameter_k=find(tmpKippe~=-1)
    tmpProbe=tmpProbe(parameter_k)
    tmpKippe=tmpKippe(parameter_k)
    parameter_p=find(tmpProbe~=-1)
    tmpKippe=tmpKippe(parameter_p)
    tmpProbe=tmpProbe(parameter_p)
    test=(tmpKippe-tmpProbe)>=0
        if sum(test)==length(test)
            ident(j,i)=1
            nachuntersuchung(:,j,i)=nachpruefen
        end
    end 
end
%}
%{
%% Ausgabe der Analyse in Textdatei
fid = fopen('test.txt','wt');
fprintf(fid,'Probe Kippen\n');
for i=1:a1
    fprintf(fid,'Probe %d |',i);
    for j=1:b2
        if ident(j,i)==1
        fprintf(fid,'Kippe %d ',j);
        end
    end
    fprintf(fid,'\n');
end
fclose(fid); 
bar(tmpProbe)
%}
