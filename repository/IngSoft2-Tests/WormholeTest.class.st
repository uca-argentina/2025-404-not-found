Class {
	#name : 'WormholeTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
WormholeTest >> testWhenABoxIsAWormhole [
	| sizeOfBoard aBoard aPosition aWormhole |
	aPosition:=2.
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	'aBoard := Board with: sizeOfBoard andEntranceHole: 2 andExitHole: 6.'.
	aBoard := Board initializeWith: sizeOfBoard  wormhole: aWormhole.
	
	self assert: (aBoard checkHoleAndRelocate: aPosition) equals: 6.
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnEntranceHoleThenGoesThroughExitHole [
	| sizeOfBoard aBoard  aSpaceship aWormhole |
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board initializeWith: sizeOfBoard  wormhole: aWormhole.
	aSpaceship:= Spaceship withName: 'Nave 1' withBoard: aBoard .
	
	aSpaceship move:2.
	
	self assert: aSpaceship position equals: 6.
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnExitHoleThenGoesThroughEntranceHole [ 
	| sizeOfBoard aBoard  aSpaceship aWormhole |
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board initializeWith: sizeOfBoard  wormhole: aWormhole.
	aSpaceship:= Spaceship withName: 'Nave 1' withBoard: aBoard .
	
	aSpaceship move:6.
	
	self assert: aSpaceship position equals: 2.
]
