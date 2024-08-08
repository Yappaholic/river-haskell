module Env where
  import System.Process
  setEnvVars :: [String] -> IO ()
  env_vars = ["LIBVA_DRIVER_NAME=nvidia", "XDG_SESSION_TYPE=wayland", "GBM_BACKEND=nvidia_drm", "__GLX_VENDOR_LIBRARY_NAME=nvidia", "WAYLAND_DISPLAY=wayland-0"]
  setEnvVars (x:xs) 
    |xs /= [] = do { 
                      ;let r = "export " ++ x in spawnCommand r
                      ;setEnvVars xs}  
    |otherwise = return ()


