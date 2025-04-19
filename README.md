# Prerequistment
1. downkoad nvim 
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
2. check clipboard support
    ```bash
    nvim --version | grep clipboard
    ```

