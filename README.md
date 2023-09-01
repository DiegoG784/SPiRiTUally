# SPiRiTUally

Jogo do TCC

Diretório do projeto (como saporra nn aceita pasta vazia, então irei deixar a organização de pastas do jogo aqui mas sinta se a vontade pra sugerir ou mudar proq vc achar melhor):

```
- res://
  - assets (Pasta onde vai ficar alguns arquivos como as imagens, os sons e entre outros)
    - models
    - sounds
      - music
      - sound_effect
    - sprites
  - database (Aqui vai ficar os objetos e recursos específicos que vão ser colocado nas cenas)
    - enemies
    - items
  - entities (Pasta dedicada aos scripts de recursos, cenas e entre outros. Ler anotação nº1)
    - base
      - components (Essa pasta será guardado componentes universais para entidades ou recursos. Ler anotação n2º)
    - enemies
  - managers (Aqui é onde vão ser guardados os scripts globais como o controlador do jogo, de som e entre outros)
  - player (pasta dedicada pro player. Ler anotação n3º)
  - resources (Pasta dedicada á recursos em geral. Talvez será descartado)
  - rooms (Pasta dedicada as cenas do jogo)
    - debug_room (Pasta dedicada para testes)
```

**ANOTAÇÕES:**
  - n1º: Estava pensando em fazer com que essa pasta guarde somente os scripts dos objetos e recursos em geral do jogo, enquanto os seus arquivos de cenas irão ser guardado na pasta `database` para ter facilidade na hora de colocar os objetos em cena. O que você acha disso?
  - n2º: Eu tinha visto um vídeo onde um cara ensina a fazer um estilo de modelar as entidades que eu achei interessante, onde você faz um script que pode ser universal para ambas partes (tipo a vida do player e do inimigo, aí você faz um script universal para os dois). O que você acha disso? Eu posso passar o link do vídeo se você quiser
  - n3º: O que você acha dessa pasta nesse lugar? Será q é melhor colocar dentro da pasta `entities` ou será que é melhor esperar um pouco pra ver como vai ficar?
