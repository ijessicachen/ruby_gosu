# Sector Five

## sprites

We are learning sprites with this game
- each one will have its own class that we create instances of in-game

Class Diagram format
|class|
|----|
||
|instance variables|
||
|methods|

### player spaceship
|Player|
|---|
||
|@x|
|@y|
|@angle|
|@image|
|@vx|
|@vy|
||
|initialize()|
|draw()|
|turn\_right()|
|turn\_left()|
|move()|
|accelerate()|

Controlled by the player, will shoot bullets<br>

### enemy ships
|Enemy|
|---|
||
|@x|
|@y|
|@image|
||
|initialize()|
|draw()|
|move()|

Will appear at random x at the top and drop, can be destroyed by bullets<br>

### bullets

### explosions

## General Documenation

button\_down vs button\_down?
- button\_down?(id) will do something over and over if you hold the button down
- button\_down(id) will only do it once until you release then press again.
- both of these methods will be used in this game

