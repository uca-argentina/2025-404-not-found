Class {
	#name : 'WormholeTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
WormholeTest >> testWhenABoxIsAWormhole [
	| sizeOfBoard aBoard aPosition |
	aPosition:=2.
	sizeOfBoard := 10.
	"aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6."
	aBoard := Board with: 20.
	
	aBoard addWormHolewithEntraceTile:2 exitTile:6.
	
	self assert: (aBoard checkAndRelocate: aPosition) equals: 6.
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnEntranceHoleThenGoesThroughExitHole [
	| aBoard aSpaceship1 |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.

	aBoard := Board with: 20.
	
	aBoard addWormHolewithEntraceTile:2 exitTile:6.
	
	
	aSpaceship1 move: 2.
	
	self assert: aSpaceship1 position equals:(6).
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnExitHoleThenGoesThroughEntranceHole [ 
	| sizeOfBoard aBoard  aSpaceship |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	aSpaceship:= Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 20.
	
	aSpaceship move:6.
	
	self assert: aSpaceship position equals: 2.
]
