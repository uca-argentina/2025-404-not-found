Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> testWhenPositionIsOutOfBoardThenIsInvalid [
	| sizeOfBoard aBoard positionOfShip|
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard.
	positionOfShip := 11.
	self deny: (aBoard checksLimits: positionOfShip).
]

{ #category : 'tests' }
BoardTest >> testWhenSpaceShipIsOnHole [
	| sizeOfBoard aBoard  aSpaceship aPosition |
	aPosition:=2.
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard andEntranceHole: 2 andExitHole: 6.
	
	self assert: (aBoard checkHole: aPosition) equals:6.
]

{ #category : 'tests' }
BoardTest >> testWhenSpaceshipLandsOnHoleThenMoves [ 
	| sizeOfBoard aBoard  aSpaceship |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard andEntranceHole: 2 andExitHole: 6.
	aSpaceship:= Spaceship withName: 'Nave 1' withBoard: aBoard .
	
	aSpaceship move:2.
	
	self assert: aSpaceship position equals: 6.
]
