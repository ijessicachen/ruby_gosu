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
|@radius|
|@x|
|@y|
|@vx|
|@vy|
|@angle|
|@force|
|@left|
|@right|
|@window|
|@ships|
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
|@radius|
|@x|
|@y|
|@image|
||
|initialize()|
|draw()|
|move()|

Will appear at random x at the top and drop, can be destroyed by bullets<br>

### bullets
|Bullet|
|---|
||
|@window|
|@x|
|@y|
|@direction|
|@image|
|@radius|
||
|initialize()|
|draw()|
|move()|

### explosions
Will be multiple sprites because this is an animation
|Explosion|
|---|
||
|@window|
|@x|
|@y|
|@images|
|@image\_index|
|@finished|
||
|initialize()|
|draw()|

## General Documenation

button\_down vs button\_down?
- button\_down?(id) will do something over and over if you hold the button down
- button\_down(id) will only do it once until you release then press again.
- both of these methods will be used in this game

This is our first time working with arrays and the book has mentioned some ruby methods we will be using, more can be found about them [here](https://ruby-doc.org//core-2.0.0/Array.html)<br>

attr\_reader
- helps get instance variables by creating methods that return said variable, very cool!
