const assert = require("node:assert/strict");

class MySet extends Set {
  add(value) {
    super.add(value);
    this.last = value;
  }
}

function removeIntersectionFromS(F, S) {
  for (const item of F) {
    S.delete(item);
  }
  return S;
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
    S.add(lastValue + 1);
    lastValue = lastValue + 1;
    difference = difference - 1;
  }

  return S;
}

function calculateF(F, S, n) {
  if (F.size >= n) {
    const val = findByIndex(n - 1, S).next().value;
    F.add(F.last + val);
    return F;
  }

  let i = n - 1;
  while (F.size <= n) {
    F = calculateF(F, S, i);
    const intermediateValue = calculateS(F, S);

    S = removeIntersectionFromS(F, intermediateValue);
    i = i + 1;
  }

  return F;
}

function hof(n) {
  if (1 < n + 1) {
    return [...calculateF(new MySet([1]), new MySet([2]), n).values()][n];
  }

  return 1;
}

console.time("time");

// assert.equal(hof(2), 7);

// assert.equal(hof(3), 12);

// assert.equal(hof(7), 45);

// assert.equal(hof(8), 56);

// assert.equal(hof(100), 5876);

assert.equal(hof(2000), 2077847);

console.timeEnd("time");
