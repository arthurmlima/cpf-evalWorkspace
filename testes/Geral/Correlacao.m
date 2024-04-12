clear all;
clc;
direc       = '../../imagens/*.tiff';
imagefiles  = dir(direc);      
nfiles      = length(imagefiles);    % Number of files foun

for ii=1:nfiles

    data_coef32(ii)=correlacao_teste(imagefiles,ii,32);
    data_coef64(ii)=correlacao_teste(imagefiles,ii,64);

    save correlacao_resultados.mat;
    fprintf('Corr 32 Bits %s %.4f %.4f %.4f \n',imagefiles(ii).name,data_coef32(ii).Diagonal,data_coef32(ii).Vertical,data_coef32(ii).Horizontal)
    fprintf('Corr 64 Bits %s %.4f %.4f %.4f \n\n\n',imagefiles(ii).name,data_coef64(ii).Diagonal,data_coef64(ii).Vertical,data_coef64(ii).Horizontal)

end

data_Ncoef32=cell2struct(struct2cell(data_coef32),{'N','Diag32','Vert32','Horz32','Od','Ov','Oh' ,'Name','Size','Px'},1);
data_Ncoef64=cell2struct(struct2cell(data_coef64),{'n','Diag64','Vert64','Horz64', 'od','ov','oh' ,'name','size','px'},1);

aa_t = struct2table( data_Ncoef32 );
bb_t = struct2table( data_Ncoef64 );

merge_t = [ aa_t ,bb_t ];
merge_t = sortrows(merge_t, 'Px'); % sort the table by 'DOB'

Data_Corr = table2struct( merge_t );
Data_Corr = rmfield(Data_Corr,'N');
Data_Corr = rmfield(Data_Corr,'n');
Data_Corr = rmfield(Data_Corr,'name');
Data_Corr = rmfield(Data_Corr,'size');

Data_Corr = rmfield(Data_Corr,'od');
Data_Corr = rmfield(Data_Corr,'ov');
Data_Corr = rmfield(Data_Corr,'oh');

Data_Corr = rmfield(Data_Corr,'Px');
Data_Corr = rmfield(Data_Corr,'px');


Data_Corr = orderfields(Data_Corr,{'Name','Size','Od','Ov','Oh','Diag32','Vert32','Horz32','Diag64','Vert64','Horz64'});
writetable(struct2table(Data_Corr),'../../tab/Correlacao.xlsx');

save correlacao_resultados.mat;



