function varargout = Results(varargin)
% RESULTS M-file for Results.fig
%      RESULTS, by itself, creates a new RESULTS or raises the existing
%      singleton*.
%
%      H = RESULTS returns the handle to a new RESULTS or the handle to
%      the existing singleton*.
%
%      RESULTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTS.M with the given input arguments.
%
%      RESULTS('Property','Value',...) creates a new RESULTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Results_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Results_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Results

% Last Modified by GUIDE v2.5 20-Sep-2012 08:23:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Results_OpeningFcn, ...
                   'gui_OutputFcn',  @Results_OutputFcn, ...
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


% --- Executes just before Results is made visible.
function Results_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Results (see VARARGIN)

% Choose default command line output for Results
handles.output = hObject;
handles.X = varargin{1};
handles.Y = varargin{2};
handles.calgrv = varargin{3};
handles.calmag = varargin{4};
handles.Gx = varargin{5};
handles.Gy = varargin{6};
handles.Gz = varargin{7};
handles.Bx = varargin{8};
handles.By = varargin{9};
handles.Bz = varargin{10};
if size(handles.X)>[1 1]
    handles.status=1;
    set(handles.pushbutton1,'Enable','off')
    handles.cell_var1 = {'y-Values'};
    for i=1:size(handles.Y,1)
        handles.cell_var1{i+1}=num2str(handles.Y(i,1));
    end
    set(handles.popupmenu2, 'String', handles.cell_var1);
else
    handles.status=2;
    set(handles.pushbutton1,'Enable','on')
    set(handles.uipanel2,'Visible','off')
