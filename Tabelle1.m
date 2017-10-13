function varargout = Tabelle1(varargin)
% TABELLE1 M-file for Tabelle1.fig
%      TABELLE1, by itself, creates a new TABELLE1 or raises the existing
%      singleton*.
%
%      H = TABELLE1 returns the handle to a new TABELLE1 or the handle to
%      the existing singleton*.
%
%      TABELLE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABELLE1.M with the given input arguments.
%
%      TABELLE1('Property','Value',...) creates a new TABELLE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tabelle1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tabelle1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tabelle1

% Last Modified by GUIDE v2.5 27-Oct-2011 18:54:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tabelle1_OpeningFcn, ...
                   'gui_OutputFcn',  @Tabelle1_OutputFcn, ...
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


% --- Executes just before Tabelle1 is made visible.
function Tabelle1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tabelle1 (see VARARGIN)

% Choose default command line output for Tabelle1
handles.output = hObject;
setappdata(0,'tTabelle1',gcf);
tTabelle1=getappdata(0,'tTabelle1');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tabelle1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tabelle1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
