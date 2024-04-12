function [histograma_struct] = histograma_teste(imagefiles,ii,precisao)

    histograma_struct=struct('img_file_name',{""},'var',0,'md',0,'id',0,'duh',0);
    
    currentfilename = imagefiles(ii).name;
    currentfilename=currentfilename(1:end-5);
    currentfig   =  imread(sprintf('../../imagens/%s.tiff',currentfilename));
    [width height]=size(currentfig);
    
    if precisao==32
        currentmod   = uint8(abs(load((sprintf('../../mod/%s.fsmod',currentfilename)))));
    elseif precisao ==64
        currentmod   = uint8(abs(load((sprintf('../../mod/%s.fdmod',currentfilename)))));
    end

    MaxDev       =      zeros(length(currentmod),1);
    IrreDev      =      zeros(length(currentmod),1);
    DUH          =      zeros(length(currentmod),1);
    cv           =      zeros(length(currentmod),1);

for i=1:length(currentmod) 
    if isnan(currentmod(i,1))==true
      currentmod(i,1)=1;          
    end
end 

j=1;

while(j<=24000)
    
    
f=currentmod(1+j: j+height*width);          
g=f';
h=vec2mat(g,width);
C_Image=bitxor(currentfig,h,'uint8');

[MaxDev(j),     IrreDev(j),     DUH(j)] = desvios(currentfig,C_Image);

[ca32 xa]=imhist(C_Image);
cv(j,1)=var(ca32);



j=j+1;
end

icv = movmean(cv,300);
iMaxDev = movmean(MaxDev,300);
iIrreDev = movmean(IrreDev,300);
iDUH = movmean(DUH,300);

histograma_struct.img_file_name = currentfilename;
histograma_struct.size= sprintf("%dx%d",width,height);
histograma_struct.var = mean(icv(10000:23000-1));
histograma_struct.md=   mean(iMaxDev(10000:23000-1));
histograma_struct.id=   mean(iIrreDev(10000:23000-1));
histograma_struct.duh=  mean(iDUH(10000:23000-1));
histograma_struct.px =  width*height;

end

