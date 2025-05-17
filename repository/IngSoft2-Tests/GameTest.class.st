Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#instVars : [
		'aWormhole',
		'aBoard',
		'aSpaceship1',
		'aSpaceship2',
		'spaceships',
		'aDie',
		'aDie2',
		'dice',
		'aGame'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
GameTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	aWormhole := Wormhole entrance: 12 exit: 18.
	aBoard := Board with: 20 wormhole: aWormhole.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard.
	spaceships := { aSpaceship1 . aSpaceship2 }.
	aDie := LoadedDie with: 3.
	aDie2 := LoadedDie with: 3.
	dice := { aDie . aDie2 }.
	aGame := Game with: spaceships andDice: dice.
]

{ #category : 'tests' }
GameTest >> testAllTheSpaceshipsStartAtPosition0 [
	
	self assert: (aGame spaceships allSatisfy: [ :spaceship | spaceship position = 0 ]).
]

{ #category : 'tests' }
GameTest >> testGameEndsWhenAShipWins [
	
	aGame nexTurn.
	aGame nexTurn.
	aGame nexTurn.
	aGame nexTurn.
	aGame nexTurn.
	
	self assert: aGame isFinished.
	self assert: aSpaceship1 hasWon.
	
	
	
	
]

{ #category : 'tests' }
GameTest >> testGameInitialization [ 

	self assert: aGame spaceships size equals: 2.
	self assert: (aGame spaceships anySatisfy: [ :s | s name = 'Nave 1' ]).
]

{ #category : 'tests' }
GameTest >> testTwoShipsMoveInDifferentTurns [ 

	aGame nexTurn.
	aGame nexTurn.
	
	self assert: aSpaceship1 position equals: 6.
	self assert: aSpaceship2 position equals: 6.
]

{ #category : 'tests' }
GameTest >> testWhenADiceIsRolledOneSpaceshipMovesAndTheOtherDoesnt [

	aGame nexTurn.
	
	self assert: aSpaceship1 position equals: 6.
	self assert: aSpaceship2 position equals: 0.
	
	
]

{ #category : 'tests' }
GameTest >> testWhenASpaceShipHasFallenIntoWormholeThenItChangesPosition [ 

	aGame nexTurn.
	aGame nexTurn.
	aGame nexTurn.

	self assert: aSpaceship1 position equals: 18.
	
]

{ #category : 'tests' }
GameTest >> testWhenMultiplesDicesAreRolledTheSumIsCalculatedCorrectly [

	self assert: aGame rollDices equals: 6.
]

{ #category : 'tests' }
GameTest >> testWhenTheDiceIsRolledASpaceshipMoves [

	aGame nexTurn.
	
	self assert: aSpaceship1 position equals: 6
	
	
]
