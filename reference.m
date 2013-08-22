%%%%%HERE WE GO!

[y,Fs] = wavread('/Users/apple/Music/ttd.wav');  %change to your own directory %must be wav file ??? ???????????????????  ???wav????

% y=wave

% Fs=sampling rate

yleft=y(:,1);   %?????? ???????? ???????????

yright=y(:,2);

 

 

 

m=748*12; %interval length  % ~ 0.1 second  %????????????????? ??????m????????

L=length(yleft); %song length

amp=1.25; %pitch amplificiation  %?????????????????? ????1.25?? ??????

 

%%%%%%%%%%%%%change left channel %????????

y1=yleft;

y1f=y1;

 

%%%%%%%%%%%

% TEMP=zeros(m,1);

% TEMP2=TEMP;

%%%%

x=0;

while x+m<L

    up=x+m;

    temp=y1(x+1:up);  %%%%

    TEMP=dst(temp);%discrete sin transform   %%%%%????sin?? ???????????

    TEMP2=zeros(m,1); %to be amplified

    for i = 1: round(length(TEMP)/amp)

        if round(amp*i)>m

            k=m;

        else

            k=round(amp*i);

        end

        TEMP2(k)=TEMP(i);

    end

    temp=idst(TEMP2);%inverse transform    %%%%

    y1f(x+1:up)=temp;

    

    

    x=round(up-m/2); %update   -m/2 to make it more continuous

end

yleftmod=y1f;

%sound(y1f,Fs)

 

 

 

%%%%%%%%%%%%%change right channel---all same ?????????

y1=yright;

y1f=y1;

 

%%%%%%%%%%%

% TEMP=zeros(m,1);

% TEMP2=TEMP;

%%%%

x=0;

while x+m<L

    up=x+m;

    temp=y1(x+1:up);  %%%%

    TEMP=dst(temp);%discrete sin transform   %%%%%

    TEMP2=zeros(m,1); %to be amplified

    for i = 1: round(length(TEMP)/amp)

        if round(amp*i)>m

            k=m;

        else

            k=round(amp*i);

        end

        TEMP2(k)=TEMP(i);

    end

    temp=idst(TEMP2);%inverse transform    %%%%

    y1f(x+1:up)=temp;

    

    

    x=round(up-m/2); %update   -m/2 to make it more continuous

end

yrightmod=y1f;

%sound(y1f,Fs)

 

ymod=[yleftmod,yrightmod]; %?????

wavwrite(ymod,Fs,'tiantiande.wav'); %save to file %?????????????????????????



