
PRECISAO=32;

warning('off', 'MATLAB:MKDIR:DirectoryExists');
direc='../imagens/*.tiff';
imagefiles = dir(direc);      
nfiles = length(imagefiles);    % Number of files found
coitado=1;
if PRECISAO==32
   parte1 =      fileread('cabecalho32.txt');
elseif PRECISAO ==64
   parte1 =      fileread('cabecalho64.txt');

end   
if PRECISAO==32
   [fid,msg] = fopen('../code/cifradiff/32bits/chua/main.cpp','wt');
elseif PRECISAO ==64
   [fid,msg] = fopen('../code/cifradiff/64bits/chua/main.cpp','wt');
end 

fprintf(fid,'\n\n%s',parte1);
fprintf(fid,'\n\n');
fprintf(fid,'int main()\n{\n\n\n');
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(sprintf('../imagens/%s',currentfilename));
   assert(fid>=3,msg);
   stringname2=imagefiles(ii).name;
      sizeim=size(currentimage);
   loop=sizeim(1)*sizeim(2)+25000;
   
   mkdir(sprintf('../mods/%s',stringname2(1:end-5)));
        for iii = 1:100
          
            sskey(coitado)=getseedimag_diff(currentimage,1);

            stringname=imagefiles(ii).name;
                if PRECISAO==32
                    addre=sprintf('ccs(%.30ff,%d,"../../../../../mods/%s/%d.dfsmod");',sskey(coitado),loop,stringname(1:end-5),iii);
                elseif PRECISAO == 64
                    addre=sprintf('ccs(%.30f,%d,"../../../../../mods/%s/%d.dfdmod");',sskey(coitado),loop,stringname(1:end-5),iii);
                end 

        fprintf(fid,'\n');
fprintf(fid,addre);
            if iii==100
            fprintf(fid,'\n\n/*******************fim da %s*******************/\n\n',stringname(1:end-5));                
            end
            
            
            
        end



end

fprintf(fid,'\n }');
fclose(fid);



PRECISAO=64;


direc='../imagens/*.tiff';
imagefiles = dir(direc);      
nfiles = length(imagefiles);    % Number of files found
coitado=1;
if PRECISAO==32
   parte1 =      fileread('cabecalho.txt');
elseif PRECISAO ==64
   parte1 =      fileread('cabecalho64.txt');

end   
if PRECISAO==32
   [fid,msg] = fopen('../code/cifradiff/32bits/chua/main.cpp','wt');
elseif PRECISAO ==64
   [fid,msg] = fopen('../code/cifradiff/64bits/chua/main.cpp','wt');
end 

fprintf(fid,'\n\n%s',parte1);
fprintf(fid,'\n\n');
fprintf(fid,'int main()\n{\n\n\n');
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(sprintf('../imagens/%s',currentfilename));
   assert(fid>=3,msg);
   stringname2=imagefiles(ii).name;
      sizeim=size(currentimage);
   loop=sizeim(1)*sizeim(2)+25000;
   
   %mkdir(sprintf('./mods/%s',stringname2(1:end-5)));
        for iii = 1:100
          

            stringname=imagefiles(ii).name;
                if PRECISAO==32
                    addre=sprintf('ccs(%.30ff,%d,"../../../../../mods/%s/%d.dfsmod");',sskey(coitado),loop,stringname(1:end-5),iii);
                elseif PRECISAO == 64
                    addre=sprintf('ccs(%.30f,%d,"../../../../../mods/%s/%d.dfdmod");',sskey(coitado),loop,stringname(1:end-5),iii);
                end 

        fprintf(fid,'\n');
fprintf(fid,addre);
            if iii==100
            fprintf(fid,'\n\n/*******************fim da %s*******************/\n\n',stringname(1:end-5));                
            end
            
            
            
        end



end

fprintf(fid,'\n }');
fclose(fid);


