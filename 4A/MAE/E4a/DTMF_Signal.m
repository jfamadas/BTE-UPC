function varargout = DTMF_Signal(varargin)
% DTMF_SIGNAL MATLAB code for DTMF_Signal.fig
%      DTMF_SIGNAL, by itself, creates a new DTMF_SIGNAL or raises the existing
%      singleton*.
%
%      H = DTMF_SIGNAL returns the handle to a new DTMF_SIGNAL or the handle to
%      the existing singleton*.
%
%      DTMF_SIGNAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DTMF_SIGNAL.M with the given input arguments.
%
%      DTMF_SIGNAL('Property','Value',...) creates a new DTMF_SIGNAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DTMF_Signal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DTMF_Signal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DTMF_Signal

% Last Modified by GUIDE v2.5 23-Nov-2016 18:46:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DTMF_Signal_OpeningFcn, ...
                   'gui_OutputFcn',  @DTMF_Signal_OutputFcn, ...
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


% --- Executes just before DTMF_Signal is made visible.
function DTMF_Signal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DTMF_Signal (see VARARGIN)

% Choose default command line output for DTMF_Signal
handles.output = hObject;
A = strjoin(varargin(1));
X = [];
handles.fs = 8000;
%Signal computing
for i=1:1:length(A)
   
    t = (1/(0.3*handles.fs):1/(0.3*handles.fs):1)*0.3;
    
    switch A(i)
        
        case '1'
            f1 = 697;
            f2 = 1209;
        case '2'
            f1 = 697;
            f2 = 1336;
        case '3'
            f1 = 697;
            f2 = 1477;        
        case '4'
            f1 = 770;
            f2 = 1209;            
        case '5'
            f1 = 770;
            f2 = 1336;            
        case '6'
            f1 = 770;
            f2 = 1477;
        case '7'
            f1 = 852;
            f2 = 1209;            
        case '8'
            f1 = 852;
            f2 = 1336;            
        case '9'
            f1 = 852;
            f2 = 1477;            
        case '0'
            f1 = 941;
            f2 = 1336;            
        case '*'
            f1 = 941;
            f2 = 1209;            
        case '#'
            f1 = 941;
            f2 = 1477;            
        case 'A'
            f1 = 697;
            f2 = 1633;            
        case 'B'
            f1 = 770;
            f2 = 1633;    
        case 'C'
            f1 = 852;
            f2 = 1633;            
        case 'D'
            f1 = 941;
            f2 = 1633;            
    end
    
    signal = sin(2*pi*f1*t) + sin(2*pi*f2*t);
    X = [X signal zeros(1,0.1*8000)];
    
end
X = X(1:end-800);
handles.vectorX = X;
x = 1/handles.fs:1/handles.fs:length(handles.vectorX)/handles.fs;
plot(x,handles.vectorX,'Parent',handles.axes1)
xlim(handles.axes1,[1/handles.fs 1000/handles.fs])

%slide bar initialization
set(handles.slider1,'Max',(length(handles.vectorX)-1000)/handles.fs,'Min',0,'Value',0);



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DTMF_Signal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DTMF_Signal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_Close.
function button_Close_Callback(hObject, eventdata, handles)
% hObject    handle to button_Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in button_Play.
function button_Play_Callback(hObject, eventdata, handles)
% hObject    handle to button_Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
soundsc(handles.vectorX);
guidata(hObject, handles);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
xlim(handles.axes1,[get(hObject,'Value') get(hObject,'Value')+1000/handles.fs]);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
