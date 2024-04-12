clear all
clc
direc       = '../../imagens/*.tiff';
imagefiles  = dir(direc);      
nfiles      = length(imagefiles);    % Number of files foun

for ii=1:nfiles

    data_hist32(ii)=histograma_teste(imagefiles,ii,32);
    data_hist64(ii)=histograma_teste(imagefiles,ii,64);

    save histograma_resultados.mat;
    disp(ii);
end

% histograma_struct=struct('img_file_name',{""},'var',0,'md',0,'id',0,'duh',0);
% 
% 
data_Nhist32=cell2struct(struct2cell(data_hist32),{'Name','var_32','md_32','id_32','duh_32','Size','Px'},1);
data_Nhist64=cell2struct(struct2cell(data_hist64),{'n','var_64','md_64','id_64','duh_64','size','px'},1);

aa_t = struct2table( data_Nhist32 );
bb_t = struct2table( data_Nhist64 );

merge_t = [ aa_t ,bb_t ];
merge_t = sortrows(merge_t, 'Px'); 

Data_Hist = table2struct( merge_t );
Data_Hist = rmfield(Data_Hist,'n');
Data_Hist = rmfield(Data_Hist,'size');
Data_Hist = rmfield(Data_Hist,'Px');
Data_Hist = rmfield(Data_Hist,'px');

Data_Hist = orderfields(Data_Hist,{'Name','Size','var_32','md_32','id_32','duh_32','var_64','md_64','id_64','duh_64'});
writetable(struct2table(Data_Hist),'../../tab/Histogramas.xlsx');
save histograma_resultados.mat;


