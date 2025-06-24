Class {
	#name : 'BoardTileTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
BoardTileTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'running' }
BoardTileTest >> testWhenAtomicBombNegativeThenCreationFails [
	self
		should: [AtomicBomb inPosition: -2.]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
]

{ #category : 'running' }
BoardTileTest >> testWhenAtomicBombOutsideBoardThenNotAddedToBoard [
	| atomicBomb aBoard| 	 	
	aBoard := Board with: 20. 
	atomicBomb := AtomicBomb inPosition: 22. 	 	
	self
		should: [aBoard addTile: atomicBomb .]
		raise: Error
		withMessageText: 'Tile should be inside board'.
]

{ #category : 'running' }
BoardTileTest >> testWhenBlackHoleNegativeThenCreationFails [
	self
		should: [BlackHole inPosition: -2.]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
]

{ #category : 'running' }
BoardTileTest >> testWhenBlackHoleOutsideBoardThenNotAddedToBoard [
	| blackHole aBoard| 	 	
	aBoard := Board with: 20. 
	blackHole := BlackHole inPosition: 22. 	 	
	self
		should: [aBoard addTile: blackHole .]
		raise: Error
		withMessageText: 'Tile should be inside board'.
]

{ #category : 'running' }
BoardTileTest >> testWhenHyperGravityNegativeThenCreationFails [
	self
		should: [HyperJump inPosition: -2.]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
]

{ #category : 'running' }
BoardTileTest >> testWhenHyperGravityOutsideBoardThenNotAddedToBoard [
	| hyperGravity aBoard| 	 	
	aBoard := Board with: 20. 
	hyperGravity := HyperGravity inPosition: 22. 	 	
	hyperGravity exitRoll:11.
	self
		should: [aBoard addTile: hyperGravity .]
		raise: Error
		withMessageText: 'Tile should be inside board'.
]

{ #category : 'running' }
BoardTileTest >> testWhenHyperJumpNegativeThenCreationFails [
	self
		should: [HyperJump inPosition: -2.]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
]

{ #category : 'running' }
BoardTileTest >> testWhenHyperJumpOutsideBoardThenNotAddedToBoard [
	| hyperJump aBoard| 	 	
	aBoard := Board with: 20. 
	hyperJump := HyperJump inPosition: 22. 	 	
	hyperJump convert: 2 with: (Parsec with:(aBoard size)) and: {Parsec with:10 . Parsec with:12 .Parsec with:8 . Parsec with:5 . Parsec with:3. Parsec with:2} .
	self
		should: [aBoard addTile: hyperJump .]
		raise: Error
		withMessageText: 'Tile should be inside board'.
]

{ #category : 'running' }
BoardTileTest >> testWhenMoonWalkNegativeThenCreationFails [
	self
		should: [MoonWalk inPosition: -2.]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
]

{ #category : 'running' }
BoardTileTest >> testWhenMoonWalkOutsideBoardThenNotAddedToBoard [
	| moonWalk aBoard| 	 	
	aBoard := Board with: 20. 
	moonWalk := MoonWalk inPosition: 22. 	
	moonWalk tilesToBack: 3.
	self
		should: [aBoard addTile: moonWalk .]
		raise: Error
		withMessageText: 'Tile should be inside board'.
]
