function varargout = Channel_Encoder(varargin)
% CHANNEL_ENCODER MATLAB code for Channel_Encoder.fig
%      CHANNEL_ENCODER, by itself, creates a new CHANNEL_ENCODER or raises the existing
%      singleton*.
%
%      H = CHANNEL_ENCODER returns the handle to a new CHANNEL_ENCODER or the handle to
%      the existing singleton*.
%
%      CHANNEL_ENCODER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANNEL_ENCODER.M with the given input arguments.
%
%      CHANNEL_ENCODER('Property','Value',...) creates a new CHANNEL_ENCODER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Channel_Encoder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Channel_Encoder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Channel_Encoder

% Last Modified by GUIDE v2.5 23-Dec-2016 12:54:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Channel_Encoder_OpeningFcn, ...
                   'gui_OutputFcn',  @Channel_Encoder_OutputFcn, ...
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


% --- Executes just before Channel_Encoder is made visible.
function Channel_Encoder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Channel_Encoder (see VARARGIN)

% Choose default command line output for Channel_Encoder
handles.output = hObject;
axes(handles.axes);
imshow('convolutional_code.jpg');
handles.sequence = strjoin(varargin(1));
handles.sequence_coded = zeros(1,10*3*length(strjoin(varargin(1))));
handles.sequence_clear = zeros(1,10*length(strjoin(varargin(1))));
handles.vector_trellis = zeros(1,9);
handles.vector = [];

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Channel_Encoder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Channel_Encoder_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Transmit_button.
function Transmit_button_Callback(hObject, eventdata, handles)
% hObject    handle to Transmit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Channel(handles.sequence_coded,handles.sequence_clear,handles.vector);
%We also send the uncoded sequence in order to compute the BER
guidata(hObject, handles);

% --- Executes on button press in Codify_button.
function Codify_button_Callback(hObject, eventdata, handles)
% hObject    handle to Codify_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vector = [4*handles.vector_trellis(1)+2*handles.vector_trellis(2)+handles.vector_trellis(3),...
          4*handles.vector_trellis(4)+2*handles.vector_trellis(5)+handles.vector_trellis(6),...
          4*handles.vector_trellis(7)+2*handles.vector_trellis(8)+handles.vector_trellis(9)];
trellis = poly2trellis(3,vector);
        
for i = 1:1:length(handles.sequence)
    
    [y, x] =  Channel_coder(handles.sequence(i),trellis);
    handles.sequence_coded(30*(i-1)+1 : 30*i) = y;
    handles.sequence_clear(10*(i-1)+1 : 10*i) = x;
    %we generate the full sequence of packages, each package has a 30-bit length.
    
end
handles.vector = vector;
set(handles.Transmit_button,'Enable','on');
guidata(hObject, handles);


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
handles.vector_trellis(1) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
handles.vector_trellis(2) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
handles.vector_trellis(3) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
handles.vector_trellis(4) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
handles.vector_trellis(5) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
handles.vector_trellis(6) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);

% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
handles.vector_trellis(7) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);

% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
handles.vector_trellis(8) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);

% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
handles.vector_trellis(9) = get(hObject,'Value');
guidata(hObject, handles);
if((handles.vector_trellis(1)+handles.vector_trellis(4)+handles.vector_trellis(7)) == 0 || ...
   (handles.vector_trellis(2)+handles.vector_trellis(5)+handles.vector_trellis(8)) == 0 || ...
   (handles.vector_trellis(3)+handles.vector_trellis(6)+handles.vector_trellis(9)) == 0)
    set(handles.Codify_button,'Enable','off'); 
else
    set(handles.Codify_button,'Enable','on'); 
end
guidata(hObject,handles);
