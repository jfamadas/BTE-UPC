function varargout = Channel(varargin)
% CHANNEL MATLAB code for Channel.fig
%      CHANNEL, by itself, creates a new CHANNEL or raises the existing
%      singleton*.
%
%      H = CHANNEL returns the handle to a new CHANNEL or the handle to
%      the existing singleton*.
%
%      CHANNEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANNEL.M with the given input arguments.
%
%      CHANNEL('Property','Value',...) creates a new CHANNEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Channel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Channel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Channel

% Last Modified by GUIDE v2.5 23-Dec-2016 15:39:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Channel_OpeningFcn, ...
                   'gui_OutputFcn',  @Channel_OutputFcn, ...
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


% --- Executes just before Channel is made visible.
function Channel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Channel (see VARARGIN)

% Choose default command line output for Channel
handles.output = hObject;
handles.sequence_correct = cell2mat(varargin(2));
handles.sequence_received = cell2mat(varargin(1));
handles.vector = cell2mat(varargin(3));
handles.snr = 0;
handles.decision='';
handles.text_received = repmat(' ',1,length(cell2mat(varargin(1))));
handles.package_lost = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Channel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Channel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_Start_transmission.
function button_Start_transmission_Callback(hObject, eventdata, handles)
% hObject    handle to button_Start_transmission (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bitSend = 0;
bitError = 0;
handles.package_lost = 0;

for i = 1:1:length(handles.sequence_received)/30
    
    %package = Channel_coder(handles.text_send(i));
    %we generate the package, each package has an 8-bit length.
    y = handles.sequence_received(30*(i-1)+1 : 30*i);
    ACK = false;
    while(ACK==false)
        
        z = awgn(1-2*y,handles.snr); %I transmit 1 for the 0 and -1 for the 1.
        if(strcmp(handles.decision,'hard'))
            z = z < 0;
        end
        trellis = poly2trellis(3,handles.vector);
        x_decod = vitdec(z,trellis,10,'term',handles.decision);
        [numErrors, ber] = biterr(x_decod,handles.sequence_correct(10*(i-1)+1:10*i));
        ACK = (numErrors == 0);
             
        %We transmit it through a AWGN channel
        handles.package_lost = handles.package_lost + ~ACK ;
        guidata(hObject, handles);
        bitSend = bitSend +10;
        bitError = bitError + numErrors;
        set(handles.text_package_lost,'String',['Package lost = ' num2str(handles.package_lost)])
        set(handles.text_ber,'String',['BER = ' num2str(bitError/bitSend)])
        %If ACK == 0 it means that the package has been lost and we
        %transmit it again.
        
    end
    
handles.text_received(i) = char(bi2de(flip(x_decod(1:8))));
set(handles.text_state,'String',['Transmiting...    ' num2str(i/(length(handles.sequence_received)/30)*100) '%']);
guidata(hObject, handles);

pause(1e-3); %THIS IS PROVISIONAL, JUST TO SEE THE TEXT CHANGING WITH SHORT EXAMPLES OF .TXT

end
set(handles.text_state,'String','Transmission finished');
set(handles.Decrypt_button,'Enable','on');
guidata(hObject, handles);




function channel_snr_Callback(hObject, eventdata, handles)
% hObject    handle to channel_snr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channel_snr as text
%        str2double(get(hObject,'String')) returns contents of channel_snr as a double
handles.snr = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function channel_snr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channel_snr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup.
function popup_Callback(hObject, eventdata, handles)
% hObject    handle to popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
choice = contents(get(hObject,'Value'));

if(strcmp(choice,'-------'))
    set(handles.button_Start_transmission,'Enable','off');
elseif(strcmp(choice,'Hard'))
    handles.decision = 'hard';
    set(handles.button_Start_transmission,'Enable','on');
elseif(strcmp(choice,'Soft'))
    handles.decision = 'unquant';
    set(handles.button_Start_transmission,'Enable','on');
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


% --- Executes on button press in Decrypt_button.
function Decrypt_button_Callback(hObject, eventdata, handles)
% hObject    handle to Decrypt_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Decoder(handles.text_received);


% --- Executes on button press in button_Demo.
function button_Demo_Callback(hObject, eventdata, handles)
% hObject    handle to button_Demo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

snr = -5:0.5:15;
%UNCODED
ber_unc = zeros(1,length(snr));
for i = 1:length(snr)
   x = awgn(1-2*handles.sequence_correct,snr(i));
   x = x < 0;
   [err,~] = biterr(x,handles.sequence_correct);
   ber_unc(i) = err/length(x);
end

%HARD DECODING
ber_hard = zeros(1,length(snr));
for j = 1:length(snr)
    bitSend = 0;
    bitError = 0;
    for i = 1:1:length(handles.sequence_received)/30
    
        y = handles.sequence_received(30*(i-1)+1 : 30*i);
        z = awgn(1-2*y,snr(j)); %I transmit 1 for the 0 and -1 for the 1.
        z = z < 0;
        trellis = poly2trellis(3,handles.vector);
        x_decod = vitdec(z,trellis,10,'term','hard');
        [numErrors, ~] = biterr(x_decod,handles.sequence_correct(10*(i-1)+1:10*i));   
        bitSend = bitSend +10;
        bitError = bitError + numErrors;
    end
    ber_hard(j) = bitError/bitSend;
end

%SOFT DECODING
ber_soft = zeros(1,length(snr));
for j = 1:length(snr)
    bitSend = 0;
    bitError = 0;
    for i = 1:1:length(handles.sequence_received)/30
    
        y = handles.sequence_received(30*(i-1)+1 : 30*i);
        z = awgn(1-2*y,snr(j)); %I transmit 1 for the 0 and -1 for the 1.
        trellis = poly2trellis(3,handles.vector);
        x_decod = vitdec(z,trellis,10,'term','unquant');
        [numErrors, ~] = biterr(x_decod,handles.sequence_correct(10*(i-1)+1:10*i));   
        bitSend = bitSend +10;
        bitError = bitError + numErrors;
    end
    ber_soft(j) = bitError/bitSend;
end

x1 = 10*log10(ber_unc);
x2 = 10*log10(ber_hard);
x3 = 10*log10(ber_soft);
figure(10)
plot(snr,max(x1,-35),'b');
hold on
plot(snr,max(x2,-35),'r');
plot(snr,max(x3,-35),'g');
legend('Uncoded', 'Hard Decision', 'Soft Decision');
xlabel('SNR (dB)');
ylabel('BER (dB)');
hold off