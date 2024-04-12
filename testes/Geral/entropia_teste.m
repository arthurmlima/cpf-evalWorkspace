function [entropia_struct] = entropia_teste(imagefiles,ii,precisao)

entropia_struct=struct('img_file_name',{''},'Average',0);

   currentfilename = imagefiles(ii).name;
   currentfilename=currentfilename(1:end-5);
   currentfig   =  imread(sprintf('../../imagens/%s.tiff',currentfilename));
   [width height]=size(currentfig);
   if precisao==32
   currentmod   = uint8(abs(load((sprintf('../../mod/%s.fsmod',currentfilename)))));
   elseif precisao ==64
   currentmod   = uint8(abs(load((sprintf('../../mod/%s.fdmod',currentfilename)))));
   end

    entrop=zeros(1,length(currentmod));
   fin=0;
   j=0;
while(fin==0)
    f=currentmod(1+j: j+width*height);          
    g=f';
    h=vec2mat(g,height);
    cryptImage=bitxor(currentfig,h,'uint8');

    entropia=entropy(cryptImage);

    j=j+1;
    if (j+width*height==length(currentmod))
        fin=1;
    end
    entrop(j)=entropia;
   
end

    filtered_entropia = movmean(entrop,1000);
    
    entropia_struct.image_file_name= string(currentfilename);
    entropia_struct.Average        = mean(filtered_entropia(8000:24000));
    entropia_struct.size= sprintf("%dx%d",width,height);
    entropia_struct.px= width*height;
    entropia_struct.original =entropy(currentfig);

    img_entrp(cryptImage);

end
