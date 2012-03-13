%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license



function data = sig2trigg_kus(data, chan, tre)
  if nargin == 2,
  tre = 20;
end;
  q = find(data(chan,1:end-1)-data(chan,2:end)>(max(data(chan,1:end))-min(data(chan,1:end)))/4);
  u = find(q(2:end) - q(1:end-1)<tre);
  q(u) = [];
  data(chan,1:end) = 0;
  data(chan,q) = 1;
