%% Some convenience functions
%send = @(t,msg) fwrite(t, [sprintf('%6d',length(msg)) msg], 'uint8');
%recv = @(t) char(fread(t, str2double(char(fread(t,6,'uint8')')), 'uint8')');

recv = @(t) str2double( {1})';
clc;
clear;
%% creating the client and opening connection
t = tcpip('127.0.0.1', 8080);
fopen(t);

data = [0 0 0];
while 1
    %% send data
    fwrite(t, 'data');

    while t.BytesAvailable <= 0
        pause(1);
    end
    %% receive data
    rs = textscan(char(fread(t, t.BytesAvailable)'), '%s', 'Delimiter', ',', 'CollectOutput', true);
    rs = str2double(rs{1})';
    data = [data;rs];
end

















































%% send data
%send(t, 'hello');

%% receive data
%m = recv(t);

% while 1
%     %% send data
%     send(t, 'data');
%     
%     %% receive data
%     m = recv(t);
%     
%     %% display data
%     fprintf('[SERVER]: %s\n', m);    
% end