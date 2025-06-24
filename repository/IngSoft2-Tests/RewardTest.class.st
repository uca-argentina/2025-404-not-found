Class {
	#name : 'RewardTest',
	#superclass : 'TestCase',
	#instVars : [
		'aBoard',
		'aSpaceship1',
		'aSpaceship2',
		'spaceships',
		'aDie1',
		'aDie2',
		'dice',
		'lap',
		'aGame',
		'drawCardTile'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
RewardTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	aBoard := Board with: 30. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 10. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 3}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap. 	
	aBoard setGame: aGame. 
	
	drawCardTile := DrawCardTile inPosition: 6.
	aBoard addTile: drawCardTile.
]

{ #category : 'tests' }
RewardTest >> testWhenMaxRollGetsMaxFullPermanently [
	| fullTank |
	fullTank:= aSpaceship1 fuel.
	aSpaceship1 turn:4.
	aSpaceship2 turn:3.
	aSpaceship1 turn:12.
	
	self assert: aSpaceship1 fuel equals: fullTank.

]
