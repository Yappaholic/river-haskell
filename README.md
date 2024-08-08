# River Config Made In Haskell

## To use

For personal use, you need to have GHC installed on your system

There are 2 options on how to use this script:

### With `runhaskell`

This option is worse because it keeps the process running in the background,
taking ~180MB of RAM (yikes!).

Also you need to rename the `Main.hs` file and `module` declaration inside it
to anything else because the `init` file will be main function for the script.

In init:

```haskell
#!/usr/bin/env runhaskell
module Main where
import Foo --Your Name for Main.hs
main :: IO ()
main = do
	Foo.bar --main function inside Foo.hs (Main.hs before)
```

### With compiling

This option keeps `sh` running in the background but it takes only whopping 0B of RAM.

Also to use it you just need to run GHC:

```
ghc -o Main Main.hs
```

`./Main` is already specified in the `init` file

And that's it, ***happy usage***!
