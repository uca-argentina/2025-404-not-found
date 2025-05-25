Class {
	#name : 'GameWithFuelTest',
	#superclass : 'TestCase',
	#instVars : [
		'aDie1',
		'aDie2',
		'dice',
		'aBoard',
		'aSpaceship1',
		'aSpaceship2',
		'spaceships',
		'lap',
		'aGame'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
GameWithFuelTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	"Exacto una vuelta         1 "
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 3 . 1 . 1}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3 . 2 . 2}.
	dice := { aDie1 . aDie2 }.
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10.
	spaceships := { aSpaceship1 }.
	lap := 1.
	aGame := Game with: spaceships andDice: dice laps: lap.
]

{ #category : 'tests' }
GameWithFuelTest >> testWhenSpaceshipRunsOutOfFuelLapsDontIncrement [
	"runs out of fuel"
	aGame nextTurn.
	aGame nextTurn.
		
	self assert: aSpaceship1 fuel equals: 10
	
]

{ #category : 'tests' }
GameWithFuelTest >> testWhenSpaceshipRunsOutOfFuelThenGoesBackToTheBeggining [
	aGame nextTurn.
	aGame nextTurn.
		
	self assert: aSpaceship1 position equals: 0
	
]

{ #category : 'tests' }
GameWithFuelTest >> testWhenSpaceshipRunsOutOfFuelThenLosesTwoTurns [
	"runs out of fuel"
	aGame nextTurn.
	aGame nextTurn.
	"loses two turns"
	aGame nextTurn.
	aGame nextTurn.
		
	self assert: aSpaceship1 position equals: 0
	
]

{ #category : 'tests' }
GameWithFuelTest >> testWhenSpaceshipRunsOutOfFuelThenLosesTwoTurnsAndMovesAgain [
	"runs out of fuel"
	aGame nextTurn.
	aGame nextTurn.
	"loses two turns"
	aGame nextTurn.
	aGame nextTurn.
	"can move"
	aGame nextTurn.
		
	self assert: aSpaceship1 position equals: 6
	
]

{ #category : 'tests' }
GameWithFuelTest >> testWhenTwoTurnsAreSkippedFuelGoesBackToMax [
	"runs out of fuel"
	aGame nextTurn.
	aGame nextTurn.
	"loses two turns"
	aGame nextTurn.
	aGame nextTurn.
		
	self assert: aSpaceship1 fuel equals: 10
	
]
