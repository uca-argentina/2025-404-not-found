Class {
	#name : 'BoardTileEffectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTileEffectTest >> testWhenBlackHoleEffectIsApliedThenFuelGoesDown [
	| aBoard aSpaceship1 blackHole |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	
	blackHole := BlackHole new.
	blackHole position: 9.
	aBoard addTile: blackHole.
	
	aSpaceship1 move: 9.
	
	self assert: aSpaceship1 fuel equals: 17.
	

]

{ #category : 'tests' }
BoardTileEffectTest >> testWhenGoingBackwardsCanReduceOneLap [
	| aBoard aSpaceship1 blackHole |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	
	blackHole := BlackHole new.
	blackHole position: 2.
	aBoard addTile: blackHole.
	
	aSpaceship1 move: 2.
	
	self assert: aSpaceship1 position equals: 18.
	

]

{ #category : 'tests' }
BoardTileEffectTest >> testWhenSpaceShipLandsOnBlackHoleMovesBackwardsThenNoOtherEffectIsApplied [
	| aBoard aSpaceship1 blackHole blackHole2 |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	
	blackHole := BlackHole new.
	blackHole position: 9.
	aBoard addTile: blackHole.
	blackHole2 := BlackHole new.
	blackHole2 position: 5.
	aBoard addTile: blackHole2.
	
	aSpaceship1 move: 9.
	
	self assert: aSpaceship1 position equals:(5).
	

]

{ #category : 'tests' }
BoardTileEffectTest >> testWhenSpaceShipLandsOnBlackHoleThenItMovesBackwards [
	| aBoard aSpaceship1 blackHole |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.

	blackHole := BlackHole new.
	blackHole position: 9.
	aBoard addTile: blackHole.
	
	aSpaceship1 move: 9.
	
	self assert: aSpaceship1 position equals:(5).
	

]
