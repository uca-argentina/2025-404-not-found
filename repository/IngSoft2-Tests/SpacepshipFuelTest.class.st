Class {
	#name : 'SpacepshipFuelTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
SpacepshipFuelTest >> testSpaceshipFuelDecreaseWithMoves [
	| aBoard aSpaceship1 |
	aBoard := Board with: 20 .
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10.	
	aSpaceship1 move:1.
	
	self assert: aSpaceship1 fuel equals: 9.
	

]

{ #category : 'tests' }
SpacepshipFuelTest >> testSpaceshipFuelDecreasesInWormHole [
| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame |
	aBoard := Board with: 20.
	aBoard addWormHolewithEntraceTile:8 exitTile:10.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 10.
	spaceships := { aSpaceship1 . aSpaceship2 }.
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap .
	aBoard setGame: aGame.
	aSpaceship1 turn: 8.
	
	self assert: aSpaceship1 fuel equals: 0.
	
]

{ #category : 'tests' }
SpacepshipFuelTest >> testSpaceshipFuelStartsWithMaxDice [
	| aBoard aSpaceship1 |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10.
	
	self assert: aSpaceship1 fuel equals: 10.
	
	
	
	
	
	
]
