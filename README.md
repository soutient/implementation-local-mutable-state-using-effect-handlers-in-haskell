# Implementation local mutable state using effect handlers in Haskell

 This code demonstrates how using the free monad style to implement local mutable state using effect handlers in Haskell, we can use the effect-handlers or effev library style, defining a State effect with get and put operations, then handling it locally via a primitive like handlerLocal or a custom continuation-based implementation. This isolates the state to the handled computation, avoiding leakage, and matches the s -> (a, s) monad semantics.
 
 ## Description
Using the free monad style. Implementation local mutable state using effect handlers in Haskell.

- Stability   :  The project is under development. I invite you to coauthorship the completion of this project.

- Maintainer  :  retablies@hotmail.com
