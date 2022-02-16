function varargout = DTMF_Keypad(varargin)
% DTMF_KEYPAD MATLAB code for DTMF_Keypad.fig
%      DTMF_KEYPAD, by itself, creates a new DTMF_KEYPAD or raises the existing
%      singleton*.
%
%      H = DTMF_KEYPAD returns the handle to a new DTMF_KEYPAD or the handle to
%      the existing singleton*.
%
%      DTMF_KEYPAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DTMF_KEYPAD.M with the given input arguments.
%
%      DTMF_KEYPAD('Property','Value',...) creates a new DTMF_KEYPAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DTMF_Keypad_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DTMF_Keypad_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DTMF_Keypad

% Last Modified by GUIDE v2.5 23-Nov-2016 18:35:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DTMF_Keypad_OpeningFcn, ...
                   'gui_OutputFcn',  @DTMF_Keypad_OutputFcn, ...
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


% --- Executes just before DTMF_Keypad is made visible.
function DTMF_Keypad_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DTMF_Keypad (see VARARGIN)

% Choose default command line output for DTMF_Keypad
handles.output = hObject;
handles.str = '';
handles.max_length = 20;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DTMF_Keypad wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DTMF_Keypad_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_1.
function button_1_Callback(hObject, eventdata, handles)
% hObject    handle to button_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '1'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);




% --- Executes on button press in button_A.
function button_A_Callback(hObject, eventdata, handles)
% hObject    handle to button_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str 'A'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_3.
function button_3_Callback(hObject, eventdata, handles)
% hObject    handle to button_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '3'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_2.
function button_2_Callback(hObject, eventdata, handles)
% hObject    handle to button_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '2'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_4.
function button_4_Callback(hObject, eventdata, handles)
% hObject    handle to button_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '4'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_B.
function button_B_Callback(hObject, eventdata, handles)
% hObject    handle to button_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str 'B'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_6.
function button_6_Callback(hObject, eventdata, handles)
% hObject    handle to button_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '6'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_5.
function button_5_Callback(hObject, eventdata, handles)
% hObject    handle to button_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '5'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_7.
function button_7_Callback(hObject, eventdata, handles)
% hObject    handle to button_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '7'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_C.
function button_C_Callback(hObject, eventdata, handles)
% hObject    handle to button_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str 'C'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_9.
function button_9_Callback(hObject, eventdata, handles)
% hObject    handle to button_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '9'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_8.
function button_8_Callback(hObject, eventdata, handles)
% hObject    handle to button_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '8'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_asterisc.
function button_asterisc_Callback(hObject, eventdata, handles)
% hObject    handle to button_asterisc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '*'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_D.
function button_D_Callback(hObject, eventdata, handles)
% hObject    handle to button_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str 'D'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_hashtag.
function button_hashtag_Callback(hObject, eventdata, handles)
% hObject    handle to button_hashtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '#'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_0.
function button_0_Callback(hObject, eventdata, handles)
% hObject    handle to button_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','on');
    set(handles.button_Send,'Enable','on');
end    
handles.str = [handles.str '0'];
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','off');
    set(handles.button_2,'Enable','off');
    set(handles.button_3,'Enable','off');
    set(handles.button_4,'Enable','off');
    set(handles.button_5,'Enable','off');
    set(handles.button_6,'Enable','off');
    set(handles.button_7,'Enable','off');
    set(handles.button_8,'Enable','off');
    set(handles.button_9,'Enable','off');
    set(handles.button_0,'Enable','off');
    set(handles.button_A,'Enable','off');
    set(handles.button_B,'Enable','off');
    set(handles.button_C,'Enable','off');
    set(handles.button_D,'Enable','off');
    set(handles.button_hashtag,'Enable','off');
    set(handles.button_asterisc,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_DEL.
function button_DEL_Callback(hObject, eventdata, handles)
% hObject    handle to button_DEL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','on');
    set(handles.button_2,'Enable','on');
    set(handles.button_3,'Enable','on');
    set(handles.button_4,'Enable','on');
    set(handles.button_5,'Enable','on');
    set(handles.button_6,'Enable','on');
    set(handles.button_7,'Enable','on');
    set(handles.button_8,'Enable','on');
    set(handles.button_9,'Enable','on');
    set(handles.button_0,'Enable','on');
    set(handles.button_A,'Enable','on');
    set(handles.button_B,'Enable','on');
    set(handles.button_C,'Enable','on');
    set(handles.button_D,'Enable','on');
    set(handles.button_hashtag,'Enable','on');
    set(handles.button_asterisc,'Enable','on');
end    
handles.str = handles.str(1:end-1);
set(handles.Display_str,'String',handles.str);
if(length(handles.str)==0)
    set(handles.button_DEL,'Enable','off');
    set(handles.button_Send,'Enable','off');
end
guidata(hObject,handles);

% --- Executes on button press in button_Send.
function button_Send_Callback(hObject, eventdata, handles)
% hObject    handle to button_Send (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DTMF_Signal(handles.str);
if(length(handles.str)==handles.max_length)
    set(handles.button_1,'Enable','on');
    set(handles.button_2,'Enable','on');
    set(handles.button_3,'Enable','on');
    set(handles.button_4,'Enable','on');
    set(handles.button_5,'Enable','on');
    set(handles.button_6,'Enable','on');
    set(handles.button_7,'Enable','on');
    set(handles.button_8,'Enable','on');
    set(handles.button_9,'Enable','on');
    set(handles.button_0,'Enable','on');
    set(handles.button_A,'Enable','on');
    set(handles.button_B,'Enable','on');
    set(handles.button_C,'Enable','on');
    set(handles.button_D,'Enable','on');
    set(handles.button_hashtag,'Enable','on');
    set(handles.button_asterisc,'Enable','on');
end   
handles.str = '';
set(handles.Display_str,'String',handles.str);
set(handles.button_DEL,'Enable','off');
set(handles.button_Send,'Enable','off');
guidata(hObject,handles);


% --- Executes on button press in button_Close.
function button_Close_Callback(hObject, eventdata, handles)
% hObject    handle to button_Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --- Executes on button press in button_Help.
function button_Help_Callback(hObject, eventdata, handles)
% hObject    handle to button_Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About_DTMF_Keypad()
