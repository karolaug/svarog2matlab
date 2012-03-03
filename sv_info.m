%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%Copyright © 2012 Karol Augustin
%License can be found in license




function info = sv_info(file_name)
    fit = fopen([file_name '.xml'],'rb');
    xml=fread(fit,'*char');
    xml = xml';
    fclose(fit);
    fs = regexp(xml, '<rs:samplingFrequency>(.*?)</rs:samplingFrequency>', 'tokens');
    info.fs = str2double(fs{1});
    info.channels = regexp(xml, '<rs:label>(.*?)</rs:label>', 'tokens');
    info.numchans = max(size(info.channels));
    samplecount = regexp(xml, '<rs:sampleCount>(.*?)</rs:sampleCount>', 'tokens');
    info.samplecount = str2double(samplecount{1});
    firstsampletimestamp = regexp(xml, '<rs:firstSampleTimestamp>(.*?)</rs:firstSampleTimestamp>', 'tokens');
    info.firstsampletimestamp = str2double(firstsampletimestamp{1});
    calibration = regexp(xml, '<rs:calibrationParam>(.*?)</rs:calibrationParam>', 'tokens');
    info.gain = calibration{1:info.numchans};
    info.offset = calibration{info.numchans+1:info.numchans*2};
