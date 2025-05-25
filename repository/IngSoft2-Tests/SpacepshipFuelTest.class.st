Class {
	#name : 'SpacepshipFuelTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
SpacepshipFuelTest >> setUp [
	
]

{ #category : 'tests' }
SpacepshipFuelTest >> testSpaceshipFuelDecreaseWithMoves [
	| aBoard aSpaceship1 |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard .
	aSpaceship1 chargeFuel:12.
	
	aSpaceship1 move:1.
	
	self assert: aSpaceship1 fuel equals: 11.
	

]

{ #category : 'tests' }
SpacepshipFuelTest >> testSpaceshipFuelDecreasesInWormHole [
| aBoard aSpaceship1 |
	aBoard := Board with: 20 entranceBox: 8 exitBox: 10.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard .
	aSpaceship1 chargeFuel:12.
	
	aSpaceship1 move:8.
	
	self assert: aSpaceship1 fuel equals: 2.
	
]

{ #category : 'tests' }
SpacepshipFuelTest >> testSpaceshipFuelStartsWithMaxDice [
	| aBoard aSpaceship1 |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard .
	
	aSpaceship1 chargeFuel:12.
	
	self assert: aSpaceship1 fuel equals: 12.
	
	
	
	
	
	
]