end

        if handles.calgrv==1 && handles.calmag==0
            handles.cell_var = {'Choose Anomaly' , 'Gx' , 'Gy' , 'Gz'}; 
            set(handles.popupmenu1, 'String', handles.cell_var);
        end
        if handles.calgrv==0 && handles.calmag==1
            handles.cell_var = {'Choose Anomaly' , 'Bx', 'By' , 'Bz'}; 
            set(handles.popupmenu1, 'String', handles.cell_var);
        end
        if handles.calgrv==1 && handles.calmag==1
            handles.cell_var = {'Choose Anomaly' , 'Gx', 'Gy' , 'Gz' , 'Bx', 'By' , 'Bz'}; 
            set(handles.popupmenu1, 'String', handles.cell_var);
        end

        

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Results wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Results_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        popupmenu1
switch handles.status
    case 1
        if handles.calgrv==1 && handles.calmag==0
            switch get(hObject,'Value')
                case 1
                    
                case 2
                    figure(1)
                    surf(handles.X,handles.Y,handles.Gx);
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Gx [Gal]')
                    title('Gx')
                    grid on
                case 3
                    figure(1)
                    surf(handles.X,handles.Y,handles.Gy);
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Gy [Gal]')
                    title('Gy')
                    grid on
                case 4
                    figure(1)
                    surf(handles.X,handles.Y,handles.Gz);
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Gz [Gal]')
                    title('Gz')
                    grid on
            end
        end
        if handles.calgrv==0 && handles.calmag==1
            switch get(hObject,'Value')
                case 1
                case 2
                    figure(1)
                    surf(handles.X,handles.Y,handles.Bx);
                    title('Bx')
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Bx [nT]')
                    grid on
                case 3
                    figure(1)
                    surf(handles.X,handles.Y,handles.By);
                    title('By')
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('By [nT]')
                    grid on
                case 4
                    figure(1)
                    surf(handles.X,handles.Y,handles.Bz);
                    title('Bz')
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Bz [nT]')
                    grid on
            end
        end
        if handles.calgrv==1 && handles.calmag==1
            switch get(hObject,'Value')
                case 1
                case 2
                    figure(1)
                    surf(handles.X,handles.Y,handles.Gx);
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Gx [Gal]')
                    title('Gx')
                    grid on
                case 3
                    figure(1)
                    surf(handles.X,handles.Y,handles.Gy);
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Gy [Gal]')
                    title('Gy')
                    grid on
                case 4
                    figure(1)
                    surf(handles.X,handles.Y,handles.Gz);
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Gz [Gal]')
                    title('Gz')
                    grid on
                case 5
                    figure(1)
                    surf(handles.X,handles.Y,handles.Bx);
                    title('Bx')
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Bx [nT]')
                case 6
                    figure(1)
                    surf(handles.X,handles.Y,handles.By);
                    title('By')
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('By [nT]')
                    grid on
                case 7
                    figure(1)
                    surf(handles.X,handles.Y,handles.Bz);
                    title('Bz')
                    xlabel('x [m]')
                    ylabel('y [m]')
                    zlabel('Bz [nT]')
                    grid on
            end
        end
    case 2
        if handles.X(2)==handles.X(1)
            if handles.calgrv==1 && handles.calmag==0
                switch get(hObject,'Value')
                    case 1
                    case 2
                        figure(1)
                        plot(handles.Y,handles.Gx);
                        xlabel('y [m]')
                        ylabel('Gx [Gal]')
                        title('Gx')
                        grid on
                    case 3
                        figure(1)
                        plot(handles.Y,handles.Gy);
                        xlabel('y [m]')
                        ylabel('Gy [Gal]')
                        title('Gy')
                        grid on
                    case 4
                        figure(1)
                        plot(handles.Y,handles.Gz);
                        xlabel('y [m]')
                        ylabel('Gz [Gal]')
                        title('Gz')
                        grid on
                end
            end
            if handles.calgrv==0 && handles.calmag==1
                switch get(hObject,'Value')
                    case 1
                        
                    case 2
                        figure(1)
                        plot(handles.Y,handles.Bx);
                        title('Bx')
                        xlabel('y [m]')
                        ylabel('Bx [nT]')
                        grid on
                    case 3
                        figure(1)
                        plot(handles.Y,handles.By);
                        title('By')
                        xlabel('y [m]')
                        ylabel('By [nT]')
                        grid on
                    case 4
                        figure(1)
                        plot(handles.Y,handles.Bz);
                        title('Bz')
                        xlabel('y [m]')
                        ylabel('Bz [nT]')
                        grid on
                end
            end
            if handles.calgrv==1 && handles.calmag==1
                switch get(hObject,'Value')
                    case 1
                        
                    case 2
                        figure(1)
                        plot(handles.Y,handles.Gx);
                        xlabel('y [m]')
                        ylabel('Gx [Gal]')
                        title('Gx')
                        grid on
                    case 3
                        figure(1)
                        plot(handles.Y,handles.Gy);
                        xlabel('y [m]')
                        ylabel('Gy [Gal]')
                        title('Gy')
                        grid on
                    case 4
                        figure(1)
                        plot(handles.Y,handles.Gz);
                        xlabel('y [m]')
                        ylabel('Gz [Gal]')
                        title('Gz')
                        grid on
                    case 5
                        figure(1)
                        plot(handles.Y,handles.Bx);
                        title('Bx')
                        xlabel('y [m]')
                        ylabel('Bx [nT]')
                        grid on
                    case 6
                        figure(1)
                        plot(handles.Y,handles.By);
                        title('By')
                        xlabel('y [m]')
                        ylabel('By [nT]')
                        grid on
                    case 7
                        figure(1)
                        plot(handles.Y,handles.Bz);
                        title('Bz')
                        xlabel('y [m]')
                        ylabel('Bz [nT]')
                        grid on
                end
            end
        end
        if handles.Y(2)==handles.Y(1)
            if handles.calgrv==1 && handles.calmag==0
                switch get(hObject,'Value')
                    case 1
                    case 2
                        figure(1)
                        plot(handles.X,handles.Gx);
                        xlabel('x [m]')
                        ylabel('Gx [Gal]')
                        title('Gx')
                        grid on
                    case 3
                        figure(1)
                        plot(handles.X,handles.Gy);
                        xlabel('x [m]')
                        ylabel('Gy [Gal]')
                        title('Gy')
                        grid on
                    case 4
                        figure(1)
                        plot(handles.X,handles.Gz);
                        xlabel('x [m]')
                        ylabel('Gz [Gal]')
                        title('Gz')
                        grid on
                end
            end
            if handles.calgrv==0 && handles.calmag==1
                switch get(hObject,'Value')
                    case 1

                    case 2
                        figure(1)
                        plot(handles.X,handles.Bx);
                        title('Bx')
                        xlabel('x [m]')
                        ylabel('Bx [nT]')
                        grid on
                    case 3
                        figure(1)
                        plot(handles.X,handles.By);
                        title('By')
                        grid on
                    case 4
                        figure(1)
                        plot(handles.X,handles.Bz);
                        title('Bz')
                        ylabel('Bz [nt]')
                        xlabel('x [m]')
                        grid on
                end
            end
            if handles.calgrv==1 && handles.calmag==1
                switch get(hObject,'Value')
                    case 1
                    case 2
                        figure(1)
                        plot(handles.X,handles.Gx);
                        xlabel('x [m]')
                        ylabel('Gx [Gal]')
                        title('Gx')
                        grid on
                    case 3
                        figure(1)
                        plot(handles.X,handles.Gy);
                        xlabel('x [m]')
                        ylabel('Gy [Gal]')
                        title('Gy')
                        grid on
                    case 4
                        figure(1)
                        plot(handles.X,handles.Gz);
                        xlabel('x [m]')
                        ylabel('Gz [Gal]')
                        title('Gz')
                        grid on
                    case 5
                        figure(1)
                        plot(handles.X,handles.Bx);
                        title('Bx')
                        xlabel('x [m]')
                        ylabel('Bx [nT]')
                        grid on
                    case 6
                        figure(1)
                        plot(handles.X,handles.By);
                        title('By')
                        xlabel('x [m]')
                        ylabel('By [nT]')
                        grid on
                    case 7
                        figure(1)
                        plot(handles.X,handles.Bz);
                        title('Bz')
                        xlabel('x [m]')
                        ylabel('Bz [nT]')
                        grid on
                end
            end
        end
