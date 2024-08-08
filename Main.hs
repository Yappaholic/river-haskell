module Main where
import System.Process
import Env
import Keymaps
import Autostart
main :: IO ()
main =
  do {
    ;setEnvVars Env.env_vars
    ;setKeymaps
    ;autoStart
    ;return ()
  }
