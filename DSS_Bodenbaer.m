function varargout = DSS_Bodenbaer(varargin)
% DSS_BODENBAER M-file for DSS_Bodenbaer.fig
%      DSS_BODENBAER, by itself, creates a new DSS_BODENBAER or raises the existing
%      singleton*.
%
%      H = DSS_BODENBAER returns the handle to a new DSS_BODENBAER or the handle to
%      the existing singleton*.
%
%      DSS_BODENBAER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSS_BODENBAER.M with the given input arguments.
%
%      DSS_BODENBAER('Property','Value',...) creates a new DSS_BODENBAER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DSS_Bodenbaer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DSS_Bodenbaer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DSS_Bodenbaer

% Last Modified by GUIDE v2.5 17-Feb-2016 13:35:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DSS_Bodenbaer_OpeningFcn, ...
                   'gui_OutputFcn',  @DSS_Bodenbaer_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
%set(handles.DSS_Bodenbaer, 'PaperSize',get(0,'screensize'))

% --- Executes just before DSS_Bodenbaer is made visible.
function DSS_Bodenbaer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DSS_Bodenbaer (see VARARGIN)

% Choose default command line output for DSS_Bodenbaer
%(hObject,'Position',[0, 0, 1, 1]); % main_window steht hier für das handle vom Hauptfester, das wird wohl eher so wie Dein m-file heißen
set(hObject,'units','normalized','outerposition',[0 0 0.9 0.9])
guidata(hObject, handles); 
handles.output = hObject;
handles.cell_var1 = {'Bitte Wählen','Z0-97','Z1.1-97','Z1.2-97','Z2-97','Z0-04','Z1.1-04','Z1.2-04','Z2-04','W1.1','W1.2','W2','DK0','DK1','DK2','DK3'};
set(handles.popupmenu1, 'String', handles.cell_var1);
%{
ssz  = get(0,'screensize');
temp = get( gcf, 'Units');
set( gcf, 'Units', 'Pixels',...
          'OuterPosition', [ssz(3)*0.05 ssz(4)*0.1 ssz(3)*0.9 ssz(4)*0.85]);
set( gcf, 'Units', temp); 
%}
% Update handles structure
guidata(hObject, handles);


	
% UIWAIT makes DSS_Bodenbaer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DSS_Bodenbaer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Datei_Callback(hObject, eventdata, handles)
% hObject    handle to Datei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menue_Kippen_Callback(hObject, eventdata, handles)
% hObject    handle to Menue_Kippen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Kippenfilename, Kippenpathname, Kippenfilterindex] = uigetfile( ...
{  '*.xls','xls-Files (*.xls)'; ...
   '*.xlsx','xlsx-files (*.xlsx)'}, ...
   'Pick a file', ...
   'MultiSelect', 'off');
if Kippenfilename ~= 0
    Kippen_name=fullfile(Kippenpathname,Kippenfilename);
    set(handles.text3 ,'ForegroundColor','g')
    
    [handles.num_k,handles.txt_k,handles.raw_k]=xlsread(Kippen_name);
    handles.Kippen=handles.num_k;
    [handles.Kippenanzahl,handles.Kippenkriterien]=size(handles.Kippen);
    set(handles.edit1,'String',num2str(handles.Kippenanzahl))
else
     msgbox('Keine Datei gewählt','Import Warnung','Warnung')
end
guidata(hObject, handles);

% --------------------------------------------------------------------
function Menue_Proben_Callback(hObject, eventdata, handles)
% hObject    handle to Menue_Proben (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Probenfilename, Probenpathname, Probenfilterindex] = uigetfile( ...
{  '*.xls','xls-Files (*.xls)'; ...
   '*.xlsx','xlsx-files (*.xlsx)'}, ...
   'Pick a file', ...
   'MultiSelect', 'off');
if Probenfilename ~= 0
    Proben_name=fullfile(Probenpathname,Probenfilename);
    set(handles.text4 ,'ForegroundColor','g')
    [handles.num_p,handles.txt_p,handles.raw_p]=xlsread(Proben_name);
    handles.Proben=handles.num_p;
    [handles.Probenanzahl,handles.Probenkriterien]=size(handles.Proben);
    set(handles.edit2,'String',num2str(handles.Probenanzahl))
    set(handles.pushbutton5,'Enable','on');
