function [dane, info] = ImportSvarog(nazwa)
    fit = fopen([nazwa '.xml'],'rb');
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
    fit = fopen([nazwa '.raw'], 'rb');
    dane = fread(fit, 'double');
    fclose(fit);
    dane = reshape(dane, [info.numchans,info.samplecount]);



