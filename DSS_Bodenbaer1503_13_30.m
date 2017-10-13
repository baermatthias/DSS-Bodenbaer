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

% Last Modified by GUIDE v2.5 15-Mar-2013 12:49:30

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
handles.output = hObject;
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
{  '*.xlsx','xlsx-files (*.xlsx)'; ...
   '*.xls','xls-Files (*.xls)'}, ...
   'Pick a file', ...
   'MultiSelect', 'off');
if Kippenfilename ~= 0
    Kippen_name=fullfile(Kippenpathname,Kippenfilename);
    set(handles.text3 ,'ForegroundColor','g')
    
    [handles.num_k,handles.txt_k,handles.raw_k]=xlsread(Kippen_name);
    handles.Kippen=handles.num_k;
    [handles.Kippenanzahl,handles.Kippenkriterien]=size(handles.Kippen)
    set(handles.edit1,'String',num2str(handles.Kippenanzahl))
else
     msgbox('Keine Datei gewählt','Import Warnung','warn')
end
guidata(hObject, handles);

% --------------------------------------------------------------------
function Menue_Proben_Callback(hObject, eventdata, handles)
% hObject    handle to Menue_Proben (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Probenfilename, Probenpathname, Probenfilterindex] = uigetfile( ...
{  '*.xlsx','xlsx-files (*.xlsx)'; ...
   '*.xls','xls-Files (*.xls)'}, ...
   'Pick a file', ...
   'MultiSelect', 'off');
if Probenfilename ~= 0
    Proben_name=fullfile(Probenpathname,Probenfilename);
    set(handles.text4 ,'ForegroundColor','g')
    [handles.num_p,handles.txt_p,handles.raw_p]=xlsread(Proben_name);
    handles.Proben=handles.num_p;
    [handles.Probenanzahl,handles.Probenkriterien]=size(handles.Proben);
    set(handles.edit2,'String',num2str(handles.Probenanzahl))
else
     msgbox('Keine Datei gewählt','Import Warnung','warn')
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
function pushbutton1_Callback(hObject, eventdata, handles)
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
charlogical=cell(1,length(auswahl));
Spaltenname=cell(1,length(auswahl));
for i=1:length(auswahl)
    charlogical{1,i}='logical';
    Spaltenname{1,i}=[handles.txt_k{auswahl(i)+3,1} ' ' int2str(handles.num_k(auswahl(i),7))];
end
set(handles.listbox1 , 'Visible' , 'on')
set(handles.listbox1 , 'String' , handles.txt_p(4:end,1))
set(handles.uitable1 , 'Visible' , 'on')
set(handles.uitable1 , 'ColumnFormat' , charlogical)
set(handles.uitable1 , 'Data' , handles.nachuntersuchung(auswahl,:,1)==1')
set(handles.uitable1 , 'RowName' , Spaltenname)
set(handles.uitable1,'ColumnName',handles.txt_k(2,10:end))
lat = ((handles.num_k(auswahl,3)./60+handles.num_k(auswahl,2))./60)+handles.num_k(auswahl,1);
lon = ((handles.num_k(auswahl,6)./60+handles.num_k(auswahl,5))./60)+handles.num_k(auswahl,4);
lat_probe=((handles.num_p(1,3)./60+handles.num_p(1,2))./60)+handles.num_p(1,1);
lon_probe=((handles.num_p(1,6)./60+handles.num_p(1,5))./60)+handles.num_p(1,4);
color=colormap(lines);
color=color(1:length(lon),:);
figure()
for i=1:length(lon)
plot(lon(i),lat(i),'.','Color',color(i,:),'MarkerSize',40)
hold on
end
plot(lon_probe,lat_probe,'.','Color',[0 1 0],'MarkerSize',40)
plot_google_map
title(['Kippenstandorte für Probe',handles.txt_p(4,1)],'FontWeight','bold')
legend([Spaltenname,'Probe'],'Location','eastoutside');
set(handles.pushbutton2,'Enable','on')
guidata(hObject, handles);

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
tmp=get(handles.listbox1 ,'Value');
auswahl= find(handles.ident(:,tmp)~=0);
charlogical=cell(1,length(auswahl));
Spaltenname=cell(1,length(auswahl));
for i=1:length(auswahl)
    charlogical{1,i}='logical';
    Spaltenname{1,i}=[handles.txt_k{auswahl(i)+3,1} ' ' int2str(handles.num_k(auswahl(i),7))];
end
set(handles.uitable1 , 'Data' , handles.nachuntersuchung(auswahl,:,1)==1')
set(handles.uitable1 , 'RowName' , Spaltenname)
lat = ((handles.num_k(auswahl,3)./60+handles.num_k(auswahl,2))./60)+handles.num_k(auswahl,1);
lon = ((handles.num_k(auswahl,6)./60+handles.num_k(auswahl,5))./60)+handles.num_k(auswahl,4);
lat_probe=((handles.num_p(1,3)./60+handles.num_p(1,2))./60)+handles.num_p(1,1);
lon_probe=((handles.num_p(1,6)./60+handles.num_p(1,5))./60)+handles.num_p(1,4);
color=colormap(lines);
color=color(1:length(lon),:);
figure()
for i=1:length(lon)
plot(lon(i),lat(i),'.','Color',color(i,:),'MarkerSize',40)
hold on
end
plot(lon_probe,lat_probe,'.','Color',[0 1 0],'MarkerSize',40)
plot_google_map
title(['Kippenstandorte für Probe',handles.txt_p(4,1)],'FontWeight','bold')
legend([Spaltenname,'Probe'],'Location','eastoutside');
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
[a,b]=uiputfile()