%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license



%Function analizes data for SSVEP experiment paradigm, where diode was also plugged in to the amplifier channel.
function data = sv_sig2trigg_ssvep_kus(info, data, chan, file_name, tre, tre2);
    if nargin == 4,
	tre = 0.02;
	tre2 = 5.5;
    end
    if nargin == 5,
	tre2 = 5.5;
    end
    freq = sv_loadfreq(file_name);
    data = sv_sig2trigg_kus(info, data, chan, tre);
    q = find(data(chan,:)>0);
    z = 0;
    for i=1:max(size(data(chan,:)));
	if data(chan,i) > 0,
	    z = z + 1;
	    data(chan,i) = freq(z);
	    data(chan,i+1:i+1+(tre2*info.fs)) = 0;
	end
    end
