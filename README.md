# Estrutura de dados e algoritmos

Cada pasta tem um problema e um algoritmo que tende a resolver o problema.

## Propose to V2

Nessa v2 eu pretendo melhorar esse algoritmo para que ele suporte um número maior de iterações. Atualmente o algoritmo consegue encontrar itens apenas até a posição 5.727 em um tempo de 5199 ms (~5 segundos).
A ideia dessa melhoria de performance não é que nós consigamos executar o algoritmo em um menor tempo, e sim que nós consigamos encontrar itens em posições superiores a 5.727.

Ou seja, se executarmos hof 10000, o algoritmo deve ser capaz de encontrar um resposta.

### Qual o problema atual do algoritmo?

Atualmente o Algoritmo implementa uma lógica que se apoia em cima de programação recursiva.

Apesar da programação recursiva ser uma ferramenta poderosa e elegante para resolver problemas, ela possuí algumas limitações. Não podemos colocar uma função com chamada recursiva para ficar se chamando "infinitamente" e tão pouco para se chamar um número muito alto de vezes.

Justamente essa limitação acaba impactando na capacidade de execução do nosso algoritmo.

## hofstadter-figure-figure

A sequência figure-figure de Hofstadter é uma família de sequências inteiras definidas por relações de recorrência não lineares. Uma forma de definir a sequência é:

F(1) = 1; S(1) = 2; F(n) = F(n-1) + S(n-1), n > 1; S(n) é o valor que não está em F(n).

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
- Como o número de itens dentro das listas crescem muito a cada iteração, rapidamente o algoritmo começa a perder performance para conseguir encontrar valores dentro dessas listas. Sendo assim foi necessário utilizar o (Set)[https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Set] do Javascript para obter uma melhor performance.