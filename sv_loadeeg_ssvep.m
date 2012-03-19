%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license

%Loads eeglab with data from sv_data matrix and sv_info variable, supports channel location. Takes filename without extension as argument.
function sv_loadeeg_ssvep(file_name, chan, tre, tre2);
    if nargin == 2,
	tre = 0.02;
	tre2 = 5.5;
    end
    if nargin == 3,
	tre2 = 5.5;
    end
    [info, data] = sv_loaddata(file_name);
    data = sv_sig2trigg_ssvep_kus(info, data, chan, file_name, tre, tre2);
    sv_loadeeg(info, data);
