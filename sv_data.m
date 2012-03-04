%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license



function data = sv_data(file_name, info);
    fit = fopen([file_name '.raw'], 'rb');
    data = fread(fit, 'double');
    fclose(fit);
    data = reshape(data, [info.numchans,info.samplecount]);
    %FIXME
    gain = zeros(info.numchans, info.samplecount);
    offset = zeros(info.numchans, info.samplecount);
    for i=1:info.numchans;
	gain(i,:) = info.gain(i);
	offset(i,:) = info.offset(i);
    end;
    data = (data.*gain) + offset;



