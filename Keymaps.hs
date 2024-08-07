module Keymaps where
  import System.Process

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
    let xs = [1..10] in setTagsKeymaps xs

  setSpawnKeymaps (x:xs)
    |xs /= [] = do { 
  										;let r = "riverctl map normal Super " ++ fst x ++ " spawn " ++ snd x
  										in callCommand r
                      ;setSpawnKeymaps xs}
    |otherwise = return ()
  setMetaKeymaps (x:xs)
    |xs /= [] = do { 
  										;let r = "riverctl map normal Super" ++ uncurry (++) x
  										in callCommand r
                      ;setMetaKeymaps xs}
    |otherwise = return ()
  setTagsKeymaps (x: xs) 
    | xs /= [] = do {
    	;let r ="riverctl map normal Super " ++ show x ++ " set-focused-tags " ++ show (2 ^ (x-1)) in
      callCommand r
      ;setTagsKeymaps xs
      }
    |otherwise = return ()