end
guidata(hObject, handles);
        
    


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


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
switch get(handles.checkbox1,'Value')
    case 0
        handles.cell_var1 = {'y-Values'};
        for i=1:size(handles.Y,1)
            handles.cell_var1{i+1}=num2str(handles.Y(i,1));
        end
        set(handles.popupmenu2, 'String', handles.cell_var1);
    case 1
        handles.cell_var1 = {'x-Values'};
        for i=1:size(handles.X,2)
            handles.cell_var1{i+1}=num2str(handles.X(1,i));
        end
        set(handles.popupmenu2, 'String', handles.cell_var1);
end
guidata(hObject, handles);
% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
anomalietyp=get(handles.popupmenu1,'Value');
switch anomalietyp
    case 1
        warndlg('Please choose anomaly!')
    case 2
        plotano=handles.Gx;
    case 3
        plotano=handles.Gy;
    case 4
        plotano=handles.Gz;
    case 5
        plotano=handles.Bx;
    case 6
        plotano=handles.By;
    case 7
        plotano=handles.Bz;
end
        
profildirection=get(handles.checkbox1,'Value');
profilvalue=get(handles.popupmenu2,'Value');
switch profildirection
    case 0
        switch profilvalue
            case 1
                set(handles.pushbutton1,'Enable','off')
            otherwise
                set(handles.pushbutton1,'Enable','on')
                figure(1)
                plot(handles.X(1,:),plotano(:,profilvalue-1));
                xlabel('x [m]')
                switch anomalietyp
                    case 2
                        ylabel([handles.cell_var{anomalietyp} ' [Gal]'])
                    case 3
                        ylabel([handles.cell_var{anomalietyp} ' [Gal]'])
                    case 4
                        ylabel([handles.cell_var{anomalietyp} ' [Gal]'])
                    case 5
                        ylabel([handles.cell_var{anomalietyp} ' [nT]'])
                    case 6
                        ylabel([handles.cell_var{anomalietyp} ' [nT]'])
                    case 7
                        ylabel([handles.cell_var{anomalietyp} ' [nT]'])
                end
                %ylabel(handles.cell_var{anomalietyp})
                title([handles.cell_var{anomalietyp} ' for Profil y=' handles.cell_var1{profilvalue}])
        end
    case 1
        switch profilvalue
            case 1
                set(handles.pushbutton1,'Enable','off')
            otherwise
                figure(1)
                plot(handles.Y(:,1),plotano(profilvalue-1,:));
                xlabel('y [m]')
                ylabel(handles.cell_var{anomalietyp})
                title([handles.cell_var{anomalietyp} ' for Profil x=' handles.cell_var1{profilvalue}])
        end
    
end
guidata(hObject, handles);


    

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[MProfilFilename, MProfilPathname, MProfilFilterindex] = uigetfile( ...
{  '*.txt','TXT-files (*.txt)'; ...
   '*.dat','DAT-Files (*.dat)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Datei wählen', ...
   'MultiSelect', 'off');
handles.MProfilName=fullfile(MProfilPathname,MProfilFilename);
TMP=load(handles.MProfilName);
x=TMP(:,1);
MProfile=TMP(:,2);
clear TMP;
figure(1)
hold on;
if get(handles.popupmenu1,'Value')~=1
plot(x,MProfile,'-r');
end
legend('Calculated','Measured Profil')
hold off
guidata(hObject, handles);
