function [NPCR_UACI_Struct] = NPCR_UACI_teste(imagefiles,ii,precisao)
       

    NPCR_UACI_Struct=struct('name',{""},'npcr',0,  'npcr_p',0, 'npcr_d',[0,0],'uaci',0,  'uaci_p',0, 'uaci_d',[0,0]);
 
     iterat=3000;
     currentfilename = imagefiles(ii).name;
     currentfilename=currentfilename(1:end-5);    
     currentfig   =  imread(sprintf('../imagens/%s.tiff',currentfilename));     
     [width height]=size(currentfig);
     
     
     Npcr=zeros(iterat,1);
     pNpcr=zeros(iterat,1);
     dNpcr=zeros(iterat,2);
 
     Uaci=zeros(iterat,1);
     pUaci=zeros(iterat,1);    
     dUaci=zeros(iterat,2);
 
 
     if precisao==32
         currentmod   = uint8(abs(load((sprintf('../mod/%s.fsmod',currentfilename)))));
         currentmod2   = uint8(abs(load((sprintf('../mod/%s.dfsmod',currentfilename)))));
     elseif precisao ==64
         currentmod   = uint8(abs(load((sprintf('../mod/%s.fdmod',currentfilename)))));
         currentmod2   = uint8(abs(load((sprintf('../mod/%s.dfdmod',currentfilename)))));
     end
 

     
 for i=1:length(currentmod) 
     if isnan(currentmod(i,1))==true
       currentmod(i,1)=1;          
     end
     if isnan(currentmod2(i,1))==true
       currentmod2(i,1)=1;          
     end
 end 
 
 j=20000;
 index=0;
 
 while(index<iterat)
     
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
 
 
 
 NPCR_UACI_Struct.name   = string(imagefiles(ii).name);
 NPCR_UACI_Struct.npcr   = sum(iNpcr)/iterat;
 NPCR_UACI_Struct.npcr_p = mean(ipNpcr);
 NPCR_UACI_Struct.npcr_d = [mean(idNpcr1), mean(idNpcr2)];
 
 NPCR_UACI_Struct.uaci  = sum(iUaci)/iterat ;
 NPCR_UACI_Struct.uaci_p = mean(pUaci);
 NPCR_UACI_Struct.uaci_d = [mean(idUaci1), mean(idUaci2)];
 
end