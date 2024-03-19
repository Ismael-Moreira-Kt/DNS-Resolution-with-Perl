## Declarar  o caminho para o binário do Perl
```perl
	#!/usr/bin/perl
```



## Declarar imports
```perl
	use strict;
	use warnings;	
	use Net::DNS::Resolver;
```
- Strict -> Impõe que o programa tenha todas as variáveis declaradas antes que sejam usadas, que todas as referências simbólicas (%&@) sejam válodas e evita que sejam declaradas variáveis globais em funções desnecessáriamente.
- Warnings -> Trata todas as exceções e erros mostrados durante a execução do código.
- Net::DNS::Resolver -> É uma bibilioteca criada para resolver DNS, ou seja, traduzir nomes de domínio para IPs. 



## Declarar Variáveis
```perl
	my $hostname = 'perl.org';
	
	my $res = Net::DNS::Resolver->new(
		nameservers => [qw(10.55.0.1)],
	);
	
	my $query = $res->search($hostname);
```
- $hostname -> Nome do domínio que queremos resolver.
- $res -> Um objeto de resolução de DNS: 
	- nameservers -> É o parâmetro do construtor que guarda todos os servidores DNS que vão ser usados.
- $query -> Variável usada para guardar todos os resultados da busca nos servidores DNS:
	- res->search($hostname) -> Faz a busca do nome de domínio guardado na variável hostname nos servidores DNS guardados na variável res.



## Tratar os dados recebidos
```perl
	if ($query) {
		foreach my $rr ($query->answer) {
			next unless $rr->type eq "A";
			print "Encontrei um registro: ".$rr->address;
		}
	}
```
- if($query) -> Verifica se a procura foi bem sucedida. 
- foreach my $rr ( $query->answer) -> Verifica todos os dados da procura um a um.
- next unless $rr->type eq "A" -> Se o resultado da busca for algo diferente de um IPv4, ele salta automaticamente para a próxima iteração.
- print "Encontrei um registro: ".$rr->address -> Se o resultado da busca for um IPv4, mostra na tela.