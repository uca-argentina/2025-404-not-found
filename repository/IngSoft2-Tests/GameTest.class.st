Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#instVars : [
		'aWormhole',
		'aBoard',
		'aSpaceship1',
		'aSpaceship2',
		'spaceships',
		'aDie1',
		'aDie2',
		'dice',
		'aGame',
		'lap'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
GameTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 }.
	"Exacto una vuelta         1   2   1   2   1   2 "
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 3 . 1 . 1}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3 . 2 . 2}.
	dice := { aDie1 . aDie2 }.
	lap := 1.
	aGame := Game with: spaceships andDice: dice laps: lap.
]

{ #category : 'tests' }
GameTest >> testAllTheSpaceshipsStartAtPosition0 [
	
	self assert: (aGame spaceships allSatisfy: [ :spaceship | spaceship position = 0 ]).
]

{ #category : 'tests' }
GameTest >> testGameEndsWhenAShipWins [
	
	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.
	
	"self assert: aGame isFinished."
	self assert: (aSpaceship1 hasWon: lap)
	
	
	
	
]

{ #category : 'tests' }
GameTest >> testGameInitialization [ 

	self assert: aGame spaceships size equals: 2.
	self assert: (aGame spaceships anySatisfy: [ :s | s name = 'Nave 1' ]).
]

{ #category : 'tests' }
GameTest >> testTwoShipsMoveInDifferentTurns [ 

	aGame nextTurn.
	aGame nextTurn.
	
	self assert: aSpaceship1 position equals: 6.
	self assert: aSpaceship2 position equals: 6.
]

{ #category : 'tests' }
GameTest >> testWhenADiceIsRolledOneSpaceshipMovesAndTheOtherDoesnt [

	aGame nextTurn.
	
	self assert: aSpaceship1 position equals: 6.
	self assert: aSpaceship2 position equals: 0.
	
	
]

{ #category : 'tests' }
GameTest >> testWhenASpaceShipHasFallenIntoWormholeThenItChangesPosition [ 

	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.
	
	self assert: aSpaceship1 position equals: 18.
	
]

{ #category : 'tests' }
GameTest >> testWhenMultiplesDicesAreRolledTheSumIsCalculatedCorrectly [

	self assert: aGame rollDices equals: 6.
]

{ #category : 'tests' }
GameTest >> testWhenTheDiceIsRolledASpaceshipMoves [

	aGame nextTurn.
	
	self assert: aSpaceship1 position equals: 6
	
	
]
