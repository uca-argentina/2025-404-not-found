Class {
	#name : 'CircularGameTest',
	#superclass : 'TestCase',
	#instVars : [
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
CircularGameTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 }.
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 "
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 2}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 1}.
	dice := { aDie1 . aDie2 }.
	lap := 2.
	aGame := Game with: spaceships andDice: dice laps: lap.
]

{ #category : 'tests' }
CircularGameTest >> testWhenSpaceshipGoesBeyondNewLapThenPositionIsNot0 [

	5 timesRepeat: [ aGame nextTurn ].
	
	self assert: aSpaceship1 position equals: 6.
]

{ #category : 'tests' }
CircularGameTest >> testWhenSpaceshipReachesEndOfFinalLapThenWins [

	30 timesRepeat: [ aGame nextTurn ].
	
	self assert: aGame isFinished.
	self assert: (aSpaceship1 hasWon: lap)
]

{ #category : 'tests' }
CircularGameTest >> testWhenSpaceshipReachesEndThenGoesBackToPosition0 [

	4 timesRepeat: [ aGame nextTurn ].
	
	self assert: aSpaceship1 position equals: 0.
]
