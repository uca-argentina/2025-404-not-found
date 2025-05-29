Class {
	#name : 'WormholeTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
WormholeTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

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

{ #category : 'tests' }
WormholeTest >> testWhenWormholeEntranceBoxOutsideBoardThenCreationFails [
	| sizeOfBoard aBoard|
	sizeOfBoard := 20.
	aBoard:=Board with: sizeOfBoard.
	self
		should: [ aBoard addWormHolewithEntraceTile:-1 exitTile:6.]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
		
	self
		should: [ aBoard addWormHolewithEntraceTile:22 exitTile:6. ]
		raise: Error
		withMessageText: 'Tile should be inside the board'.
]

{ #category : 'tests' }
WormholeTest >> testWhenWormholeExitBoxOutsideBoardThenCreationFails [
	| sizeOfBoard aBoard|
	sizeOfBoard := 20.
	aBoard:=Board with: sizeOfBoard.
	self
		should: [ aBoard addWormHolewithEntraceTile:2 exitTile:-6. ]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
		
	self
		should: [ aBoard addWormHolewithEntraceTile:2 exitTile:26. ]
		raise: Error
		withMessageText: 'Tile should be inside the board'.
]
