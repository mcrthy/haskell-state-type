# haskell-state-type
An implementation of the Haskell's State type.

State variables are those which are used in the evaluation of a function, but are not included as parameters.

Being a pure language, Haskell disallows functions from accessing any data not explicitly passed in. The State type allows for changes in state to be made explicit by threading them through function calls.
