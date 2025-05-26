Class {
	#name : 'BoardTileEffectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTileEffectTest >> testBanana [
	| aBoard aSpaceship1 blackHole |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	
	blackHole := BlackHole new.
	blackHole position: 9.
	aBoard addEffect: blackHole.
	
	aSpaceship1 move: 9.
	
	self assert: aSpaceship1 position equals:(5).
	"self assert: aSpaceship1 fuel equals:(19)."
	

]

{ #category : 'tests' }
BoardTileEffectTest >> testMoveSpaceshipBackwards [
	| aBoard aSpaceship1 |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	
	aSpaceship1 move: 7.
	aSpaceship1 moveBackwards: 4.
	
	self assert: aSpaceship1 position equals:(3).
	self assert: aSpaceship1 fuel equals:(19).
	

]

{ #category : 'tests' }
BoardTileEffectTest >> testWhenSpaceShipLandsOnBlackHoleThenItMovesBackwards [
	| aBoard aSpaceship1 blackHole |
	aBoard := Board with: 20 entranceBox: 12 exitBox: 18.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	
	blackHole := BlackHole new.
	blackHole position: 9.
	aBoard addEffect: blackHole.
	
	aSpaceship1 move: 9.
	
	self assert: aSpaceship1 position equals:(5).
	"self assert: aSpaceship1 fuel equals:(19)."
	

]
