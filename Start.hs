module Start where
import System.Process
import Env
import Keymaps
import Autostart
start :: IO ()
start =
  do {
    ;setEnvVars Env.env_vars
    ;setKeymaps
    ;autoStart
  }
