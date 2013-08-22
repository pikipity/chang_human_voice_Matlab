function data_after_filter = Filter_cheby1( data, fp, fs, rp, rs, f, filter_type, varargin )
% a filter using chebyshev Type 1 filter order
%
% data_after_filter = Filter_cheby1( data, fp, fs, rp, rs, f, filter_type, varargin )
%
% Inputs:
%   (1) data: an array that will be pass the filter. The length or
%   the number of rows must be one.
%   (2) fp: pass band frequency (Hz). 
%   (3) fs: stop band frequency (Hz). 
%   (4) rp: In the passband, the filter will loses no more than rp dB.
%   (5) rs: In the stopband, the filter has at least rs dB of attenuation.
%   (6) f: sample frequency
%   (7) filter_type: 'low', 'high', 'bandpass' or 'bandstop'
%   (8) 'plot': variable input. If there is the 'plot' string, the frequency responce of the data, the filter
%   performance and the frequency responce of the data after the filter will be shown.
%
% Output:
%   (1) data_after_filter: the data after the filter

    if nargin<7
        error('The number of inputs cannot be lease than 6');
    end
    if nargin==7
        willplot=0;
    end
    if nargin==8
        if strcmp(varargin,'plot')
            willplot=1;
        else
            error('The variable input must be ''plot''.');
        end
    end
    if nargin>8
        error('The number of inputs must be lease than 7');
    end
    
    if strcmpi(filter_type,'high') && strcmpi(filter_type,'low') && strcmpi(filter_type,'bandpass') && strcmpi(filter_type,'bandstop')
        error('filter type must be ''high'', ''low'', ''bandpass'' or ''bandstop''.');
    end
    
    if strcmp(filter_type,'bandstop')
        filter_type='stop';
    end
    
    size_data=size(data);
    if size_data(1)~=1 && size_data(2)~=1
        error('The size of data is wrong');
    end
    
    wp=fp/(f/2);
    ws=fs/(f/2);
    [n,wp]=cheb1ord(wp,ws,rp,rs);
    [b,a]=cheby1(n,rp,wp,filter_type);
    data_after_filter=filter(b,a,data);
    if willplot==1
        fft_plot(data,f,'plot');
        title('frequency responce before passing through the filter');
        figure;freqz(b,a,512,f);
        title('frequency responce of the filter');
        fft_plot(data_after_filter,f,'plot');
        title('frequency responce after passing through the filter');
    end
end

