v# haskell-learn

My attempts at learning Haskell

## Setup

<https://www.haskell.org/get-started/>
<https://www.haskell.org/ghcup/#>
<https://wiki.haskell.org/How_to_write_a_Haskell_program>

```bash
# https://www.haskell.org/ghcup/install/#system-requirements
sudo apt-get update
sudo apt install libgmp-dev

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

```txt
System requirements 
  Please ensure the following distro packages are installed before continuing (you can exit ghcup and return at any time): build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config

---

All done!

To start a simple repl, run:
  ghci

To start a new haskell project in the current directory, run:
  cabal init --interactive

To install other GHC versions and tools, run:
  ghcup tui

If you are new to Haskell, check out https://www.haskell.org/ghcup/steps/
```

## Problema Could not find module con Stack

<https://www.linkedin.com/pulse/haskell-visual-studio-code-windows-vivek-kumar-cqf/>

## Problema Could not find module con Cabal

(Fa funzionare cabal run ma non HLS in VSCode)

```txt
You need to add `src/source` to `hs-source-dirs` in your `.cabal` file

    -- Modules included in this executable, other than Main.
    other-modules:
        Frame
...


```

<https://www.reddit.com/r/haskell/comments/18c4ne7/haskell_project_build_issue_modules_in/>

Configurazione HLS (per file hie)
<https://haskell-language-server.readthedocs.io/en/latest/configuration.html>

## Tutorial cabal

<https://www.youtube.com/watch?v=-DHEmrKhjCM>

## Tutorial scrivi applicazione blog (per capitolo test)

<https://learn-haskell.blog/08-testing.html>

## Problema hspec-discover

<https://github.com/haskell/haskell-language-server/pull/177/files>

ln -s  /home/vscode/.cabal/store/ghc-9.4.8/hspec-discover-2.11.9-e-hspec-discover-fcdb61dfabc4e9b7bbea25a3c5f12afdd42a675c06f09570e3c6c7fde5da2858/bin/hspec-discover  /home/vscode/.ghcup/bin/hspec-discover


## ghci utf-8

Vedere se si può aggiustare l'immagine Docker 

LANG=en_US.UTF-8 ghci