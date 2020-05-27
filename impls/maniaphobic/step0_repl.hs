-- Import the hFlush and stdout symbols for rendering the prompt
import System.IO (hFlush, stdout)

replRead = id
replEval = id
replPrint s = putStrLn s

{-
This function implements the REPL loop:

  - Emit the prompt
  - Flush stdout to render it
  - Read an expression from stdin
  - If the line is a ^D, exit. If not, evaluate the expression and repeat the loop
-}
replLoop = do
  putStr "user> "
  hFlush stdout
  input <- getLine
  if input == "\EOT"
  then return ()
  else do
    replPrint (replEval (replRead input))
    replLoop

-- `main` is simply the REPL loop
main = replLoop
