#!/usr/local/bin/perl
$header = <<'MYHEADER';#essa linha cria o cabeçalho
#####################################################
#            #Find_position#                                  #
#                                                                       #
# Este programa irá localizar essa lista de posição                 #
#        no arquivo de interesse.                               #
#                                                                            #
#                                                                              #
#  #Autora: Carolina Guimarães                                     #
#                                                                         #
#                 #Data: 19/02/2018#                                  #         
#####################################################
MYHEADER
print "$header\n";#essa linha imprime o cabeçalho

#Encontra o arquivo .vcf e realiza a análise da sequência.
print "\nDigite o caminho completo do arquivo a ser analisado\n\n";
$input=<STDIN>;
unless (open(INPUT,$input)){#Caso o arquivo não seja encontrado, uma mensagem de erro é informada.
print "\nO arquivo informado não pode ser encontrado/aberto, verifique o input e o caminho do arquivo\n\n";
exit
}
@arquivo=<INPUT>;

#essa linha pede ao usuário a lista de posição de cada variação do gene
print "\nDigite a lista de posição de cada variação do gene\n\n";
$lista=<STDIN>;
unless (open(LISTA,$lista)){#Caso o arquivo não seja encontrado, uma mensagem de erro é informada.
print "\nO arquivo informado não pode ser encontrado/aberto, verifique o input e o caminho do arquivo\n\n";
exit
}
@posicao=split(/\n/,join('',<LISTA>));

print "@posicao\n";
$tam = @posicao;
#Este loop realiza a leitura do arquivo de entrada
open (RESULTADO, ">resultado.txt"); #o resultado será mandando para um arquivo de resultado
for($i=0;$i<=($tam-1);$i++){
my @result = grep {$_ =~ $posicao[$i]} @arquivo;
    print RESULTADO "@result\n";#imprime no arquivo de resultado
}
close (RESULTADO); #fecha o arquivo de resultado

print "\nO resultado será encontrado na pasta em que se encontra o programa.\n";#Essa linha diz ao usuário que os resultados estarão na pasta em que se encontra o programa
print "Muito Obrigada!\n"; #Essa linha agradeçe ao usuário
#Feito por Carolina Guimarães Ramos Matosinho
