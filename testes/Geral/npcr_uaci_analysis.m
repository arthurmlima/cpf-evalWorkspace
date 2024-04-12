function [data] = npcr_uaci_analysis(data,testl,ii)
%NPCR_UACI_ANALYSIS Summary of this function goes here
%   Detailed explanation goes here

if data(ii).size == "256x256"
    for ki=1:testl
        if data(ii).npcr(ki)*100 > 99.5693
            data(ii).npcr_passed=data(ii).npcr_passed+1;
        end    
        if 33.2824<(100*data(ii).uaci(ki)) && 100*data(ii).uaci(ki)<33.6447
            data(ii).uaci_passed=data(ii).uaci_passed+1;
        end
    end

elseif data(ii).size == "512x512"
    for ki=1:testl
        if data(ii).npcr(ki)*100 > 99.5893
            data(ii).npcr_passed=data(ii).npcr_passed+1;
        end    
        if 33.3730<(100*data(ii).uaci(ki)) && 100*data(ii).uaci(ki)<33.5541
            data(ii).uaci_passed=data(ii).uaci_passed+1;
        end
    end
elseif data(ii).size == "1024x1024"
    for ki=1:testl
        if data(ii).npcr(ki)*100 > 99.5994
            data(ii).npcr_passed=data(ii).npcr_passed+1;
        end    
        if 33.4183<(100*data(ii).uaci(ki)) && 100*data(ii).uaci(ki)<33.5088
            data(ii).uaci_passed=data(ii).uaci_passed+1;
        end
    end
end

data(ii).mnpcr = mean(data(ii).npcr);
data(ii).muaci = mean(data(ii).uaci);
end