# dio-bootcamp-database

* Desafio 1 do E-commerce
Objetivo:
Refinar o modelo apresentado em aula acrescentando os seguintes pontos:

Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
Entrega – Possui status e código de rastreio;


* Desafio 2 da Oficina
Objetivo:
Cria o esquema conceitual para o contexto de oficina com base na narrativa fornecida

Narrativa:
Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica
Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas
Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra
O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços
A mesma equipe avalia e executa os serviços
Os mecânicos possuem código, nome, endereço e especialidade
Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.


* Desafio 3 - E-commerce
Realizar a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realizar a persistência de dados para realização de testes. Criar queries SQL com as cláusulas abaixo:

Recuperações simples com SELECT Statement
Filtros com WHERE Statement
Crie expressões para gerar atributos derivados
Defina ordenações dos dados com ORDER BY
Condições de filtros aos grupos – HAVING Statement
Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
Diretrizes
Não há um mínimo de queries a serem realizadas;
Os tópicos supracitados devem estar presentes nas queries;
Elabore perguntas que podem ser respondidas pelas consultas;
As cláusulas podem estar presentes em mais de uma query.

* Desafio 4 - Oficina
Para o cenário da oficina, criar queries SQL com as cláusulas abaixo:

Recuperações simples com SELECT Statement;
Filtros com WHERE Statement;
Crie expressões para gerar atributos derivados;
Defina ordenações dos dados com ORDER BY;
Condições de filtros aos grupos – HAVING Statement;
Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;
Diretrizes
Não há um mínimo de queries a serem realizadas;
Os tópicos supracitados devem estar presentes nas queries;
Elabore perguntas que podem ser respondidas pelas consultas
As cláusulas podem estar presentes em mais de uma query.

* Desafio 5 - O Papel dos Bancos de Dados SQL e NoSQL na Engenharia de Dados

-Contexto geral sobre o uso de dados na atualidade
Um engenheiro de dados precisa ser flexível;
A tecnologia de banco de dados está cada vez mais plural;
É preciso conhecer o conceito de cada banco para usar a ferramenta certa;
Há diversos formatos de arquivos;
É preciso saber explorar as tecnologias para solucionar os problemas;
Encaixar as ferramentas ao contexto.

-O que é SQL e NoSQL
Banco de Dados Relacional:
Um banco de dados relacional (SQL) é o tipo mais difundido;
É o banco no qual se busca armazenar informações com um relacionamento entre si;
Busca manter uma consistência;
Esquema de dados rígido e conhecido, modelo bem definido;
Permite o relacionamento entre as entidades, garante integridade.

NoSQL:
Not Only Structured Query Language;
Conta com funções adicionais;
Necessidades diferentes de escalabilidade horizontal;
Armazenar mais informações e não estruturadas;
É um complemento;
Permite trabalhar sem um esquema de dados rígidos.

-O NoSQL não foi criado para substituir o SQL
Um banco não relacional veio para atender o que não se conseguia fazer com o relacional;
É possível usar os dois de forma complementar;
O Big data necessita de formas mais flexíveis de armazenamento de dados;
O NoSQL facilita a consulta.

-Como se consulta um dado armazenado no NoSQL?
As chaves de consulta são importantes;
A forma de consulta deve ser pensada no início;
Definir as chaves é importante;
Pensar na característica do banco;
A modelagem da informação é essencial, pensar em como isso vai performar;
O mongodb possui índices como o banco relacional.

-Conhecer um SGBD de cada tipo é suficiente para iniciar?
Sempre há algo a aprender;
Não é preciso conhecer a fundo todas as ferramentas;
Há similaridades também;
É importante entender o conceito de cada um, o propósito;
Quando for preciso usar alguma ferramenta, não será tão difícil;
Conhecer os bancos colunares, os bancos de documentos, grafos, etc.;
Saber a finalidade;
Estabelecer bem os critérios para embasar a decisão por uma determinada ferramenta;
Levar em conta o custo, os profissionais que dominam.

-A flexibilidade do NoSQL frente ao SQL
O SQL foi feito com o foco nos princípios ACID;
O NoSQL trouxe mais flexibilidade.

-No Banco Carrefour, quais os SGBDs mais utilizados?
É um contexto híbrido;
Bancos de dado oracle;
O mongodb também é usado;
A escolha do banco também é feita considerando como as informaçãos serão manipuladas e o tanto que se possui de conexão com outras ferramentas.

-Evolução da arquitetura de sistemas e transição de estruturas
As arquiteturas necessitam de evolução constante;
Quando o ambiente já é estabelecido é preciso tornar a transição suave;
AWS, Azure, Google, a competição é favorável;
A transição gera um custo, um esforço;
Conectar os itens à estratégia que se quer seguir.

-Sobre DataLake e Databricks
DataLake é como um lugar onde sãp jogadas muitas informações para serem consumidas em algum momento;
São ferramentas que ajudam a ter uma consistência das informações;
É um repositório que permite armazenar um grande volume de dados;
Dado esse volume pensar em soluções de baixo custo;
Soluções como sistema de arquivos;
5 capacidades básicas no ambiente de dados: Ingestão, Armazenamento, Processamento, Consumo e Segurança/governança.

-Quais os maiores desafos na hora de realizar o ETL?
Manipulação dos dados é o maior desafio;
Tudo envolve uma manipulação forte;
Rotinas.

-O tipo de banco de dados influencia na complexidade?
O tipo do banco de dados pode dificultar;
O banco por si só não é o principal na complexidade;
É preciso definir bem a arquitetura que será usada no banco;
Quais índices, formas de consulta;
Com a arquitetura estabelecida, parte-se para a ETL;
Hoje há muitos plugins que facilitam bastante.

-Como é gerada a demanda dos dados e quem define quais dados serão coletados?
São times multidisciplinares;
Há times estruturantes que cuidam da plataforma;
É um modelo bem descentralizado.

-Engenheiro e Cientista de dados
São perfis complementares;
O engenheiro está mais ligado à preparação da informação;
Coletar, preparar, deixar disponível para os cientistas utilizarem;
Engenheiro tem mais conhecimento técnico das ferramentas;
O cientista é um dos muitos que consomem a informação;
O cientista está mais ligado à criação de modelos;
Usa a informação do engenheiro para gerar insights, predizer algo;
O cientista aplica um processamento na informação;
O cientista usa a informação e traduz em insights para alavancar o negócio.

-Deficiência de pessoas com skill em Estatística
Estatística e matemática são a base da ciência de dados;
É importante entender sobre isso;
Saber o sobre regressão linear, etc.;
O conhecimento nessas áreas é fundamental.

-Quais dicas para quem ser Engenheiro de dados do Banco Carrefour?
Ter conhecimento amplo do ecossistema de dados;
Ter curiosidade;
Ter olhar crítico;
Conhecer as técnicas de ETL;
Além de conhecer as ferramentas, ter visão do fluxo dos dados.


