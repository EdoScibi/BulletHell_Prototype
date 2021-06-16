# DOCUMENTO DI DESIGN
# Nome del gioco

## Descrizione in pillole
Devi scalare un livello sviluppato in verticale saltando su varie piattaforme.
Al contempo dovrai schivare proiettili/ostacoli/nemici e raccogliere potenziamenti.
Arrivato in cima dovrai affrontare un boss finale utilizzando i potenziamenti raccolti.

```
|      @   |
|    / | \ |
|---       |
|          |
|     ---  |
|---       |
|     ---  |
|          |
|  ---     |
|          |
|--    --  |
|          |
|   @      |
------------
```
## Feeling generale e tematiche
Creepy-toon? Ispirazione: _The Binding of Isaac_ o meglio ancora _Salad Fingers_?

# Descrizioni specifiche

## Il Personaggio
...........

## Piattaforme
Le piattaforme sono composte da elementi quadrati chiamate plat_unit.
Esistono diversi tipi di plat_unit:
- Standard;
- Elastiche: aumentata _bounciness_ per saltare più in alto;
- Scivolose?
- plat_unit _geyser_ : accessibile da sotto, spinge verso l'alto
- Pericolanti?
- Spinate?

## Nemici e pericoli
Durante l'intera scalata, il personaggio sarà bombardato da proiettili di vario tipo che pioveranno principalmente dall'alto. Alcune parti del livello e/o alcune trappole potrebbero far apparire proiettili dai lati dello schermo.

Il gioco dovrebbe comprendere anche un vincolo al personaggio sulla velocità d'ascesa del livello: la telecamera si muove automaticamente verso l'alto, costringendolo a fuggire dal fondo.

In tal modo il giocatore si trova a dover scegliere il percorso più favorevole, anticipando i proprio movimenti anche sulla base dei PowerUp e dei nemici in vista.
```
|   ---   - |  
|-- HELP!  -|  ^^
|   -@--    |  ||
|^^^^^^^^^^^|  ||
|||||||||||||  ||
```
Quindi la telecamera _insegue_ il personaggio se supera il limite superiore della schermata, ma lo rincorre inesorabilmente se lui rallenta.

- Trappole appiccicose?
- Piattaforme spinate?

## Il Boss finale
...........

## PowerUps - Tipi, raccolta, gestione
...........

## Sistema punteggio
Timed? Qual'è il game loop?


## Spunti e potenzialità
- La tipologia di nemici o del livello suggerisce caratteristiche del boss finale.
- Vari tipi di potenziamenti permettono di affrontare la scalata/boss in modi diversi, alcuni boss sono più facili con un determinato set di potenziamenti.
