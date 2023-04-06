# Algoritmos de fila

Nessa pasta temos dois arquivos que implementam funcoes para atuarmos com fila.
Os algoritmos estao escritos em Oz e fornecem as seguintes operacoes:

- NewQueue: Operacao para criar uma nova fila
- Insert: Operacao para inserir um novo item em uma fila
- Delete: Operacao para remover um item de uma fila

O objetivo principal dessa pasta e analizar como se comportam algoritmos que tem uma complexidade de tempo amortizada, ou em ingles: "amortized complexity time".

## Porque dois arquivos?

Cada arquivo possui uma forma diferente de implementar as oepracoes de uma fila, e cada implementacao possui sua complexidade de tempo.

Por exemplo, no arquivo queueAmortizedConstantTime.oz, o tempo das operacoes nao e worst-case e sim amortized constante time.
Ja no arquivo queueWorstCase.oz temos um tempo de operacao O(1) sempre.

Abaixo vamos ver mais detalhes sobre a tecnica de amortized constant time utilizada no arquivo queueAmortizedConstantTime.oz

## Amortized constant time

### Introducao

Amortized constant time é uma tecnica para análise do tempo de execução de um algoritmo, que tem como foco o tempo total de execução de uma sequência ao contrário da técnica worst-case que tem como foco a análise unitária do tempo de execução.
Ele costuma ser apropriado para entender o comportamento assintótico de uma sequência de operações.
Por exemplo: Se tivermos que lidar com uma Binary tree, é interessante entender o pior tempo de operação para operar essa fila e multiplica-lo pelo número de itens na fila.
Porém se lidarmos com uma splay tree, é mais interessante entendermos tanto o worst-case quanto o tempo médio, pois o pior cenário é muito raro de acontecer.
Então não seria preciso multiplicar o número de itens pelo worst-case.
Nesse caso, faz sentido utilizarmos o amortized-constant time pois ele trataria da seguinte forma:
- Dividimos o tempo do pior cenário pelo tempo do melhor cenário e então multiplicamos esse resultado pelo número de itens. 

- Ele tenta calcular uma media aritmetica do numero de operacoes vezes o tempo de cada operacao.

- Tentar explicar o motivo de uma binary tree ser análisada pelo worst-case.


### aggregate method

Uma forma de calcularmos um tempo amortizado, é através da formula:
`Custo total de K operações dividido por K`

Exemplo: 300 inserts que estão levando 7 segundos.
`Custo total = 7s = 7000ms`
`Total de operações = 300`
`Amortized constant time = 7000 / 300 = 23`


### Amortized bounds