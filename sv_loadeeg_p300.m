%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license

%Loads eeglab with data from sv_data matrix and sv_info variable, supports channel location. Takes filename without extension as argument.
function sv_loadeeg_p300(file_name, chan, tre);
    if nargin == 2,
	tre = 0.02;
    end
    [info, data] = sv_loaddata(file_name);
    data = sv_sig2trigg_kus(info, data, chan, tre);
    sv_loadeeg(info, data);