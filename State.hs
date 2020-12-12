module State where

newtype State s a =
  State { runState :: s -> (a, s) }

instance Functor (State s) where
  fmap f (State sa) =
    State $ \s0 -> let (a, s1) = sa s0 
                   in  (f a, s1)

instance Applicative (State s) where
  pure a = State $ \s -> (a, s)
  (<*>) (State sa) (State sb) =
    State $ \s0 -> let (f, s1) = sa s0
                       (a, s2) = sb s1
                   in  (f a, s)

instance Monad (State s) where
  return = pure
  (State sa) >>= f = 
    State $ \s0 -> let (a, s1)   = sa s0
                       (State g) = f a
                   in  g s1