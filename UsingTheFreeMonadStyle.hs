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

