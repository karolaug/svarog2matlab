%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license


data = sv_data(file_name);
info = sv_info(file_name);

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('data', data, 'dataformat', 'array', 'srate', info.sf);
%chanlocs = struct('labels', { 'cz' 'c3' 'c4' 'pz' 'p3' 'p4' 'fz' 'f3' 'f4'}); >> pop_chanedit( chanlocs );
EEG.chanlocs = pop_chanedit('labels', info.channels);
[ALLEEG EEG CURRENTSET ] = eeg_store(ALLEEG, EEG);
eeglab redraw
