# Estrutura de dados e algoritmos

Cada pasta tem um problema e um algoritmo que tende a resolver o problema.

## hofstadter-figure-figure

*Linguagem utilizada:* Javascript

A sequência figure-figure de Hofstadter é uma família de sequências inteiras definidas por relações de recorrência não lineares. Uma forma de definir a sequência é:

F(1) = 1; S(1) = 2; F(n) = F(n-1) + S(n-1), n > 1;

S(n) é o valor que não está em F(n).

Por exemplo, F(2) = F(1) + S(1) = 3 e S(2) é o próximo inteiro que não está em R, ou seja, 4. A sequência R é chamada de “figura” e a sequência S é chamada de "figura complementar".

### O que o meu algoritmo faz?

Criei um algoritmo em Javascript que de forma performatica ajuda a encontrar a posição de um item na sequência F.
Por exemplo: 
```
hof 0 = 1
hof 1 = 3
hof 2 = 7
```

Alguns pontos interessantes sobre esse algoritmo:
- Utilizei técnicas de programação recursiva para resolver o problema;
- Como o número de itens dentro das listas crescem muito a cada iteração, rapidamente o algoritmo começa a perder performance para conseguir encontrar valores dentro dessas listas. Sendo assim foi necesário utilizar o [Set](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Set) do Javascript para obter uma melhor performance.
- TLDR; Teoria por trás do generators do Javascript: Utilizando o Generator do Javascript eu consegui replicar o conceito de Lazy Evaluation presente em linguagens funcionais como Haskell. Ao utilizar Generators, foi possível criar sequências que não são avaliadas até que sejam necessárias, evitando processamento desnecessário e melhorando o desempenho do programa. Em Haskell, essa estratégia é chamada de "avaliação preguiçosa" e pode ser aplicada em diversos contextos, como na geração de listas infinitas. Com o uso de Generators em Javascript, é possível obter um comportamento semelhante, permitindo a criação de sequências que são geradas sob demanda e consumidas de forma eficiente. Isso torna a implementação de algoritmos mais flexível e eficiente, uma vez que é possível economizar recursos computacionais ao evitar o processamento de elementos que não serão utilizados.


## Split

**Linguagem utilizada: [Oz language](http://mozart2.org/mozart-v1/doc-1.4.0/tutorial/index.html)**

O objetivo da função Split é dividir a lista de entrada Xs em duas listas de saída Ys e Zs, alternando os elementos entre as duas listas. Por exemplo, se a lista de entrada for [1 2 3 4], então a função deve retornar as listas [1 3] e [2 4].

A função usa recursão para dividir a lista de entrada. Ela verifica primeiro se a lista está vazia ou contém apenas um elemento. Se for o caso, ela atribui os valores apropriados às variáveis de saída e retorna. Caso contrário, ela divide a lista em três partes: o primeiro elemento (X1), o segundo elemento (X2) e o restante da lista (Xr**. Em seguida, ela chama recursivamente a si mesma com o restante da lista como entrada e atribui os resultados às variáveis de saída.

No geral, este algoritmo divide eficientemente uma lista em duas partes alternando seus elementos.

## AppendD

**Linguagem utilizada: [Oz language](http://mozart2.org/mozart-v1/doc-1.4.0/tutorial/index.html)**

O objetivo desse algoritmo é implementar uma forma performatica de incrementar uma lista com uma outra lista.
Quando eu digo performatica, estou me referindo ao fato de que geralmente uma lista para ser incrementada por outra pode levar um tempo O(n), com esse algoritmo AppendD o tempo é constante O(1).

Para conseguir um tempo O(1) nesse algoritmo, foi necessário utilizar um técnica de Difference Structure. Nessa técnica, nós temos duas estruturas:
- Head - Uma estrutura que está preenchida (ou não);
- Tail - Uma outra estrutura que não está preenchida.

A ideia dessa técnica de difference structure, é que possamos criar novas estruturas combinando com outras estruturas já existentes.

