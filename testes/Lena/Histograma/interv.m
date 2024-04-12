function [x32,y32,x64,y64, axispl,dataAn] = interv(Variance32,Variance64,desvio,movmeansample,points,initx)
%INTERVAL_IS Summary of this function goes here
%   Detailed explanation goes here



intervalo32=horzcat(zeros(1,initx),movmean(Variance32(1,initx+1:points),movmeansample))
intervalo64=horzcat(zeros(1,initx),movmean(Variance64(1,initx+1:points),movmeansample))


min32=min(movmean(Variance32(1,initx:points),movmeansample))
max32=max(movmean(Variance32(1,initx:points),movmeansample))
min64=min(movmean(Variance64(1,initx:points),movmeansample))
max64=max(movmean(Variance64(1,initx:points),movmeansample))

mean32=mean(movmean(Variance32(1,initx:points),movmeansample))
mean64=mean(movmean(Variance64(1,initx:points),movmeansample))


dataAn=[min32,max32,min64,max64,mean32,mean64,abs(256-mean32),abs(256-mean64)]




vetor=zeros(1,4)
vetor(1)=min(movmean(Variance32(1,1:points),movmeansample))
vetor(2)=max(movmean(Variance32(1,1:points),movmeansample))
vetor(3)=min(movmean(Variance64(1,1:points),movmeansample))
vetor(4)=max(movmean(Variance64(1,1:points),movmeansample))



axispl = [0,24000,min(vetor),max(vetor)]

x32=[1:points, fliplr(1:points)]
y32=[(1+desvio)*intervalo32, fliplr((1-desvio)*intervalo32)]

x64=[1:points, fliplr(1:points)]
y64=[(1+desvio)*intervalo64, fliplr((1-desvio)*intervalo64)]

end

