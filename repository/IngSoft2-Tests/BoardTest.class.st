Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> testWhenPositionIsOutOfBoardThenIsInvalid [
	| sizeOfBoard aBoard positionOfShip  |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard andEntranceHole: 2 andExitHole: 6.
	positionOfShip := 11.
	
	self deny: (aBoard checksLimits: positionOfShip).
]
