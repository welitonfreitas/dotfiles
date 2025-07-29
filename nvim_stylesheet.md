# Stylesheet de Atalhos do NeoVim

## **Navegação e Movimentação**

### Movimentação Geral

| Atalho         | Modo(s)        | Descrição                                                |
| :------------- | :------------- | :------------------------------------------------------- |
| `j` / `<Down>` | Normal, Visual | Move para baixo (considerando quebras de linha)          |
| `k` / `<Up>`   | Normal, Visual | Move para cima (considerando quebras de linha)           |
| `<C-d>`        | Normal         | Rola a página para baixo, mantendo o cursor centralizado |
| `<C-u>`        | Normal         | Rola a página para cima, mantendo o cursor centralizado  |

### Janelas (Windows)

| Atalho       | Modo(s) | Descrição                                                 |
| :----------- | :------ | :-------------------------------------------------------- |
| `<C-h>`      | Normal  | Vai para a janela à esquerda                              |
| `<C-j>`      | Normal  | Vai para a janela abaixo                                  |
| `<C-k>`      | Normal  | Vai para a janela acima                                   |
| `<C-l>`      | Normal  | Vai para a janela à direita                               |
| `<leader>-`  | Normal  | Divide a janela, criando uma nova abaixo (Split Below)    |
| `<leader>\|` | Normal  | Divide a janela, criando uma nova à direita (Split Right) |
| `<leader>wd` | Normal  | Fecha/Deleta a janela atual                               |
| `<C-Up>`     | Normal  | Aumenta a altura da janela                                |
| `<C-Down>`   | Normal  | Diminui a altura da janela                                |
| `<C-Left>`   | Normal  | Diminui a largura da janela                               |
| `<C-Right>`  | Normal  | Aumenta a largura da janela                               |

### Buffers

| Atalho                       | Modo(s) | Descrição                             |
| :--------------------------- | :------ | :------------------------------------ |
| `<S-h>` ou `[b`              | Normal  | Buffer Anterior                       |
| `<S-l>` ou `]b`              | Normal  | Próximo Buffer                        |
| `<leader>bb` ou `<leader>\`` | Normal  | Alterna para o último buffer acessado |
| `<leader>bd`                 | Normal  | Deleta o buffer atual                 |
| `<leader>bo`                 | Normal  | Deleta todos os outros buffers        |
| `<leader>bD`                 | Normal  | Deleta o buffer e a janela            |

### Abas (Tabs)

| Atalho               | Modo(s) | Descrição               |
| :------------------- | :------ | :---------------------- |
| `<leader><tab><tab>` | Normal  | Nova Aba                |
| `<leader><tab>]`     | Normal  | Próxima Aba             |
| `<leader><tab>[`     | Normal  | Aba Anterior            |
| `<leader><tab>l`     | Normal  | Vai para a Última Aba   |
| `<leader><tab>f`     | Normal  | Vai para a Primeira Aba |
| `<leader><tab>d`     | Normal  | Fecha a Aba Atual       |
| `<leader><tab>o`     | Normal  | Fecha as Outras Abas    |

---

## **Edição de Código**

### Movimentação de Linhas e Blocos

| Atalho  | Modo(s)          | Descrição                           |
| :------ | :--------------- | :---------------------------------- |
| `<A-j>` | Normal, Inserção | Move a linha/bloco atual para baixo |
| `<A-k>` | Normal, Inserção | Move a linha/bloco atual para cima  |
| `J`     | Normal           | Junta a linha de baixo com a atual  |
| `J`     | Visual           | Move a seleção para baixo           |
| `K`     | Visual           | Move a seleção para cima            |

### Indentação e Comentários

| Atalho | Modo(s) | Descrição                                 |
| :----- | :------ | :---------------------------------------- |
| `<`    | Visual  | Diminui a indentação do bloco selecionado |
| `>`    | Visual  | Aumenta a indentação do bloco selecionado |
| `gco`  | Normal  | Adiciona uma linha de comentário abaixo   |
| `gcO`  | Normal  | Adiciona uma linha de comentário acima    |

### Formatação e Arquivos

| Atalho       | Modo(s)        | Descrição                      |
| :----------- | :------------- | :----------------------------- |
| `<C-s>`      | Todos          | Salva o arquivo                |
| `<leader>cf` | Normal, Visual | Formata o código               |
| `<leader>fn` | Normal         | Cria um novo arquivo em branco |

---

## **LSP (Language Server Protocol) e Ações de Código**

### Navegação e Informação

