%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license



function dane = sv_dane(file_name)
    info = sv_info(file_name);
    fit = fopen([file_name '.raw'], 'rb');
    dane = fread(fit, 'double');
    fclose(fit);
    dane = reshape(dane, [info.numchans,info.samplecount]);
