function varargout = Encoder(varargin)
% ENCODER MATLAB code for Encoder.fig
%      ENCODER, by itself, creates a new ENCODER or raises the existing
%      singleton*.
%
%      H = ENCODER returns the handle to a new ENCODER or the handle to
%      the existing singleton*.
%
%      ENCODER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENCODER.M with the given input arguments.
%
%      ENCODER('Property','Value',...) creates a new ENCODER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Encoder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Encoder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Encoder

% Last Modified by GUIDE v2.5 08-Dec-2016 19:57:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Encoder_OpeningFcn, ...
                   'gui_OutputFcn',  @Encoder_OutputFcn, ...
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


% --- Executes just before Encoder is made visible.
function Encoder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Encoder (see VARARGIN)

% Choose default command line output for Encoder
handles.output = hObject;
handles.text_clear = '';
handles.text_coded = '';
handles.key = 'DEFAULT KEY';

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Encoder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Encoder_OutputFcn(hObject, eventdata, handles) 
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
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on button press in button_Channel_code.
function button_Channel_code_Callback(hObject, eventdata, handles)
% hObject    handle to button_Channel_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Channel_Encoder(handles.text_coded);



function message_Callback(hObject, eventdata, handles)
% hObject    handle to message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.text_clear = get(hObject,'String');
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of message as text
%        str2double(get(hObject,'String')) returns contents of message as a double


% --- Executes during object creation, after setting all properties.
function message_CreateFcn(hObject, eventdata, handles)
% hObject    handle to message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_Browse.
function button_Browse_Callback(hObject, eventdata, handles)
% hObject    handle to button_Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.txt'},'File Selector'); 
%opens a browser tab to select a .txt file and saves its name and pathname.
handles.text_clear = fileread(strcat(pathname,filename)); 
%loads the browsed file
set(handles.message,'String',handles.text_clear);
guidata(hObject, handles);


% --- Executes on button press in button_Encrypt.
function button_Encrypt_Callback(hObject, eventdata, handles)
% hObject    handle to button_Encrypt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.text_coded = Vignere_encipherment(handles.text_clear,handles.key);
set(handles.cryptogram,'String',handles.text_coded);
set(handles.button_Channel_code,'Enable','on');
guidata(hObject, handles);
