%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license

%Functions takes data matrix and number of boolean trigger channel and returns the same data matrix witch modified trigger channel. It assumes, that trigger takes values (0,1) and changes every instance for Dirac's delta localized in the first sample of each instance.
function data = sv_sig2trigg_bool(data, chan)
    q = find(data(chan,1:end-1)-data(chan,2:end)==-1);
    data(chan,:) = 0;
    data(chan,q) = 1;
