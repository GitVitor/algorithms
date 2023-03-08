# Estrutura de dados e algoritmos

Cada pasta tem um problema e um algoritmo que tende a resolver o problema.

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