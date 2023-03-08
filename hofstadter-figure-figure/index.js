const assert = require("node:assert/strict");

class MySet extends Set {
  add(value) {
    super.add(value);
    this.last = value;
  }
}

function* findByIndex(indexToFind, list) {
  let i = 0;

  for (const item of list) {
    if (indexToFind === i) {
      yield item;
    } else {
      i = i + 1;
    }
  }
}

function calculateS(F, S) {
  const valueToFound = F.last + 1;

  let lastValue = S.last;
  let difference = valueToFound - lastValue;

  while (difference > 0) {
    if (!F.has(lastValue + 1)) {
      S.add(lastValue + 1);
    }
    lastValue++;
    difference--;
  }

  return S;
}

function* calculateF(F, S, n) {
  if (F.size == n) {
    const val = findByIndex(n - 1, S).next().value;
    const newF = new MySet(F); // Preciso testar um WeakSet aqui;
    newF.add(F.last + val);
    return newF;
  }

  while (F.size <= n) {
    const iterator = calculateF(F, S, F.size);
    const nextData = iterator.next();
    F = nextData.value;
    yield F;
    S = calculateS(F, S);
  }

  return F;
}

function hof(n) {
  if (1 < n + 1) {
    const FSet = new MySet([1]);
    const SSet = new MySet([2]);

    let iterator = calculateF(FSet, SSet, n);
    let res = { done: false };
    while (!res.done) {
      res = iterator.next();
    }
    return [...res.value.values()][n];
  }

  return 1;
}

console.time("time");

// assert.equal(hof(1), 3);
// assert.equal(hof(2), 7);
// assert.equal(hof(3), 12);
// assert.equal(hof(11), 98);

// assert.equal(hof(5727), 16780505);
assert.equal(hof(5727), 16780505);
// assert.equal(hof(5728), 16780505);

console.timeEnd("time");
