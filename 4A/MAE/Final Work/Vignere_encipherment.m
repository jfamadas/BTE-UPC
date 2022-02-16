function [ cryptogram ] = Vignere_encipherment( message, key )
%Vignere_encipherment    Cryptography using Vigenère algorithm.
%
%Vignere_enchiperment(message, key) encrypts the string message with the
%   Vignère algorithm using key. It returns the resulting cryptogram.

if (length(key)>length(message)) 
    key = key(1:length(message));
end
str = message;
if (mod(length(message),length(key))~=0)
    str = [message, char(95*ones(1,length(key)-mod(length(message),length(key))))];
    %I use the 95 value which in the ASCII table corresponds to '_' because the
    %space caused me some problems with the key
end
K = repmat(key,1,length(str)/length(key));

cryptogram = char(mod(str + K,256));
end

