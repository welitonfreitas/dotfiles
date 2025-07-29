# tmux: Folha de Atalhos Essenciais

O **prefixo** está definido como **`Ctrl + a`**. Todos os comandos abaixo devem ser precedidos por essa combinação.

## Sessões

| Atalho                  | Ação                                                 |
| :---------------------- | :--------------------------------------------------- |
| `tmux new -s <nome>`    | Cria uma nova sessão nomeada (executar no terminal). |
| `tmux ls`               | Lista as sessões ativas (executar no terminal).      |
| `tmux attach -t <nome>` | Anexa a uma sessão existente (executar no terminal). |
| `prefixo + d`           | Desanexa da sessão atual.                            |
| `prefixo + $`           | Renomeia a sessão atual.                             |

## Janelas (Windows)

| Atalho               | Ação                                             |
| :------------------- | :----------------------------------------------- |
| `prefixo + c`        | Cria uma nova janela.                            |
| `prefixo + w`        | Lista as janelas de forma interativa.            |
| `prefixo + n`        | Move para a próxima janela.                      |
| `prefixo + p`        | Move para a janela anterior.                     |
| `prefixo + <número>` | Move para a janela pelo seu número.              |
| `prefixo + ,`        | Renomeia a janela atual.                         |
| `prefixo + <`        | Move a janela atual uma posição para a esquerda. |
| `prefixo + >`        | Move a janela atual uma posição para a direita.  |

## Painéis (Panes)

#### Dividindo Painéis

| Atalho        | Ação                                                                |
| :------------ | :------------------------------------------------------------------ | ------------------------------------------------- |
| `prefixo +    | `                                                                   | Divide o painel atual em dois (esquerda/direita). |
| `prefixo + -` | Divide o painel atual em dois (topo/base).                          |
| `prefixo + \` | Divide o painel em dois, usando a largura total (esquerda/direita). |
| `prefixo + _` | Divide o painel em dois, usando a altura total (topo/base).         |

#### Navegando entre Painéis

| Atalho                              | Ação                                             |
| :---------------------------------- | :----------------------------------------------- |
| `prefixo + h` ou `prefixo + Ctrl-h` | Seleciona o painel à esquerda.                   |
| `prefixo + j` ou `prefixo + Ctrl-j` | Seleciona o painel abaixo.                       |
| `prefixo + k` ou `prefixo + Ctrl-k` | Seleciona o painel acima.                        |
| `prefixo + l` ou `prefixo + Ctrl-l` | Seleciona o painel à direita.                    |
| `prefixo + o`                       | Alterna para o próximo painel em ordem numérica. |

#### Redimensionando Painéis

| Atalho        | Ação                                             |
| :------------ | :----------------------------------------------- |
| `prefixo + H` | Redimensiona o painel 5 células para a esquerda. |
| `prefixo + J` | Redimensiona o painel 5 células para baixo.      |
| `prefixo + K` | Redimensiona o painel 5 células para cima.       |
| `prefixo + L` | Redimensiona o painel 5 células para a direita.  |

#### Gerenciando Painéis

| Atalho             | Ação                                                |
| :----------------- | :-------------------------------------------------- |
| `prefixo + x`      | Fecha (mata) o painel atual.                        |
| `prefixo + z`      | Alterna o zoom do painel atual (maximiza/restaura). |
| `prefixo + espaço` | Alterna entre os layouts de painel disponíveis.     |
