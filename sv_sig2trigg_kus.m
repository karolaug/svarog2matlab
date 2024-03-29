%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin <karol@augustin.pl>
%License can be found in license

%Function changes trigger chanel that has real values. It changes real values recorded by an ordinary amplifier channel to dirac's delta localized at the beginning of each trigger instance.
%Thre variable is the min time between two trigger instances in seconds. This parameter is optional and if not set, takes default value of 0.3 seconds.
function data = sv_sig2trigg_kus(info, data, chan, tre)
    if nargin == 3,
	tre = 0.3;
    end;
    q = find(data(chan,1:end-1)-data(chan,2:end)<(min(data(chan,1:end))-max(data(chan,1:end)))/4);
    u = find(q(2:end) - q(1:end-1)<tre*info.fs);
    q(u) = [];
    data(chan,1:end) = 0;
    data(chan,q) = 1;
