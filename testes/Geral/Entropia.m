clear all
close all
clc
direc  =  '../../imagens/*.tiff';
imagefiles = dir(direc);      
nfiles = length(imagefiles);    % Number of files foun

for ii=1:5%nfiles

    data_entr32(ii)=entropia_teste(imagefiles,ii,32);
    data_entr64(ii)=entropia_teste(imagefiles,ii,64);
    
    fprintf('Entropia %s %.6f %.6f %.6f \n',imagefiles(ii).name,data_entr32(ii).original,data_entr32(ii).Average,data_entr64(ii).Average)
    
end

   
data_Nentr32=cell2struct(struct2cell(data_entr32),{'N','Entropy32','Name','Size','Px','Original'},1)
data_Nentr64=cell2struct(struct2cell(data_entr64),{'n','Entropy64','name','size','px','original'},1)

aa_t = struct2table( data_Nentr32 );
bb_t = struct2table( data_Nentr64 );

merge_t = [ aa_t ,bb_t ];
merge_t = sortrows(merge_t, 'Px'); 

Data_Entropy = table2struct( merge_t );



Data_Entropy = rmfield(Data_Entropy,'N');
Data_Entropy = rmfield(Data_Entropy,'n');
Data_Entropy = rmfield(Data_Entropy,'name');
Data_Entropy = rmfield(Data_Entropy,'size');
Data_Entropy = rmfield(Data_Entropy,'Px');
Data_Entropy = rmfield(Data_Entropy,'px');
Data_Entropy = rmfield(Data_Entropy,'original');


Data_Entropy = orderfields(Data_Entropy,{'Name','Size','Original','Entropy32','Entropy64'})
writetable(struct2table(Data_Entropy),'../../tab/Entropia.xlsx');
save entropia_resultados.mat;
