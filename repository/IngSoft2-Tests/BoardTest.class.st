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
	| sizeOfBoard |
	sizeOfBoard := -1.
	self
		should: [ Board with: sizeOfBoard]
		raise: Error
		withMessageText: 'Board size should be positive'.
]

{ #category : 'tests' }
BoardTest >> testWhenPositionIsOutOfBoardThenIsInvalid [
	| sizeOfBoard aBoard positionOfShip  |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard.
	positionOfShip := 11.
	
	self assert: (aBoard checkLimits: positionOfShip) equals: false
]
