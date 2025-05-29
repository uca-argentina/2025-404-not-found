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
| aBoard aSpaceship1 |
	aBoard := Board with: 20.
	aBoard addWormHolewithEntraceTile:8 exitTile:10.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10.
	
	aSpaceship1 move:8.
	
	self assert: aSpaceship1 fuel equals: 0.
	
]

{ #category : 'tests' }
SpacepshipFuelTest >> testSpaceshipFuelStartsWithMaxDice [
	| aBoard aSpaceship1 |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10.
	
	self assert: aSpaceship1 fuel equals: 10.
	
	
	
	
	
	
]
