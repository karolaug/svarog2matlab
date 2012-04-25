%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license



function data = sv_sig2trigg_bool(data, chan)
    q = find(data(chan,1:end-1)-data(chan,2:end)==-1);
    data(chan,:) = 0;
    data(chan,q) = 1;
