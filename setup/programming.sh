# zsh
source ~/.zshrc && compaudit | xargs chmod g-w

# ocaml
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh | sh

opam init
opam switch create default 4.12.0
opam install -y why3-ide
opam install -y utop
opam install -y opam-depext
opam install -y ocamlformat
opam install -y ocaml-lsp-server
opam install -y ocaml-base-compiler
opam install -y merlin
opam install -y core
opam install -y coqide
opam install -y coq
opam install -y alt-ergo

# why3
why-3 config --detect
why3 --list-provers

# Haskell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org| sh

# python
pip3 install -U selenium
pip3 install -U pytest
pip3 install -U pylint
pip3 install -U pwn
pip3 install -U pip-chill
pip3 install -U ipykernel
pip3 install -U flask-sqlalchemy
pip3 install -U autopep8

# vscode
code \
    --install-extension wayou.vscode-todo-highlight \
    --install-extension vscjava.vscode-maven \
    --install-extension vscjava.vscode-java-test \
    --install-extension vscjava.vscode-java-pack \
    --install-extension vscjava.vscode-java-dependency \
    --install-extension vscjava.vscode-java-debug \
    --install-extension VisualStudioExptTeam.vscodeintellicode \
    --install-extension SonarSource.sonarlint-vscode \
    --install-extension roscaj.dafny-vscode \
    --install-extension redhat.java \
    --install-extension ocamllabs.ocaml-platform \
    --install-extension ms-vsliveshare.vsliveshare-pack \
    --install-extension ms-vsliveshare.vsliveshare-audio \
    --install-extension ms-vsliveshare.vsliveshare \
    --install-extension ms-vscode.hexeditor \
    --install-extension ms-vscode.cpptools \
    --install-extension ms-vscode-remote.remote-ssh-edit \
    --install-extension ms-vscode-remote.remote-ssh \
    --install-extension ms-vscode-remote.remote-containers \
    --install-extension ms-toolsai.jupyter \
    --install-extension ms-python.vscode-pylance \
    --install-extension ms-python.python \
    --install-extension maximedenes.vscoq \
    --install-extension justusadam.language-haskell \
    --install-extension JHeilingbrunner.vscode-gnupg-tool \
    --install-extension haskell.haskell \
    --install-extension franekp.language-whyml \
    --install-extension equinusocio.vsc-material-theme-icons \
    --install-extension Equinusocio.vsc-material-theme \
    --install-extension Equinusocio.vsc-community-material-theme \
    --install-extension ecmel.vscode-html-css \
    --install-extension Dart-Code.flutter \
    --install-extension Dart-Code.dart-code \
    --install-extension correctnessLab.dafny-vscode \
    --install-extension asvetliakov.vscode-neovim \
    --install-extension analytic-signal.preview-pdf \
    --install-extension alexcvzz.vscode-sqlite
