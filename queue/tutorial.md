# Modular Programming in Mozart/Oz with Functors

This guide explains how to structure modular code in Mozart/Oz using **functors**, how to import other modules, and how to compile and run your programs. We'll use a `MergeSort` example that depends on two other modules: `merge.oz` and `split.oz`.

## 1. What Are Functors in Oz?

A **functor** in Oz is a module definition that can import other modules and export values (usually procedures or functions). Functors are the main way to organize code into reusable, composable components.

## 2. Example Project Structure

Suppose your project looks like this:

```
project-root/
│
├── mergeSort/
│   └── mergeSort.oz
├── merge/
│   └── merge.oz
└── split/
    └── split.oz
```

- `mergeSort/mergeSort.oz` defines the main sorting function.
- `merge/merge.oz` defines the merging logic.
- `split/split.oz` defines the splitting logic.

## 3. Writing a Functor with Imports

Here is an example `mergeSort.oz` file:

```oz
functor
import
   MergeModule at '../merge/merge.oz'
   SplitModule at '../split/split.oz'
export
   MergeSort
define
   fun {MergeSort Xs}
      case Xs
      of nil then nil
      [] [X] then [X]
      else Ys Zs in
         {SplitModule.split Xs Ys Zs}
         {MergeModule.Merge {MergeSort Ys} {MergeSort Zs}}
      end
   end
end
```

- The `import` section brings in other functors as modules.
- The `export` section lists what this module provides to others (here, the `MergeSort` function).

Your `merge.oz` and `split.oz` files should also be written as functors, exporting their respective functions (e.g., `Merge` and `split`).

### Example: `merge.oz`

```oz
functor
export
   Merge
define
   fun {Merge Xs Ys}
      % ... merging logic ...
   end
end
```

### Example: `split.oz`

```oz
functor
export
   split
define
   proc {split Xs Ys Zs}
      % ... splitting logic ...
   end
end
```

## 4. Compiling Oz Modules

Use the `ozc` compiler to compile each `.oz` file to a binary `.ozf` (Oz functor) file.

```sh
cd merge
ozc -c merge.oz

cd ../split
ozc -c split.oz

cd ../mergeSort
ozc -c mergeSort.oz
```

This will produce:

- `merge/merge.ozf`
- `split/split.ozf`
- `mergeSort/mergeSort.ozf`

## 5. Running Oz Modules

You can run a compiled functor using the `ozengine`:

```sh
ozengine mergeSort.ozf
```

If your functor is meant to be used as a library (not a standalone program), you can **link** it from another script:

```oz
{Module.link ['mergeSort.ozf']}
```

Now you can use the exported `MergeSort` function in your code.

## 6. Summary of Key Steps

- **Write** each module as a functor, using `import` to bring in dependencies and `export` to expose functions or procedures.
- **Compile** each `.oz` file with `ozc -c filename.oz`.
- **Run** a module directly with `ozengine filename.ozf`, or link it in another module using `{Module.link ['filename.ozf']}`.

## 7. Example: Putting It All Together

Suppose you want to test your `MergeSort`:

Create a file called `test.oz` in the `mergeSort` directory:

```oz
{Module.link ['mergeSort.ozf']}

declare
   Sorted = {MergeSort [3 1 4 1 5 9 2 6]}
   {Browse Sorted}
```

Compile and run:

```sh
ozc -c test.oz
ozengine test.ozf
```

This will display the sorted list in the Oz viewer.

---

## References

- [Mozart/Oz Documentation](https://mozart.github.io/documentation/)
