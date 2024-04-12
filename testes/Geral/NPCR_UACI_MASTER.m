function [NPCR_UACI_Struct] = NPCR_UACI_MASTER(imagefiles,ii,precisao,testl)
       
    NPCR_UACI_Struct=struct('name',{""},'size',{""},'mnpcr',0,'npcr',0,'npcr_passed',0,  'npcr_p',0, 'npcr_d',[0,0],'muaci',0,'uaci',0, 'uaci_passed',0, 'uaci_p',0, 'uaci_d',[0,0]);
 
    iterat=24000;
    j=10000;
 

    Npcr=zeros (iterat-j,1);
    pNpcr=zeros(iterat-j,1);
    dNpcr=zeros(iterat-j,2);
    Uaci=zeros (iterat-j,1);
    pUaci=zeros(iterat-j,1);    
    dUaci=zeros(iterat-j,2);
     
    gam_npcr   = zeros(testl,1);
    gam_npcr_p = zeros(testl,1);
    gam_npcr_d = zeros(testl,2);
    gam_uaci   = zeros(testl,1);
    gam_uaci_p = zeros(testl,1);
    gam_uaci_d = zeros(testl,2);
 
     currentfilename = imagefiles(ii).name;
     currentfilename = currentfilename(1:end-5); 
     NPCR_UACI_Struct.name = string(currentfilename);
     currentfig      = imread(sprintf('../../imagens/%s.tiff',currentfilename));     
    [width height]   = size(currentfig);
     
     
    if precisao==32
        currentmod   = uint8(abs(load((sprintf('../../mod/%s.fsmod',currentfilename)))));
        smod= sprintf('dfsmod');
    elseif precisao ==64
        currentmod   = uint8(abs(load((sprintf('../../mod/%s.fdmod',currentfilename)))));
        smod= sprintf('dfdmod');
    end
 
 
    for iii=1:testl

         currentmod2= uint8(abs(load(sprintf('../../mods/%s/%d.%s',currentfilename,iii,smod))));

     for i=1:length(currentmod) 
         if isnan(currentmod(i,1))==true
           currentmod(i,1)=1;          
         end
         if isnan(currentmod2(i,1))==true
           currentmod2(i,1)=1;          
         end
     end 

     index=0;

        while(j<iterat)
        
            f=currentmod(1+j: j+height*width);          
            g=f';
            h=vec2mat(g,height);
            c1=bitxor(currentfig,h,'uint8');


            f=currentmod2(1+j: j+height*width);          
            g=f';
            h=vec2mat(g,height);
            c2=bitxor(currentfig,h,'uint8');

            j=j+1;
            index=index+1;
            results = NPCR_and_UACI( c1, c2, 0, 255 );

            Npcr(index)= results.npcr_score;
            pNpcr(index)= results.npcr_pVal;
            dNpcr(index,:)= results.npcr_dist;

            Uaci(index)= results.uaci_score;
            pUaci(index)= results.uaci_pVal;    
            dUaci(index,:)= results.uaci_dist;

        end
    
    
        iNpcr   = movmean(Npcr ,100);
        ipNpcr  = movmean(pNpcr,100);
        idNpcr1 = movmean(dNpcr(:,1),100);
        idNpcr2 = movmean(dNpcr(:,2),100);

        iUaci    = movmean(Uaci ,100);
        ipUaci   = movmean(pUaci,100);
        idUaci1  = movmean(dUaci(:,1),100);
        idUaci2  = movmean(dUaci(:,2),100);
    
        gam_npcr(iii)          =         mean(iNpcr);
        gam_npcr_p(iii)        =         mean(ipNpcr);
        gam_npcr_d(iii,:)      =        [mean(idNpcr1), mean(idNpcr2)];
        gam_uaci(iii)          =         mean(iUaci) ;
        gam_uaci_p(iii)        =         mean(ipUaci);
        gam_uaci_d(iii,:)      =        [mean(idUaci1), mean(idUaci2)];
    
    end

    NPCR_UACI_Struct.npcr      =  gam_npcr;
    NPCR_UACI_Struct.npcr_p    =  mean(gam_npcr_p);
    NPCR_UACI_Struct.npcr_d    = [mean(gam_npcr_d(1)), mean(gam_npcr_d(2))];
    
    NPCR_UACI_Struct.uaci      =  gam_uaci;
    NPCR_UACI_Struct.uaci_p    =  mean(gam_uaci_p);
    NPCR_UACI_Struct.uaci_d    = [mean(gam_uaci_d(1)), mean(gam_uaci_d(2))];
    NPCR_UACI_Struct.size      =  sprintf("%dx%d",width,height);
    
    NPCR_UACI_Struct.px        =  width*height;
end