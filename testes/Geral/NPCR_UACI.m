clear all
clc
direc       = '../../imagens/*.tiff';
imagefiles  = dir(direc);      
nfiles      = length(imagefiles);    % Number of files foun

testl=100;
for ii=1:nfiles

    npua32(ii)=NPCR_UACI_MASTER(imagefiles,ii,32,testl);
    npua64(ii)=NPCR_UACI_MASTER(imagefiles,ii,64,testl);
    
    npua32=npcr_uaci_analysis(npua32,testl,ii);
    npua64=npcr_uaci_analysis(npua64,testl,ii);
       
    fprintf("%3.f * %s *** NPCR Pass:%3.f UACI Pass:%3.f ***  NPCR Pass:%3.f UACI Pass:%3.f\n",ii,imagefiles(ii).name, npua32(ii).npcr_passed, npua32(ii).uaci_passed, npua64(ii).npcr_passed, npua64(ii).uaci_passed)
    
    save npcr_uaci_resultados.mat;
   
end

data_N_npcr_uaci_32=cell2struct(struct2cell(npua32),{'Name','Size','mnpcr_32','npcr_32','npcr_passed_32','npcr_p_32','npcr_d_32','muaci_32','uaci_32','uaci_passed_32','uaci_p_32','uaci_d_32','Px'},1)
data_N_npcr_uaci_64=cell2struct(struct2cell(npua64),{'name','size','mnpcr_64','npcr_64','npcr_passed_64','npcr_p_64','npcr_d_64','muaci_64','uaci_64','uaci_passed_64','uaci_p_64','uaci_d_64','px'},1)
 
aa_nu = struct2table( data_N_npcr_uaci_32 );
bb_nu = struct2table( data_N_npcr_uaci_64 );

Data_NPRC_UACI = [ aa_nu ,bb_nu ];
Data_NPRC_UACI = sortrows(Data_NPRC_UACI, 'Px'); % sort the table by 'DOB'

Data_NPRC_UACI = table2struct( Data_NPRC_UACI );

Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'name');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'size');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'Px');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'px');

Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'npcr_32');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'npcr_p_32');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'npcr_d_32');

Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'uaci_32');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'uaci_p_32');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'uaci_d_32');

Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'npcr_64');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'npcr_p_64');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'npcr_d_64');

Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'uaci_64');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'uaci_p_64');
Data_NPRC_UACI = rmfield(Data_NPRC_UACI,'uaci_d_64');

Data_NPRC_UACI = orderfields(Data_NPRC_UACI,{'Name','Size','mnpcr_32','npcr_passed_32','muaci_32','uaci_passed_32','mnpcr_64','npcr_passed_64','muaci_64','uaci_passed_64'});

writetable(struct2table(Data_NPRC_UACI),'../../tab/NPCR_UACI.xlsx');

    save npcr_uaci_resultados.mat;






