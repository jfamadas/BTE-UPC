function varargout = Channel_Decoder(varargin)
% CHANNEL_DECODER MATLAB code for Channel_Decoder.fig
%      CHANNEL_DECODER, by itself, creates a new CHANNEL_DECODER or raises the existing
%      singleton*.
%
%      H = CHANNEL_DECODER returns the handle to a new CHANNEL_DECODER or the handle to
%      the existing singleton*.
%
%      CHANNEL_DECODER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANNEL_DECODER.M with the given input arguments.
%
%      CHANNEL_DECODER('Property','Value',...) creates a new CHANNEL_DECODER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Channel_Decoder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Channel_Decoder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Channel_Decoder

% Last Modified by GUIDE v2.5 21-Dec-2016 18:56:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Channel_Decoder_OpeningFcn, ...
                   'gui_OutputFcn',  @Channel_Decoder_OutputFcn, ...
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


% --- Executes just before Channel_Decoder is made visible.
function Channel_Decoder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Channel_Decoder (see VARARGIN)

% Choose default command line output for Channel_Decoder
handles.output = hObject;
handles.decision = '';

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Channel_Decoder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Channel_Decoder_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popup.
function popup_Callback(hObject, eventdata, handles)
% hObject    handle to popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
choice = contents(get(hObject,'Value'));

if(strcmp(choice,'-------'))
    % Haura de desactivar la opció de decodificar
elseif(strcmp(choice,'Hard'))
    handles.decision = 'hard';
    %Haura de activar la opció de decodificar
elseif(strcmp(choice,'Soft'))
     handles.decision = 'unquant';
    %Haura de activar la opció de decodificar
end
guidata(hObject, handles);


% Hints: contents = cellstr(get(hObject,'String')) returns popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup


% --- Executes during object creation, after setting all properties.
function popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup (see GCBO)
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