else
     msgbox('Keine Datei gewählt','Import Warnung','Warnung')
end
guidata(hObject, handles);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.ident=zeros(handles.Kippenanzahl,handles.Probenanzahl); %Matrix für test Kippe vs. Probe
handles.nachuntersuchung=zeros(handles.Kippenanzahl,handles.Kippenkriterien-7,handles.Probenanzahl); %Matrix für Nachuntersuchungen der Probe bzgl. Kippe
for i=1:handles.Probenanzahl
    
    findKippen=find(handles.Kippen(:,7)==handles.Proben(i,7)); %finde alle Kippen die die gleiche AVV haben wie Probe
    for j=1:length(findKippen)
    tmpProbe=[handles.Proben(i,8),handles.Proben(i,8:end),handles.Proben(i,end)]; %template der i-ten Probe
    tmpKippe=handles.Kippen(findKippen(j),8:end);                                 %template der j-ten Kippe
    nachpruefen=((tmpKippe==-1)-(tmpProbe==-1))==-1;                              %Parameter die die Kippe fordert aber nicht in der Probe enthalten sind sind nachzuprüfen
        if (tmpProbe(1)~=-1) && (tmpKippe(1)~=-1)
            tmpProbe(1)=tmpProbe(1)*-1;
            tmpKippe(1)=tmpKippe(1)*-1;
        end
        if (tmpProbe(end-1)~=-1) && (tmpKippe(end-1)~=-1)
            tmpProbe(end-1)=tmpProbe(end-1)*-1;
            tmpKippe(end-1)=tmpKippe(end-1)*-1;
        end
    parameter_k=find(tmpKippe~=-1); %finde parameter die die Kippe benötigt
    tmpProbe=tmpProbe(parameter_k); %reduzieren
    tmpKippe=tmpKippe(parameter_k); %reduzieren
    parameter_p=find(tmpProbe~=-1); %finde alle parameter die jetzt noch ~=-1(nicht verfügbar) sind
    tmpKippe=tmpKippe(parameter_p); %reduzieren
    tmpProbe=tmpProbe(parameter_p); %reduzieren
    test=(tmpKippe-tmpProbe)>=0;    %TEST
        if sum(test)==length(test)
            handles.ident(findKippen(j),i)=1;
            handles.nachuntersuchung(findKippen(j),:,i)=nachpruefen;
        end
    end 
end

auswahl= find(handles.ident(:,1)~=0);
lat = ((handles.num_k(auswahl,3)./60+handles.num_k(auswahl,2))./60)+handles.num_k(auswahl,1);
lon = ((handles.num_k(auswahl,6)./60+handles.num_k(auswahl,5))./60)+handles.num_k(auswahl,4);
lat_probe=((handles.num_p(1,3)./60+handles.num_p(1,2))./60)+handles.num_p(1,1);
lon_probe=((handles.num_p(1,6)./60+handles.num_p(1,5))./60)+handles.num_p(1,4);
dist = 111.324 * acosd(sind(lat) .* sind(lat_probe) + cosd(lat) .* cosd(lat_probe) .* cosd(lon_probe - lon));
radius=str2double(get(handles.edit13,'String'));
auswahl=auswahl(find(dist<radius));
lat=lat(find(dist<radius));
lon=lon(find(dist<radius));
charlogical=cell(1,length(auswahl));
Spaltenname=cell(1,length(auswahl));
for i=1:length(auswahl)
    charlogical{1,i}='logical';
    Spaltenname{1,i}=[handles.txt_k{auswahl(i)+3,1}];
