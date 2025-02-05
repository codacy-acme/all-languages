module HelloWorld where

open import Agda.Builtin.IO using (IO)
open import Agda.Builtin.Unit using (⊤)
open import Agda.Builtin.String using (String)
open import Agda.Builtin.Bool using (Bool)  -- Unused import
open import Agda.Builtin.Nat using (Nat)    -- Unused import

postulate putStrLn: String→ IO ⊤  -- Inconsistent spacing
{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# COMPILE GHC putStrLn = putStrLn . T.unpack #-}

-- Unused function with magic number
unusedHelper : Nat
unusedHelper = 42

main: IO ⊤   -- Missing type signature documentation
main= putStrLn "Hello, World!"  -- Inconsistent spacing around =
