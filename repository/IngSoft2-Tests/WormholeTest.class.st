Class {
	#name : 'WormholeTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnEntranceHoleThenGoesThroughExitHole [
	| aBoard aSpaceship1 |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	
	aBoard addWormHolewithEntraceTile:2 exitTile:6.
	
	aSpaceship1 move: 2.
	
	self assert: aSpaceship1 position equals:(6).
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnExitHoleThenGoesThroughEntranceHole [ 
	| aBoard aSpaceship1 |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	
	aBoard addWormHolewithEntraceTile:2 exitTile:6.
	
	aSpaceship1 move: 6.
	
	self assert: aSpaceship1 position equals:(2).
]
