function [ message ] = Vignere_decipherment( cryptogram, key )
%Vignere_decipherment     Decrypts using Vigenère algorithm.
%
%Vignere_decipherment(cryptogram, key) decrypts the string cryptogram with the
%   Vignère algorithm using key. It returns the resulting clear message.

if (length(key)>length(cryptogram)) 
    key = key(1:length(cryptogram));
end
str = cryptogram;
if (mod(length(cryptogram),length(key))~=0)
    str = [cryptogram, char(95*ones(1,length(key)-mod(length(cryptogram),length(key))))];
    %I use the 95 value which in the ASCII table corresponds to '_' because the
    %space caused me some problems with the key
end
K = repmat(key,1,length(str)/length(key));

message = char(mod(str - K,256));
end

