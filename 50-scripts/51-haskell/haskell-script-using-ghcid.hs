#! /usr/bin/env -S"ANSWER=42" nix-shell
#! nix-shell -p ghcid
#! nix-shell -p "haskellPackages.ghcWithPackages (p: [p.shower])"
#! nix-shell -i "ghcid -c 'ghci -Wall' -T main"

import Shower (printer)
import System.Environment (getEnv)

main :: IO ()
main = do
  let question = "The anwer to life the universe and everything"
  answer <- getEnv "ANSWER"
  printer (question, "is", answer)
