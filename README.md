# Prerequistment
1. Downoload nvim 
    - Pre-built archives:
    ```bash
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    ```
    - add to shell config
    ```bash
    export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
    ```
    - Check downloaded version
    ```bash
    nvim --version 
    ```
2. Check clipboard support
    ```bash
    nvim --version | grep clipboard
    ```
# Language tools
## C
1. cgland (lsp)
2. cgland-tidy (linter)
- Cannot download in Msaon. 
```bash
sudo apt install clang-tidy
```
3. clang-format (formatter)

## Python
1. pyright (lsp)
2. ruff (linter)
3. black (formatter)
