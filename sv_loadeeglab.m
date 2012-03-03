%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license

function sv_loadeeglab(file_name)
    [info, data] = sv_loaddata(file_name)

    global ALLEEG EEG CURRENTSET ALLCOM
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    global EEG
    EEG = pop_importdata('data', data, 'dataformat', 'array', 'srate', info.fs);
    chanlocs = struct('labels', info.channames);
    EEG.chanlocs = pop_chanedit(chanlocs);
    [ALLEEG EEG CURRENTSET ] = eeg_store(ALLEEG, EEG);
    eeglab redraw;
