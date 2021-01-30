# zsh
source ~/.zshrc && compaudit | xargs chmod g-w

# ocaml
opam init
opam pin add -y ocaml-lsp-server git+https://github.com/ocaml/ocaml-lsp.git
opam install -y why3-ide
opam install -y utop
opam install -y ocamlformat
opam install -y ocaml-lsp-server
opam install -y ocaml-base-compiler
opam install -y merlin
opam install -y core
opam install -y alt-ergo

# why3
why-3 config --detect
why3 --list-provers

# python
python3 -m pip install selenium
python3 -m pip install pytest
python3 -m pip install pylint
python3 -m pip install pwn
python3 -m pip install pip-chill
python3 -m pip install ipykernel
python3 -m pip install flask-sqlalchemy
python3 -m pip install autopep8

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
    --install-extension redhat.java \
    --install-extension ocamllabs.ocaml-platform \
    --install-extension ms-vsliveshare.vsliveshare \
    --install-extension ms-vscode.hexeditor \
    --install-extension ms-vscode.cpptools \
    --install-extension ms-vscode-remote.remote-ssh-edit \
    --install-extension ms-vscode-remote.remote-ssh \
    --install-extension ms-vscode-remote.remote-containers \
    --install-extension ms-toolsai.jupyter \
    --install-extension ms-python.vscode-pylance \
    --install-extension ms-python.python \
    --install-extension justusadam.language-haskell \
    --install-extension JHeilingbrunner.vscode-gnupg-tool \
    --install-extension haskell.haskell \
    --install-extension franekp.language-whyml \
    --install-extension equinusocio.vsc-material-theme-icons \
    --install-extension Equinusocio.vsc-material-theme \
    --install-extension Equinusocio.vsc-community-material-theme \
    --install-extension Dart-Code.flutter \
    --install-extension Dart-Code.dart-code \
    --install-extension analytic-signal.preview-pdf
