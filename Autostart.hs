module Autostart where
  import System.Process
  programmStart :: [String] -> IO ()
  keyboardStart :: [(String, String)] -> IO ()
  autoSpawn = ["hyprpaper", "i3bar-river", "gammastep"]
  wideriver = "wideriver \
    \--layout left \
    \--layout-alt monocle \
    \--stack dwindle \
    \--count-master 1 \
    \--ratio-master 0.50 \
    \--count-wide-left 0 \
    \--ratio-wide 0.35 \
    \--smart-gaps \
    \--inner-gaps 6 \
    \--outer-gaps 6 \
    \--border-width 2 \
    \--border-width-monocle 0 \
    \--border-width-smart-gaps 0 \
    \--border-color-focused 0x93a1a1 \
    \--border-color-focused-monocle 0x586e75 \
    \--border-color-unfocused 0x586e75 "
  autoKeyboard =
    [ ("set-repeat ", "50 300")
    , ("focus-follows-cursor ", "normal")
    , ("keyboard-layout -options ", "'grp:alt_shift_toggle' us,ru")
    , ("default-layout ", "wideriver")
    , ("rule-add ", "-app-id wideriver csd")]
  programmStart (x:xs) 
    |xs /= [] = do {
      ;let r = "riverctl spawn " ++ x in callCommand r
      ;programmStart xs 
    }
    |otherwise = return ()
  keyboardStart (x:xs) 
    |xs /= [] = do {
      ;let r = "riverctl " ++ uncurry (++) x in callCommand r
      ;keyboardStart xs 
    }
    |otherwise = return ()
  autoStart = do {
  ;keyboardStart autoKeyboard 
  ;programmStart autoSpawn
  ;callCommand wideriver
  ;return ()
  }
