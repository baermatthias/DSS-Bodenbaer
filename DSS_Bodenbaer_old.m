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

% Last Modified by GUIDE v2.5 30-Oct-2011 09:57:36

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
    global num_k
    global txt_k
    global raw_k
    global Kippen
    global a2
    global b2
    [num_k,txt_k,raw_k]=xlsread(Kippen_name);
    Kippen=num_k;
    [a2,b2]=size(Kippen);
    set(handles.edit1,'String',num2str(b2))
else
     msgbox('Keine Datei gewählt','Import Warnung','warn')
end

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
    global num_p
    global txt_p
    global raw_p
    global Proben
    global a1
    global b1
    [num_p,txt_p,raw_p]=xlsread(Proben_name);
    Proben=num_p;
    [a1,b1]=size(Proben);
    set(handles.edit2,'String',num2str(b1))
else
     msgbox('Keine Datei gewählt','Import Warnung','warn')
end


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
global ident
global nachuntersuchung
global a1
global a2
global b1
global b2
global Proben
global Kippen
global txt_k
global txt_p
ident=zeros(b2,b1);
nachuntersuchung=zeros(a2,b2,b1);
for i=1:b1
    
    for j=1:b2
    tmpProbe=[Proben(1,i);Proben(:,i);Proben(end,i)];
    tmpKippe=Kippen(:,j);
    %nachpruefen=find((tmpKippe==-1)-(tmpProbe==-1)==-1)+2
    nachpruefen=(tmpKippe==-1)-(tmpProbe==-1)==-1
    %nachuntersuchung(nachpruefen,j,i)=txt_k(nachpruefen,2);
        if (tmpProbe(1)~=-1) && (tmpKippe(1)~=-1)
            tmpProbe(1)=tmpProbe(1)*-1;
            tmpKippe(1)=tmpKippe(1)*-1;
        end
        if (tmpProbe(end-1)~=-1) && (tmpKippe(end-1)~=-1)
            tmpProbe(end-1)=tmpProbe(end-1)*-1;
            tmpKippe(end-1)=tmpKippe(end-1)*-1;
        end
    parameter_k=find(tmpKippe~=-1);
    tmpProbe=tmpProbe(parameter_k);
    tmpKippe=tmpKippe(parameter_k);
    parameter_p=find(tmpProbe~=-1);
    tmpKippe=tmpKippe(parameter_p);
    tmpProbe=tmpProbe(parameter_p);
    test=(tmpKippe-tmpProbe)>=0;
        if sum(test)==length(test)
            ident(j,i)=1;
            %nachuntersuchung(nachpruefen-2,j,i)=txt_k(nachpruefen,2)
            %nachuntersuchung(nachpruefen-2,j,i)=nachpruefen
            nachuntersuchung(:,j,i)=nachpruefen;
        end
    end 
end

auswahl= find(ident(:,1)~=0);
%nachuntersuchung=nachuntersuchung(:,find(sum(nachuntersuchung(:,1:end))~=0))
%[a3,b3]=size(nachuntersuchung))
%Nachuntersuchung=cell(a3,b3)
charlogical=cell(1,size(auswahl));
for i=1:size(auswahl)
charlogical{1,i}='logical';
end
Spaltenname=cell(1,size(auswahl))
for i=1:length(auswahl)
    Spaltenname{1,i}=[txt_k{1,i+3} ' ' txt_k{2,i+3}]
end
set(handles.listbox1 , 'Visible' , 'on')
set(handles.listbox1 , 'String' , txt_p(1,4:end))
set(handles.uitable1 , 'Visible' , 'on')
set(handles.uitable1 , 'ColumnFormat' , charlogical)
set(handles.uitable1 , 'Data' , nachuntersuchung(:,auswahl,1)==1)
set(handles.uitable1 , 'RowName' , txt_k(3:end,2))
%set(handles.uitable1,'ColumnName',txt_k(1,auswahl+3))
set(handles.uitable1,'ColumnName',Spaltenname)
%tTabelle1=Tabelle1;
%Tabelle1GUIData=guidata(tTabelle1);
%set(Tabelle1GUIData.uitable1,'Data',nachuntersuchung);
%set(Tabelle1GUIData.uitable1,'Data',ident);
%set(Tabelle1GUIData.uitable1,'ColumnName',txt_k(1,4:end))
%set(Tabelle1GUIData.uitable1,'ColumnName',txt_k(1,4:end))
%set(Tabelle1GUIData.uitable1,'RowName',txt_k(3:end,2))

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global ident
global nachuntersuchung
global txt_k
tmp=get(handles.listbox1 ,'Value');
auswahl= find(ident(:,tmp)~=0);
charlogical=cell(1,size(auswahl));
for i=1:size(auswahl)
charlogical{1,i}='logical';
end
Spaltenname=cell(1,size(auswahl))
for i=1:length(auswahl)
    Spaltenname{1,i}=[txt_k{1,i+3} txt_k{2,i+3}]
end
set(handles.uitable1 , 'Data' , nachuntersuchung(:,auswahl,tmp)==1)
set(handles.uitable1,'ColumnName',Spaltenname)
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
