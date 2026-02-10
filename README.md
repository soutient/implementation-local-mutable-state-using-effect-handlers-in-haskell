# Implementation local mutable state using effect handlers in Haskell

 This code demonstrates how using the free monad style to implement local mutable state using effect handlers in Haskell, we can use the effect-handlers or effev library style, defining a State effect with get and put operations, then handling it locally via a primitive like handlerLocal or a custom continuation-based implementation. This isolates the state to the handled computation, avoiding leakage, and matches the s -> (a, s) monad semantics.
 
 ## Description
Using the free monad style. Implementation local mutable state using effect handlers in Haskell.

```haskell
{-# LANGUAGE GADTSyntax, FlexibleContexts, TypeFamilies #-}

module UsingTheFreeMonadStyle where

data StateF s a r where
  Get :: StateF s s r
  Put :: s -> StateF s () r

type State s = FreeF (StateF s)

newtype Eff e a = Eff { runEff :: Free (Sum e) a }
  where Sum allows composition.

-- Handler folds to State monad
handleState :: s -> Eff '[State s] a -> (a, s)
handleState init (Eff m) = case runFree m of
  Pure x -> (x, init)
  Free (Inject (Get :>>= k)) -> handleState init (k init)
  Free (Inject (Put s' :>>= k)) -> handleState s' (k ())
```

- Stability   :  The project is under development. I invite you to coauthorship the completion of this project.

- Maintainer  :  retablies@hotmail.com
