module MakeALisp.Step0 (repl) where

-- Import the hFlush and stdout symbols for rendering the prompt
import System.IO (hFlush, stdout)

-- Define the `read`, `eval`, and `print` functions. The first two
-- alias `id` in this step. `print` aliases `putStrLn`.
read = id
eval = id
print = putStrLn

{-
This function implements the REPL loop:

  - Emit the prompt
  - Flush stdout to render it
  - Read an expression from stdin
  - If the line is a ^D, exit. If not, evaluate the expression, print it, and
    repeat the loop
-}
repl = do
  putStr "user> "
  hFlush stdout
  input <- getLine
  if input == "\EOT"
  then return ()
  else do
    MakeALisp.Step0.print (eval (MakeALisp.Step0.read input))
    repl
