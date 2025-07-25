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
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 }.
	"Exacto una vuelta         1   2   1   2   1   2 "
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 3 . 4 . 4}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3 . 5 . 5}.
	dice := { aDie1 . aDie2 }.
	lap := 1.
	aGame := Game with: spaceships andDice: dice laps: lap.
	aBoard addWormHolewithEntraceTile: 12 exitTile: 18.
	
]

{ #category : 'tests' }
GameTest >> testAllTheSpaceshipsStartAtPosition0 [
	
	self assert: (aGame spaceships allSatisfy: [ :spaceship | spaceship position = (Position in: 0 at: 0) ]).
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
	
	self assert: aSpaceship1 position equals: (Position in: 6 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 6 at: 0).
]

{ #category : 'tests' }
GameTest >> testWhenADiceIsRolledOneSpaceshipMovesAndTheOtherDoesnt [

	aGame nextTurn.
	
	self assert: aSpaceship1 position equals: (Position in: 6 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0).
	
	
]

{ #category : 'tests' }
GameTest >> testWhenASpaceShipHasFallenIntoWormholeThenItChangesPosition [ 

	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.
	
	self assert: aSpaceship1 position equals: (Position in: 18 at: 0).
	
]

{ #category : 'tests' }
GameTest >> testWhenMultiplesDicesAreRolledTheSumIsCalculatedCorrectly [

	self assert: aGame rollDices equals: 6.
]

{ #category : 'tests' }
GameTest >> testWhenTheDiceIsRolledASpaceshipMoves [

	aGame nextTurn.
	
	self assert: aSpaceship1 position equals: (Position in: 6 at: 0)
	
	
]
