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
	| die1 die2 dice aSpaceship1 aBoard aSpaceship2 spaceships aWormhole |
	
	die1 := Die with: 6.
	die2 := Die with: 6.
	dice := { die1 . die2 }.
	
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: 10 wormhole: aWormhole.
	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard.
	spaceships := { aSpaceship1. aSpaceship2 }.
	
	^ Game with: spaceships andDice: dice andBoard: aBoard.
]
