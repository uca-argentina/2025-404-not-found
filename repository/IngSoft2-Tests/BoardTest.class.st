Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
BoardTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'tests' }
BoardTest >> testWhenBoardCreatedWithNegativeSizeThenCreationFails [
	| aWormhole sizeOfBoard |
	aWormhole := Wormhole entrance: 2 exit: 6.
	sizeOfBoard := -1.
	self
		should: [ Board with: sizeOfBoard wormhole: aWormhole ]
		raise: Error
		withMessageText: 'Board size should be positive'.
]

{ #category : 'tests' }
BoardTest >> testWhenPositionIsOutOfBoardThenIsInvalid [
	| sizeOfBoard aBoard positionOfShip  aWormhole |
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: sizeOfBoard wormhole: aWormhole.
	positionOfShip := 11.
	
	self deny: (aBoard checkLimits: positionOfShip).
]
