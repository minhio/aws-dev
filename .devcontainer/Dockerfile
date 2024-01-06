FROM mcr.microsoft.com/devcontainers/base:jammy

USER vscode

ENV PATH="${PATH}:/home/user/vscode/bin"

RUN curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash
