Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> testBanana [
	| sizeOfBoard aBoard positionOfShip|
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard.
	positionOfShip := 11.
	self deny: (aBoard checksLimits: positionOfShip).
]

{ #category : 'tests' }
BoardTest >> testWhenPositionIsOutOfBoardThenIsInvalid [
	| sizeOfBoard aBoard positionOfShip|
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard.
	positionOfShip := 11.
	self deny: (aBoard checksLimits: positionOfShip).
]
