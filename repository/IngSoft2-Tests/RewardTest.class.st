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

]

{ #category : 'tests' }
RewardTest >> test01WhenMaxRollGetsMaxFuelPermanently [
	aGame applyRewardTo: aSpaceship1 withPorcentageOf:100.
	"Inicialmente tiene 10 de fuel, luego tendra un maximo en el tanque de 11, pero recordemos que el fuel que tiene seguira siendo 10 de 11"
	self assert: aSpaceship1 checkFuelCapacity equals:11. "luego de un turno y de moverse 6 lugares quiero que se le sume 1 de fuel"

]

{ #category : 'tests' }
RewardTest >> test02WhenMaxRollGetsOneLessFuel [
	aGame applyRewardTo: aSpaceship1 withPorcentageOf:0.
	"Inicialmente tiene 10 de fuel, pasara a 9 el que tiene, no del tanque"
	self assert: aSpaceship1 fuel equals:9.


]
