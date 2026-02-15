# ⚙️ Winona's Catapult Behavior Mod

> Um mod para Don't Starve Together que altera o comportamento das Catapultas da Winona, trazendo ajustes e melhorias para o jogo.

![Badge DST](https://img.shields.io/badge/Game-Don't%20Starve%20Together-black?logo=steam)
![Badge Lua](https://img.shields.io/badge/Language-Lua-2C2D72?logo=lua&logoColor=white)
![Badge Mod](https://img.shields.io/badge/Type-Game%20Mod-blue)

## 📖 Sobre o Projeto

Este mod foi desenvolvido para ser publicado na **Steam Workshop** do jogo [Don't Starve Together (DST)](https://store.steampowered.com/app/322330/Dont_Starve_Together/). 

O objetivo principal é modificar a inteligência e o comportamento de alvo das **Catapultas da Winona** (Winona's Catapult). Dependendo da atualização recente do jogo, o mod atua para restaurar comportamentos clássicos (`old_winona_catapult_behavior`) ou fornecer um controle tático diferente para os jogadores que utilizam essa personagem.

## 🛠️ Tecnologias e Arquivos

O desenvolvimento de mods para DST utiliza a linguagem **Lua** e a própria engine da Klei Entertainment.

A estrutura de arquivos deste repositório inclui:

```bash
Winona-Catapult-Behavior-mod/
├── modinfo.lua                        # Metadados do mod (nome, versão, autor, descrição)
├── modmain.lua                        # Código fonte principal com a lógica da modificação
├── old_winona_catapult_behavior.tex   # Textura/Imagem utilizada na interface do mod
├── old_winona_catapult_behavior.xml   # Arquivo XML mapeando a textura do mod
└── README.md                          # Esta documentação
```

## 🎮 Como Instalar e Jogar

### Instalação via Steam Workshop (Recomendado)
1. Acesse a página do mod na [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3666540285)
2. Clique no botão verde **"Inscrever-se"** (Subscribe).
3. Abra o jogo, vá em `Mods` -> `Server Mods` e ative o mod.

### Instalação Manual (Para testes/desenvolvimento)
1. Clone este repositório ou baixe o arquivo `.zip`.
2. Extraia a pasta dentro do diretório de mods do seu jogo:
   * **Windows:** `C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together\mods`
   * **Linux:** `~/.steam/steam/steamapps/common/Don't Starve Together/mods`
   * **Mac:** `~/Library/Application Support/Steam/steamapps/common/Don't Starve Together/mods`
3. Inicie o DST, vá na aba de `Mods` e ative-o localmente.
