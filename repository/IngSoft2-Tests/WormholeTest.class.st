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
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	
	self assert: (aBoard checkAndRelocate: aPosition) equals: 6.
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnEntranceHoleThenGoesThroughExitHole [
	| sizeOfBoard aBoard  aSpaceship |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	aSpaceship:= Spaceship withName: 'Nave 1' withBoard: aBoard .
	
	aSpaceship move:2.
	
	self assert: aSpaceship position equals: 6.
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnExitHoleThenGoesThroughEntranceHole [ 
	| sizeOfBoard aBoard  aSpaceship |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	aSpaceship:= Spaceship withName: 'Nave 1' withBoard: aBoard .
	
	aSpaceship move:6.
	
	self assert: aSpaceship position equals: 2.
]