end
set(handles.listbox1 , 'Visible' , 'on')
set(handles.listbox1 , 'String' , handles.txt_p(4:end,1))
set(handles.uitable1 , 'Visible' , 'on')
set(handles.uitable1 , 'ColumnFormat' , charlogical)
set(handles.uitable1 , 'Data' , handles.nachuntersuchung(auswahl,:,1)==1')
set(handles.uitable1 , 'RowName' , Spaltenname)
set(handles.uitable1,'ColumnName',handles.txt_k(2,10:end))
color=colormap(lines);
color=color(1:length(lon),:);
handles.hhh=figure(1)
for i=1:length(lon)
plot(lon(i),lat(i),'.','Color',color(i,:),'MarkerSize',40)
hold on
end
plot(lon_probe,lat_probe,'.','Color',[0 1 0],'MarkerSize',40)
plot_google_map
title(['Kippenstandorte für Probe',handles.txt_p(4,1)],'FontWeight','bold')
legend([Spaltenname,'Probe'],'Location','eastoutside');
xlabel('Map provided by Google')
set(handles.pushbutton2,'Enable','on')
guidata(hObject, handles);

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
close(handles.hhh)
tmp=get(handles.listbox1 ,'Value');
auswahl= find(handles.ident(:,tmp)~=0);
lat = ((handles.num_k(auswahl,3)./60+handles.num_k(auswahl,2))./60)+handles.num_k(auswahl,1);
lon = ((handles.num_k(auswahl,6)./60+handles.num_k(auswahl,5))./60)+handles.num_k(auswahl,4);
lat_probe=((handles.num_p(1,3)./60+handles.num_p(1,2))./60)+handles.num_p(1,1);
lon_probe=((handles.num_p(1,6)./60+handles.num_p(1,5))./60)+handles.num_p(1,4);
dist = 111.324 * acosd(sind(lat) .* sind(lat_probe) + cosd(lat) .* cosd(lat_probe) .* cosd(lon_probe - lon));
radius=str2double(get(handles.edit13,'String'));
auswahl=auswahl(find(dist<radius));
lat=lat(find(dist<radius));
lon=lon(find(dist<radius));
charlogical=cell(1,length(auswahl));
Spaltenname=cell(1,length(auswahl));
for i=1:length(auswahl)
    charlogical{1,i}='logical';
    Spaltenname{1,i}=[handles.txt_k{auswahl(i)+3,1}];
end
set(handles.uitable1 , 'Data' , handles.nachuntersuchung(auswahl,:,tmp)==1')
set(handles.uitable1 , 'RowName' , Spaltenname)
color=colormap(lines);
color=color(1:length(lon),:);
figure(1)
for i=1:length(lon)
plot(lon(i),lat(i),'.','Color',color(i,:),'MarkerSize',40)
hold on
end
plot(lon_probe,lat_probe,'.','Color',[0 1 0],'MarkerSize',40)
plot_google_map
title(['Kippenstandorte für Probe',handles.txt_p(tmp+3,1)],'FontWeight','bold')
legend([Spaltenname,'Probe'],'Location','eastoutside');
xlabel('Map provided by Google')
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[savefile, savepath, savefilter] = uiputfile( ...
%{  '*.xls','xls-Files (*.xls)'}, ...
%   'Save File as');

h = actxserver('DAO.DBEngine.36');
[savefile,savepath,safeindex]=uiputfile(...
{  '*.xls','xls-Files (*.xls)'; ...
   '*.xlsx','xlsx-files (*.xlsx)'});
name=fullfile(savepath,savefile);
database = 'VISysDat.mdb';
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

Kunden=get(handles.uitable1,'RowName');
Parameter=get(handles.uitable1,'ColumnName');
cellarray=cell(length(Kunden)+1,55);
cellarray(2:end,1)=Kunden;
cellarray(1,1:7)={'KNummer','KName','KStraße','KPLZ','KOrt','KTelefon','KFax'};
cellarray(1,8:end)=Parameter;
Pruefparameter=get(handles.uitable1,'Data');
for i=1:length(Kunden)
    [x ~] = ind2sub(size(A),find(cellfun(@(x)strcmp(x,Kunden(i,1)),A)));
    if x~=0
    cellarray(i+1,2:5)=A(x,2:5);
    cellarray(i+1,6)=A(x,7);
    cellarray(i+1,7)=A(x,12);
    else
    h = warndlg(['Kunde,',Kunden(i,1),'nicht gefunden, bitte Datenbank aktualisieren'],'Warnung');
    uiwait(h)
    end
    for j=1:length(Parameter)
        if Pruefparameter(i,j)==1
           cellarray(i+1,7+j)={'prüfen'};
        else
           cellarray(i+1,7+j)={' '};
        end
    end
end
s = xlswrite(name, cellarray);



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
Wahl=get(handles.popupmenu1, 'Value');
if Wahl==2||Wahl==3||Wahl==4||Wahl==5||Wahl==13
    cellvar={'170504','170506','170508','170101','170102','170103','170107'};
    set(handles.popupmenu2, 'String',cellvar)
    set(handles.popupmenu2, 'Enable','on')
    set(handles.pushbutton3,'Enable','on')
end
if Wahl==6||Wahl==7||Wahl==8||Wahl==9
    cellvar={'170504','170506','170508'};
    set(handles.popupmenu2, 'String',cellvar)
    set(handles.popupmenu2, 'Enable','on')
    set(handles.pushbutton3,'Enable','on')
end
if Wahl==10||Wahl==11||Wahl==12
    cellvar={'170101','170102','170103','170107'};
    set(handles.popupmenu2, 'String',cellvar)
    set(handles.popupmenu2, 'Enable','on')
    set(handles.pushbutton3,'Enable','on')
end
if Wahl==14||Wahl==15||Wahl==16
    cellvar={'170503','170505','170507','170106'};
    set(handles.popupmenu2, 'String',cellvar)
    set(handles.popupmenu2, 'Enable','on')
    set(handles.pushbutton3,'Enable','on')
end
if Wahl==1
    set(handles.pushbutton3,'Enable','off')
    set(handles.popupmenu2, 'Enable','off')
    set(handles.popupmenu2, 'String','Bitte Wählen')
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    Liste={'Z0','Z1.1','Z1.2','Z2','W1.1','W1.2','W2','DK0','DK1','DK2','DK3','RuVa_A','RuVa_B','RuVa_C'};
    set(hObject,'String',Liste)
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.Kippenanzahl==0
   warndlg('Warnung, Bitte Kippenverzeichniss importieren')
else
    [handles.num_sp,handles.txt_sp,handles.raw_sp]=xlsread('Standardproben.xls');
    [handles.sProbenanzahl,~]=size(handles.num_sp);
    handles.ident=zeros(handles.Kippenanzahl,handles.sProbenanzahl); %Matrix für test Kippe vs. Probe
    handles.nachuntersuchung=zeros(handles.Kippenanzahl,handles.Kippenkriterien-7,handles.sProbenanzahl); %Matrix für Nachuntersuchungen der Probe bzgl. Kippe
    AVVs=get(handles.popupmenu2,'String');
    AVV=str2double(AVVs{get(handles.popupmenu2,'Value')});
    findKippen=find(handles.Kippen(:,7)==AVV); %finde alle Kippen die die gleiche AVV haben wie Probe
    Probenqual=handles.cell_var1{get(handles.popupmenu1,'Value')};
    [x ~] = ind2sub(size(handles.txt_sp),find(cellfun(@(x)strcmp(x,Probenqual),handles.txt_sp)));
    Zeile=find(handles.num_sp(x-3,1)==AVV);
    i=x(Zeile)-3;
    for j=1:length(findKippen)
    tmpProbe=[handles.num_sp(i,2),handles.num_sp(i,2:end),handles.num_sp(i,end)]; %template der i-ten Probe
    tmpKippe=handles.Kippen(findKippen(j),8:end);                                 %template der j-ten Kippe
    nachpruefen=((tmpKippe==-1)-(tmpProbe==-1))==-1;                              %Parameter die die Kippe fordert aber nicht in der Probe enthalten sind sind nachzuprüfen
        if (tmpProbe(1)~=-1) && (tmpKippe(1)~=-1)
            tmpProbe(1)=tmpProbe(1)*-1;
            tmpKippe(1)=tmpKippe(1)*-1;
        end
        if (tmpProbe(end-1)~=-1) && (tmpKippe(end-1)~=-1)
            tmpProbe(end-1)=tmpProbe(end-1)*-1;
            tmpKippe(end-1)=tmpKippe(end-1)*-1;
        end
    parameter_k=find(tmpKippe~=-1); %finde parameter die die Kippe benötigt
    tmpProbe=tmpProbe(parameter_k); %reduzieren
    tmpKippe=tmpKippe(parameter_k); %reduzieren
    parameter_p=find(tmpProbe~=-1); %finde alle parameter die jetzt noch ~=-1(nicht verfügbar) sind
    tmpKippe=tmpKippe(parameter_p); %reduzieren
    tmpProbe=tmpProbe(parameter_p); %reduzieren
    test=(tmpKippe-tmpProbe)>=0;    %TEST
        if sum(test)==length(test)
            handles.ident(findKippen(j),i)=1;
            handles.nachuntersuchung(findKippen(j),:,i)=nachpruefen;
        end
    end 
end

auswahl= find(handles.ident(:,Zeile)~=0);
lat = ((handles.num_k(auswahl,3)./60+handles.num_k(auswahl,2))./60)+handles.num_k(auswahl,1);
lon = ((handles.num_k(auswahl,6)./60+handles.num_k(auswahl,5))./60)+handles.num_k(auswahl,4);
lat_probe = ((str2double(get(handles.edit8,'String'))/60+str2double(get(handles.edit7,'String')))/60+str2double(get(handles.edit6,'String')));
lon_probe = ((str2double(get(handles.edit11,'String'))/60+str2double(get(handles.edit10,'String')))/60+str2double(get(handles.edit9,'String')));
if isnan(lat_probe)~=1&&isnan(lon_probe)~=1
dist = 111.324 * acosd(sind(lat) .* sind(lat_probe) + cosd(lat) .* cosd(lat_probe) .* cosd(lon_probe - lon));
radius=str2double(get(handles.edit13,'String'));
auswahl=auswahl(find(dist<radius));
lat=lat(find(dist<radius));
lon=lon(find(dist<radius));
end
charlogical=cell(1,length(auswahl));
Spaltenname=cell(1,length(auswahl));
for i=1:length(auswahl)
    charlogical{1,i}='logical';
    Spaltenname{1,i}=[handles.txt_k{auswahl(i)+3,1}];
end
tmp=get(handles.popupmenu1,'String');
set(handles.listbox1 , 'Visible' , 'on')
set(handles.listbox1 , 'String' , tmp(get(handles.popupmenu1,'Value')))
set(handles.uitable1 , 'Visible' , 'on')
set(handles.uitable1 , 'ColumnFormat' , charlogical)
set(handles.uitable1 , 'Data' , handles.nachuntersuchung(auswahl,:,1)==1')
set(handles.uitable1 , 'RowName' , Spaltenname)
set(handles.uitable1,'ColumnName',handles.txt_k(2,10:end))
color=colormap(lines);
color=color(1:length(lon),:);
figure()
for i=1:length(lon)
plot(lon(i),lat(i),'.','Color',color(i,:),'MarkerSize',40)
hold on
end
plot(lon_probe,lat_probe,'.','Color',[0 1 0],'MarkerSize',40)
plot_google_map
%title(['Kippenstandorte für Probe',handles.txt_sp(4,1)],'FontWeight','bold')
legend([Spaltenname,'Probe'],'Location','eastoutside');
xlabel('Map provided by Google')
set(handles.pushbutton2,'Enable','on')
guidata(hObject, handles);


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warnung, Bitte numerischen Wert eingeben','Warnung')
end

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warnung, Bitte numerischen Wert eingeben','Warnung')
end

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warnung, Bitte numerischen Wert eingeben','Warnung')
end

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warnung, Bitte numerischen Wert eingeben','Warnung')
end

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warnung, Bitte numerischen Wert eingeben','Warnung')
end

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warnung, Bitte numerischen Wert eingeben','Warnung')
end

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
% axes(hObject)
imshow('BAeR_Logo.bmp','Parent',axes2);


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
% axes(hObject)
imshow('BAeR_Logo.bmp','Parent',axes2);
% imshow()



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warnung, Bitte numerischen Wert eingeben','Warnung')
end

% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
axes(hObject)
imshow('BAeR_Logo.bmp');