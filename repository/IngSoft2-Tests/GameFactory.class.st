"
game factory
"
Class {
	#name : 'GameFactory',
	#superclass : 'Object',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'build' }
GameFactory class >> buildGame [
	| die1 dice aSpaceship1 aBoard aSpaceship2 spaceships aWormhole die2 |
	
	die1 := LoadedDie with: 3.
	die2 := LoadedDie with: 3.
	dice := { die1 . die2}.
	
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: 50 wormhole: aWormhole.
	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard.
	spaceships := { aSpaceship1. aSpaceship2 }.
	
	^ Game with: spaceships andDice: dice andBoard: aBoard.
]

{ #category : 'build' }
GameFactory class >> buildGameDice: aDieNumber sides: arrSides spaceships: aSpaceshipNumber wormholeEntrance: aBoxEntrance wormholeExit: aBoxExit boardsize: aBoardSize [
	| dice aBoard  spaceships aWormhole |
	
	dice := (1 to: aDieNumber) collect: [ :i | LoadedDie with: arrSides ].
	
	aWormhole := Wormhole entrance: aBoxEntrance exit: aBoxExit.
	aBoard := Board with: aBoardSize wormhole: aWormhole.
	
	spaceships := (1 to: aSpaceshipNumber) collect: [ :i |
        Spaceship withName: ('Nave ', i asString) withBoard: aBoard].
	
	^ Game with: spaceships andDice: dice andBoard: aBoard.
]

{ #category : 'as yet unclassified' }
GameFactory class >> buildGameWithDiceOne: value1 andDiceTwo: value2 [
	| die1 die2 dice aBoard aSpaceship1 aSpaceship2 spaceships aWormhole |

	die1 := LoadedDie with: value1.
	die2 := LoadedDie with: value2.
	dice := { die1. die2 }.

	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: 10 wormhole: aWormhole.

	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard.
	spaceships := { aSpaceship1. aSpaceship2 }.

	^ Game with: spaceships andDice: dice andBoard: aBoard
]
