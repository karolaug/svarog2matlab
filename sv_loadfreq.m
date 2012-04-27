%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license


%Function returns list of frequencies saved in text file. It was intended to use with SSVEP paradigm experiment analysis. As it's rather straightforward it's not longer required and it's kept here for revers compatibility reasons.
function freq = sv_loadfreq(file_name);
    freq = importdata([file_name '.txt']);
