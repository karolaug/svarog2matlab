%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin <karol@augustin.pl>
%License can be found in license

%Returns info variable and data matrix. Takes filename without extension as argument.
function [info, data] = sv_loaddata(file_name);
    info = sv_info(file_name);
    data = sv_data(file_name, info);



