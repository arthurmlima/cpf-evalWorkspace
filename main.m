% esse script executa, so nao faz o pao de queijo 

clear all;
clc; 

%geracao dos arquivos .c para gerar cifras;
cd ./gencode/
gerador_cifras
gerador_cifras_diff



% cd ./scripts/
% execucao_script
% cd ../

%Compila e executa arquivos ./c
system('powershell -command "C:\tcasi_paper\matlab_workspace\execprg.ps1"');

cd C:\tcasi_paper\matlab_workspace\

cd ./testes/Geral/  
NPCR_UACI
Entropia
Correlacao
Histogramas
% 
% cd ../Lena
% execucao_fotos
