function varargout = Magranaso(varargin)

% Magranaso M-file for Magranaso.fig
%      Magranaso, by itself, creates a new Magranaso or raises the existing
%      singleton*.
%
%      H = Magranaso returns the handle to a new Magranaso or the handle to
%      the existing singleton*.
%
%      Magranaso('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Magranaso.M with the given input arguments.
%
%      Magranaso('Property','Value',...) creates a new Magranaso or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Magranaso_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Magranaso_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Magranaso

% Last Modified by GUIDE v2.5 02-Aug-2012 17:20:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Magranaso_OpeningFcn, ...
                   'gui_OutputFcn',  @Magranaso_OutputFcn, ...
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


% --- Executes just before Magranaso is made visible.
function Magranaso_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Magranaso (see VARARGIN)

% Choose default command line output for Magranaso
handles.output = hObject;
handles.Face = 0;
handles.Vert = 0;
handles.Normals = 0;
handles.calgrv=0;
handles.calmag=0;
%PROFIL
%handles.xmax=1;
%handles.xspc=1;
%handles.xmin=0;
%handles.ymax=0;
%handles.yspc=1;
%handles.ymin=0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Magranaso wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Magranaso_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warning, no numerical value entered')
end


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
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warning, no numerical value entered')
end

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


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warning, no numerical value entered')
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warning, no numerical value entered')
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warning, no numerical value entered')
end

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
    warndlg('Warning, no numerical value entered')
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[a b c]=CreateModel();
handles.Face=a;
handles.Vert=b;
handles.Normals=c;
set(handles.edit21,'String',num2str(size(a,1)));
set(handles.edit22,'String',num2str(size(b,1)));
guidata(hObject,handles);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
if get(hObject,'Value')
    set(handles.edit7,'Enable','on')
else
    set(handles.edit7,'Enable','off')
end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
if get(hObject,'Value')
    set(handles.edit8,'Enable','on')
    set(handles.edit9,'Enable','on')
    set(handles.edit10,'Enable','on')
    set(handles.edit11,'Enable','on')
    set(handles.edit12,'Enable','on')
    set(handles.edit13,'Enable','on')
    set(handles.edit14,'Enable','on')
else
    set(handles.edit8,'Enable','off')
    set(handles.edit9,'Enable','off')
    set(handles.edit10,'Enable','off')
    set(handles.edit11,'Enable','off')
    set(handles.edit12,'Enable','off')
    set(handles.edit13,'Enable','off')
    set(handles.edit14,'Enable','off')
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
    warndlg('Warning, no numerical value entered')
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
    warndlg('Warning, no numerical value entered')
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
    warndlg('Warning, no numerical value entered')
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
    warndlg('Warning, no numerical value entered')
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
    warndlg('Warning, no numerical value entered')
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



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warning, no numerical value entered')
end

% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
    warndlg('Warning, no numerical value entered')
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



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
a=get(hObject,'String');
a(findstr(a , ',')) = '.';
set(hObject,'String',a);
if isnan(str2double(a))
    warndlg('Warning, no numerical value entered')
end

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%check if calculation is choosed
if (get(handles.checkbox1,'Value') || get(handles.checkbox2,'Value') && str2double(get(handles.edit21,'String'))~=0)
%load constants
Face=handles.Face;             % Reference which Points make up Faces
Corner=handles.Vert;           % Surface Points
xmin=str2double(get(handles.edit1,'String'));   % read profile
xspc=str2double(get(handles.edit2,'String'));
xmax=str2double(get(handles.edit3,'String'));
if xmin==xmax && xspc==0
    xspc=1;
end
ymin=str2double(get(handles.edit4,'String'));
yspc=str2double(get(handles.edit5,'String'));
ymax=str2double(get(handles.edit6,'String'));
if ymin==ymax && yspc==0
    yspc=1;
end
calgrv=get(handles.checkbox1,'Value');          % read profile options
calmag=get(handles.checkbox2,'Value');
Gc = 6.6732e-9;            % Universal Gravitational constant
[Nf,~] = size(Face);        % Number of Faces
[Ncor,~] = size(Corner);    % Number of Vertices
Nedges=Nf*3;                % Number of Edges

Edge=zeros(Nedges,8);       % initialize array
Un=zeros(Nf,3);             % initialize array
k=1;
if isscalar(handles.Normals)==0
   Un=handles.Normals;
   for f=1:Nf
   p1=Corner(Face(f,1),:);
   p2=Corner(Face(f,2),:);
   p3=Corner(Face(f,3),:);
   sn=cross(p2-p1,p3-p1);
   UnTmp(f,:)=sn./norm(sn);
   if UnTmp(f,:)~=Un(f,:)
      idn(k)=f;
      k=k+1;
   end
   end
   tmp=Face(idn,3);
   Face(idn,3)=Face(idn,1);
   Face(idn,1)=tmp;
else
   for f=1:Nf
   p1=Corner(Face(f,1),:);
   p2=Corner(Face(f,2),:);
   p3=Corner(Face(f,3),:);
   sn=cross(p2-p1,p3-p1);
   Un(f,:)=sn./norm(sn);
   end
end



for f=1:Nf                  % Get edgelengths
   indx=[Face(f,:) Face(f,1)];
   for t=1:3
      edgeno=(f-1)*3+t;
      ends=indx(t:t+1);
      p1=Corner(ends(1),:);
      p2=Corner(ends(2),:);
      V=p2-p1;
      L=norm(V);
      Edge(edgeno,1:3)=V;
      Edge(edgeno,4)=L;
      Edge(edgeno,7:8)=ends;
   end
end

[X,Y]=meshgrid(xmin:xspc:xmax,ymin:yspc:ymax); % generate mesch
[npro nstn]=size(X);                           % get mesh size     
if calgrv
   Gx=zeros(size(X)); 
   Gy=Gx; 
   Gz=Gx;
   dens=str2double(get(handles.edit7,'String'));
end

if calmag
   % read constants
   Hintn=str2double(get(handles.edit8,'String'));
   Hincl=str2double(get(handles.edit9,'String'));
   Decl=str2double(get(handles.edit10,'String'));
   Mstrength=str2double(get(handles.edit12,'String'));
   Mincl=str2double(get(handles.edit13,'String'));
   Mdecl=str2double(get(handles.edit14,'String')); 
   Susc= str2double(get(handles.edit11,'String'));
   
   Hin=Hincl*pi/180;
   Dec=Decl*pi/180;
   cx=cos(Hin)*cos(Dec); 
   cy=cos(Hin)*sin(Dec); 
   cz = sin(Hin); 
   Uh=[cx cy cz];
   H=Hintn .* Uh; % The ambient magnetic field 
   Ind_magn=Susc.*H/(4*pi); % Induced magnetization 
   Min=Mincl*pi/180;
   Mdec=Mdecl*pi/180; 
   mcx=cos(Min) *cos(Mdec); 
   mcy=cos(Min)*sin(Mdec); 
   mcz=sin(Min); 
   Um=[mcx mcy mcz];
   Rem_magn=Mstrength .* Um; % Remnant magnetization 
   Net_magn=Rem_magn+Ind_magn; % Net magnetization 
   Pd=(Un * Net_magn')'; % Pole densities 
   Hx=zeros(size(X)); 
   Hy=Hx; 
   Hz=Hx;
end

% Comments: Now, for each observation point do the following: 
% For each face find solid angle; 
% for each side find p,q,r, and add p,q,r of sides 
% to get P,Q,R for the face; 
% if calmag=1, find hx,hy,hz; 
% if calgrv=1, find gx,gy,gz. 
% Add the components from all the faces to get 
% Hx,Hy,Hz and Gx,Gy,Gz at the station.
tic
h=waitbar(0,'Calculating ...');
for pr=1:npro,
   for st=1:nstn
      opt=[X(pr,st) Y(pr,st) 0];
      fsign=zeros(1,Nf); 
      Omega=zeros(1,Nf); 
      for t=1:Ncor
         cor(t,:) = Corner(t,:)-opt;
      end % shift origin 
      
      for f=1:Nf
         nsides=3;
         cors=Face(f,:); 
         Edge(:,5:6)=zeros(Nedges,2); % Clear record of integration 
         indx=[1:nsides 1 2];
         for t=1:nsides
            crs(t,:)=cor(cors(t),:);
         end
         % Find if the face is seen from inside
         fsign(f)=sign((Un(f,1)*crs(1,1)+Un(f,2)*crs(1,2)+Un(f,3)*crs(1,3)));
         % Find solid angle W subtended by face f at opt
         dp1=crs(indx(1),1)*Un(f,1)+crs(indx(1),2)*Un(f,2)+crs(indx(1),3)*Un(f,3);
         dp=abs(dp1); 
         if dp==0
            Omega(f)=0;
         end
         if dp~=0
            if isscalar(handles.Normals)==0
                if sum(Un(f,:)==-UnTmp(f,:))==3 && fsign(f)==1
                    tmp1=TriAngle(crs(3,:),crs(2,:),crs(1,:));
                else
                    tmp1=TriAngle(crs(1,:),crs(2,:),crs(3,:));
                end
            else
                tmp1=TriAngle(crs(3,:),crs(2,:),crs(1,:)); 
            end
            Omega(f)=tmp1;
            if fsign(f)==-1
                Omega(f)=-fsign(f)*Omega(f);
            end
            
         end 
         %indx=[1:nsides 1 2];
         %for t=1:nsides
         %   crs(t,:)=cor(cors(t),:);
         %end
         % Integrate over each side, if not done, and save result 
         PQR=[0 0 0];
         for t=1:nsides
            p1=crs(indx(t),:); 
            p2=crs(indx(t+1),:); 
            Eno=(f-1)*3+t; % Edge number 
            if Edge(Eno,6)==1
               I=Edge(Eno,5);
               V=Edge(Eno,1:3);
               pqr=I .* V;
               PQR=PQR+pqr; 
            end 
            if Edge(Eno,6)~=1  % in original manuscript there was a typo...
               chsgn=1; % if origin, p1 & p2 are on a st line
               if (p1(1)*p2(1)+p1(2)*p2(2)+p1(3)*p2(3))/(norm(p1)*norm(p2))==1
                  if norm(p1)>norm(p2) % and pi farther than p2 
                     chsgn=-1; 
                     psave=p1; 
                     p1=p2; 
                     p2=psave; % interchange p1,p2
                  end,
               end
               V=Edge(Eno,1:3);
               L=Edge(Eno,4);
               L2=L*L; 
               b=2*(V(1)*p1(1)+V(2)*p1(2)+V(3)*p1(3));
               r1=norm(p1);
               r12=r1*r1; 
               b2=b/L/2; 
               if (r1+b2 == 0),
                  V= -Edge(Eno,1:3);
                  b=2*(V(1)*p1(1)+V(2)*p1(2)+V(3)*p1(3));
                  b2=b/L/2; 
               end 
               if (r1+b2 ~= 0),
                  I = (1/L).* log((sqrt(L2 + b + r12) + L + b2)./(r1 + b2));
               end 
               s=find((Edge(:,7)==Edge(Eno,8)) & (Edge(:,8) == Edge(Eno,7)));
               I=I*chsgn; % change sign of I if p1,p2 were interchanged 
               Edge(Eno,5)=I;
               Edge(s,5)=I;
               Edge(Eno,6)=1;
               Edge(s,6)=1;
               pqr=I .* V; 
               PQR=PQR+pqr; 
            end, 
         end % From Omega,l,m,n,PQR, get components of field due to 
         % face f
         l=Un(f,1);
         m=Un(f,2);
         n=Un(f,3);
         p=PQR(1,1);
         q=PQR(1,2);
         r=PQR(1,3);
         if calmag==1,
            hx=Pd(f)*(l*Omega(f)+n*q-m*r);
            Hx(pr,st)=Hx(pr,st)+hx;
            hy=Pd(f)*(m*Omega(f)+l*r-n*p);
            Hy(pr,st)=Hy(pr,st)+hy;
            hz=Pd(f)*(n*Omega(f)+m*p-l*q);
            Hz(pr,st)=Hz(pr,st)+hz;
         end
         if calgrv== 1, 
            if dp~=0 % if distance to face is non-zero
               gx=-dens*Gc*dp1*(l*Omega(f)+n*q-m*r);
               Gx(pr,st)=Gx(pr,st)+ gx;
               gy=-dens*Gc*dp1*(m*Omega(f)+l*r-n* p);
               Gy(pr,st)=Gy(pr,st)+ gy;
               gz=-dens*Gc*dp1*(n*Omega(f)+m*p-l*q);
               Gz(pr,st)=Gz(pr,st)+ gz;
            end
         end
      end
   end
   waitbar(pr/npro,h);
end % end of faces, stns, profiles
close(h);
toc
if calmag== 1
   Htot=sqrt((Hx+H(1,1)).^2 + (Hy+H(1,2)).^2 + (Hz+H(1,3)).^2);
   Dt=Htot-Hintn; % Correct change in Total field
   % Approx. change in Total field
   Dta=Hx.*cx+Hy.*cy+Hz.*cz;
end
handles.X=X;
handles.Y=Y;
handles.calgrv=calgrv;
handles.calmag=calmag;
if calgrv
handles.Gx=Gx;
handles.Gy=Gy;
handles.Gz=Gz;
end
if calmag
handles.Hx=Hx;
handles.Hy=Hy;
handles.Hz=Hz;
end
if calgrv==1 && calmag==0
    Results(X,Y,calgrv,calmag,Gx,Gy,Gz,0,0,0);
    save('Gx','Gx')
    save('Gy','Gy')
    save('Gz','Gz')
    save('X','X')
    save('Y','Y')
    save('Face','Face')
    save('Corner','Corner')
end
if calgrv==0 && calmag==1
    Results(X,Y,calgrv,calmag,0,0,0,Hx,Hy,Hz);
    Bx=Hx;
    By=Hy;
    Bz=Hz;
    save('Bx','Bx')
    save('By','By')
    save('Bz','Bz')
    save('X','X')
    save('Y','Y')
    save('Face','Face')
    save('Corner','Corner')
end
if calgrv==1 && calmag==1
    Results(X,Y,calgrv,calmag,Gx,Gy,Gz,Hx,Hy,Hz);
    Bx=Hx;
    By=Hy;
    Bz=Hz;
    save('Gx','Gx')
    save('Gy','Gy')
    save('Gz','Gz')
    save('Bx','Bx')
    save('By','By')
    save('Bz','Bz')
    save('X','X')
    save('Y','Y')
    save('Face','Face')
    save('Corner','Corner')
end
else
    errordlg('Choose Calculation or/and Create Model')
end
set(handles.pushbutton4,'Enable','on')
guidata(hObject,handles);
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.calgrv==0 && handles.calmag==0
    errordlg('No results available!')
end
if handles.calgrv==1 && handles.calmag==0
    Results(handles.X,handles.Y,handles.calgrv,handles.calmag,handles.Gx,handles.Gy,handles.Gz,0,0,0);
end
if handles.calgrv==0 && handles.calmag==1
    Results(handles.X,handles.Y,handles.calgrv,handles.calmag,0,0,0,handles.Hx,handles.Hy,handles.Hz);
end
if handles.calgrv==1 && handles.calmag==1
    Results(handles.X,handles.Y,handles.calgrv,handles.calmag,handles.Gx,handles.Gy,handles.Gz,handles.Hx,handles.Hy,handles.Hz);
end
