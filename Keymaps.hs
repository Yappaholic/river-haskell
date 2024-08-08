module Keymaps where
  import System.Process
  setSpawnKeymaps :: [(String, String)] -> IO ()
  setMetaKeymaps :: [(String, String)] -> IO ()
  setMouse :: IO ()
  setTagsKeymaps :: [Int] -> IO ()
  keymapsSpawn =
    [ ("Q", "wezterm")
    , ("M", "wlogout")
    , ("R", "'rofi -show drun -show-icons'")
    , ("B", "brave")
    , ("T", "'hyprshot -m region --clipboard-only'")
    ]

  keymapsMeta =
    [ (" C", " close")
    , (" E", " exit")
    , (" F", " toggle-fullscreen")
    , (" Space", " toggle-float")
    , (" J", " focus-view next")
    , (" K", " focus-view previous")
    , ("+Shift J", " swap next")
    , ("+Shift K", " swap previous")
    ]

  setKeymaps = do
    setSpawnKeymaps keymapsSpawn
    setMetaKeymaps keymapsMeta
    setMouse
    let xs = [1..10] in setTagsKeymaps xs

  setSpawnKeymaps (x:xs)
    |xs /= [] = do { 
      ;let r = "riverctl map normal Super " ++ fst x ++ " spawn " ++ snd x
      in spawnCommand r
      ;setSpawnKeymaps xs}
    |otherwise = return ()
  setMetaKeymaps (x:xs)
    |xs /= [] = do { 
      ;let r = "riverctl map normal Super" ++ uncurry (++) x
      in spawnCommand r
      ;setMetaKeymaps xs}
    |otherwise = return ()
  setTagsKeymaps (x: xs) 
    | xs /= [] = do {
      ;let view ="riverctl map normal Super " ++ show x ++ " set-focused-tags " ++ show (2 ^ (x-1)) in
      spawnCommand view
      ;let switch ="riverctl map normal Super+Shift " ++ show x ++ " set-view-tags " ++ show (2 ^ (x-1)) in
      spawnCommand switch
      ;setTagsKeymaps xs
      }
    |otherwise = return ()
  setMouse = do {
      ;spawnCommand "riverctl map-pointer normal Super BTN_LEFT move-view"
      ;spawnCommand "riverctl map-pointer normal Super BTN_RIGHT resize-view"
      ;return ()}





