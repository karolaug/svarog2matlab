%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license

%Returns two-dimensional data matrix of size (number-of-channels, number-of-samples). Takes filename without extension and info variable from sv_info output as arguments.
function data = sv_data(file_name, info);
    fit = fopen([file_name '.raw'], 'rb');
    data = fread(fit, 'double');
    fclose(fit);
    data = reshape(data, [info.numchans,info.samplecount]);
    data = bsxfun(@times, data, info.gain);
    data = bsxfun(@plus, data, info.offset);


