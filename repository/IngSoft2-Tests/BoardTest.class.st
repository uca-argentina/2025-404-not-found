Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> testWhenPositionIsOutOfBoardThenIsInvalid [
	| sizeOfBoard aBoard positionOfShip  aWormhole |
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: sizeOfBoard wormhole: aWormhole.
	positionOfShip := 11.
	
	self deny: (aBoard checksLimits: positionOfShip).
]
