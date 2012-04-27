%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license

%Function returns data prepared for analisys for SSVEP experiment paradigm, assuming that blinking diode was also plugged to the amplifier and frequencies of stimulation where put in the filename with txt extension in order they appeared in experiment.
function data2 = sv_ssvep_matrix(file_name, chan, time, tre, tre2);
    if nargin == 3,
	tre = 0.02;
	tre2 = 5.5;
    end
    if nargin == 4,
	tre2 = 5.5;
    end
    info = sv_info(file_name);
    data = sv_data(file_name, info);
    data = sv_sig2trigg_ssvep_kus(info, data, chan, file_name, tre, tre2);
    freq = sv_loadfreq(file_name);
    freq = unique(freq);
    for i=1:max(size(freq)),
	I = find(data(chan,:) == freq(i));
	for o=1:max(size(I)),
	    data2(i,o,:,:) = data(:,I(o)+time(1)*info.fs:I(o)+time(2)*info.fs);
	end
    end