| Atalho       | Modo(s)  | Descrição                                      |
| :----------- | :------- | :--------------------------------------------- |
| `gd`         | Normal   | Ir para a Definição                            |
| `gr`         | Normal   | Mostrar Referências                            |
| `gI`         | Normal   | Ir para a Implementação                        |
| `gy`         | Normal   | Ir para a Definição de Tipo (Type)             |
| `gD`         | Normal   | Ir para a Declaração                           |
| `K`          | Normal   | Mostra informações ao passar o mouse (Hover)   |
| `gK`         | Normal   | Ajuda de Assinatura da Função (Signature Help) |
| `<c-k>`      | Inserção | Ajuda de Assinatura da Função (Signature Help) |
| `<leader>cl` | Normal   | Mostra informações sobre o LSP ativo           |

### Ações e Renomeação

| Atalho       | Modo(s)        | Descrição                                      |
| :----------- | :------------- | :--------------------------------------------- |
| `<leader>ca` | Normal, Visual | Ação de Código (Code Action)                   |
| `<leader>cr` | Normal         | Renomeia o símbolo sob o cursor                |
| `<leader>cR` | Normal         | Renomeia o arquivo e atualiza suas referências |
| `<leader>cc` | Normal         | Executa o Codelens                             |
| `<leader>cC` | Normal         | Atualiza e exibe o Codelens                    |

### Diagnósticos

| Atalho       | Modo(s) | Descrição                                 |
| :----------- | :------ | :---------------------------------------- |
| `<leader>cd` | Normal  | Mostra diagnósticos da linha em um pop-up |
| `]d` / `[d`  | Normal  | Próximo / Anterior Diagnóstico            |
| `]e` / `[e`  | Normal  | Próximo / Anterior Erro                   |
| `]w` / `[w`  | Normal  | Próximo / Anterior Aviso (Warning)        |

---

## **Integração Git**

| Atalho       | Modo(s)        | Descrição                                             |
| :----------- | :------------- | :---------------------------------------------------- |
| `<leader>gg` | Normal         | Abre o Lazygit no diretório raiz do projeto           |
| `<leader>gG` | Normal         | Abre o Lazygit no diretório atual                     |
| `<leader>gl` | Normal         | Mostra o log do Git para o projeto                    |
| `<leader>gL` | Normal         | Mostra o log do Git para o diretório atual (cwd)      |
| `<leader>gf` | Normal         | Mostra o histórico do arquivo atual                   |
| `<leader>gb` | Normal         | Mostra o "blame" da linha atual                       |
| `<leader>gB` | Normal, Visual | Abre o link do commit/bloco no navegador (Git Browse) |
| `<leader>gY` | Normal, Visual | Copia o link do commit/bloco (Git Browse)             |

---

## **Geral e Utilitários**

### Pesquisa

| Atalho       | Modo(s)          | Descrição                                                   |
| :----------- | :--------------- | :---------------------------------------------------------- |
| `<esc>`      | Inserção, Normal | Limpa o realce da busca (hlsearch) e para snippets          |
| `<leader>ur` | Normal           | Limpa o realce da busca e atualiza a tela                   |
| `n`          | Normal, Visual   | Próximo resultado da busca, mantendo o cursor centralizado  |
| `N`          | Normal, Visual   | Resultado anterior da busca, mantendo o cursor centralizado |

### Listas (Quickfix e Location)

| Atalho       | Modo(s) | Descrição                       |
| :----------- | :------ | :------------------------------ |
| `<leader>xq` | Normal  | Abre/Fecha a lista Quickfix     |
| `<leader>xl` | Normal  | Abre/Fecha a Location List      |
| `]q`         | Normal  | Próximo item na lista Quickfix  |
| `[q`         | Normal  | Item anterior na lista Quickfix |

### Terminal

| Atalho                  | Modo(s)  | Descrição                                       |
| :---------------------- | :------- | :---------------------------------------------- |
| `<leader>ft` ou `<c-/>` | Normal   | Abre um terminal flutuante (no diretório raiz)  |
| `<leader>fT`            | Normal   | Abre um terminal flutuante (no diretório atual) |
| `<C-/>`                 | Terminal | Fecha a janela do terminal                      |

### Outros

| Atalho       | Modo(s) | Descrição                                    |
| :----------- | :------ | :------------------------------------------- |
| `<leader>qq` | Normal  | Sair de todas as janelas (Quit All)          |
| `<leader>l`  | Normal  | Abre a interface do Lazy.nvim                |
| `<leader>ui` | Normal  | Inspeciona a posição e o highlight do cursor |
| `<leader>uI` | Normal  | Inspeciona a árvore do Treesitter            |
