function [correlacao_struct] = correlacao_teste(imagefiles,ii,precisao)

    correlacao_struct=struct('img_file_name',{""},'Diagonal', 0 ,'Vertical',0,'Horizontal',0);
    
       currentfilename = imagefiles(ii).name;
       currentfilename=currentfilename(1:end-5);
       currentfig   =  imread(sprintf('../../imagens/%s.tiff',currentfilename));
       [width height]=size(currentfig);
   if precisao==32
   currentmod   = uint8(abs(load((sprintf('../../mod/%s.fsmod',currentfilename)))));
   elseif precisao ==64
   currentmod   = uint8(abs(load((sprintf('../../mod/%s.fdmod',currentfilename)))));
   end    
       vert=zeros(1,length(currentmod));
       horz=zeros(1,length(currentmod));
       diag=zeros(1,length(currentmod));
       
    fin=0;
    j=0;
    while(fin==0)
        f=currentmod(1+j: j+width*height);          
        g=f';
        h=vec2mat(g,height);
        cryptImage=bitxor(currentfig,h,'uint8');
        j=j+1;


        if (j+width*height==length(currentmod))
            fin=1;
        end

        I = im2double(cryptImage);
        c_diag = corrcoef(I(1:end-1, 1:end-1), I(2:end, 2:end));
        c_vert = corrcoef(I(1:end-1, :), I(2:end, :));
        c_horz = corrcoef(I(:, 1:end-1), I(:, 2:end));

        vert(j)=c_vert(1,2);
        horz(j)=c_horz(1,2);
        diag(j)=c_diag(1,2);

    end
    
        Mvert1 = movmean(vert,1000);
        Mhorz1 = movmean(horz,1000);
        Mdiag1 = movmean(diag,1000);        

        correlacao_struct.image_file_name       = currentfilename;
        correlacao_struct.Diagonal        = mean(Mdiag1(10000:24000));
        correlacao_struct.Vertical        = mean(Mvert1(10000:24000));
        correlacao_struct.Horizontal      = mean(Mhorz1(10000:24000));

        c_diag = corrcoef(currentfig(1:end-1, 1:end-1), currentfig(2:end, 2:end));
        c_vert = corrcoef(currentfig(1:end-1, :), currentfig(2:end, :));
        c_horz = corrcoef(currentfig(:, 1:end-1), I(:, 2:end));


        correlacao_struct.od   =  c_diag(1,2);
        correlacao_struct.ov   =  c_vert(1,2);
        correlacao_struct.oh   =  c_horz(1,2);





        correlacao_struct.size            = sprintf("%dx%d",width,height);
        correlacao_struct.px              = width*height;
end
