function varargout = About_DTMF_Keypad(varargin)
% ABOUT_DTMF_KEYPAD MATLAB code for About_DTMF_Keypad.fig
%      ABOUT_DTMF_KEYPAD, by itself, creates a new ABOUT_DTMF_KEYPAD or raises the existing
%      singleton*.
%
%      H = ABOUT_DTMF_KEYPAD returns the handle to a new ABOUT_DTMF_KEYPAD or the handle to
%      the existing singleton*.
%
%      ABOUT_DTMF_KEYPAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABOUT_DTMF_KEYPAD.M with the given input arguments.
%
%      ABOUT_DTMF_KEYPAD('Property','Value',...) creates a new ABOUT_DTMF_KEYPAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before About_DTMF_Keypad_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to About_DTMF_Keypad_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to about_dtmf_keypad About_DTMF_Keypad

% Last Modified by GUIDE v2.5 23-Nov-2016 18:36:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @About_DTMF_Keypad_OpeningFcn, ...
                   'gui_OutputFcn',  @About_DTMF_Keypad_OutputFcn, ...
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


% --- Executes just before About_DTMF_Keypad is made visible.
function About_DTMF_Keypad_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to About_DTMF_Keypad (see VARARGIN)

% Choose default command line output for About_DTMF_Keypad
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes About_DTMF_Keypad wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = About_DTMF_Keypad_OutputFcn(hObject, eventdata, handles) 
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
