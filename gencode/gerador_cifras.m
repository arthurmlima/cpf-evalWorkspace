PRECISAO=32;
direc='../imagens/*.tiff';
imagefiles = dir(direc);      
nfiles = length(imagefiles);    % Number of files found
if PRECISAO==32
   parte1 =      fileread('cabecalho32.txt');
elseif PRECISAO ==64
   parte1 =      fileread('cabecalho64.txt');

end   
if PRECISAO==32
   [fid,msg] = fopen('../code/cifrachave/32bits/chua/main.cpp','wt');
elseif PRECISAO ==64
   [fid,msg] = fopen('../code/cifrachave/64bits/chua/main.cpp','wt');
end 

fprintf(fid,'\n\n%s',parte1);
fprintf(fid,'\n\n');
fprintf(fid,'int main(){\n');
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(sprintf('../imagens/%s',currentfilename));
   sizeim=size(currentimage);
   loop=sizeim(1)*sizeim(2)+25000;
   assert(fid>=3,msg);


stringname=imagefiles(ii).name;
if PRECISAO==32

   addre=sprintf('ccs(%.30ff,%d,"../../../../../mod/%s.fsmod");',getseedimag_diff(currentimage,0),loop,stringname(1:end-5));
elseif PRECISAO == 64
   addre=sprintf('ccs(%.30f,%d,"../../../../../mod/%s.fdmod");',getseedimag_diff(currentimage,0),loop,stringname(1:end-5));
end 
fprintf(fid,'\n');
fprintf(fid,addre);
end

fprintf(fid,'\n }');
fclose(fid);

PRECISAO=64;
direc='../imagens/*.tiff';
imagefiles = dir(direc);      
nfiles = length(imagefiles);    % Number of files found
if PRECISAO==32
   parte1 =      fileread('cabecalho.txt');
elseif PRECISAO ==64
   parte1 =      fileread('cabecalho64.txt');

end   
if PRECISAO==32
   [fid,msg] = fopen('../code/cifrachave/32bits/chua/main.cpp','wt');
elseif PRECISAO ==64
   [fid,msg] = fopen('../code/cifrachave/64bits/chua/main.cpp','wt');
end 

fprintf(fid,'\n\n%s',parte1);
fprintf(fid,'\n\n');
fprintf(fid,'int main(){\n');
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(sprintf('../imagens/%s',currentfilename));
   sizeim=size(currentimage);
   loop=sizeim(1)*sizeim(2)+25000;
   assert(fid>=3,msg);


stringname=imagefiles(ii).name;
if PRECISAO==32

   addre=sprintf('ccs(%.30ff,%d,"../../../../../mod/%s.fsmod");',getseedimag_diff(currentimage,0),loop,stringname(1:end-5));
elseif PRECISAO == 64
   addre=sprintf('ccs(%.30f,%d,"../../../../../mod/%s.fdmod");',getseedimag_diff(currentimage,0),loop,stringname(1:end-5));
end 
fprintf(fid,'\n');
fprintf(fid,addre);
end


fprintf(fid,'\n }');


fclose(fid);


