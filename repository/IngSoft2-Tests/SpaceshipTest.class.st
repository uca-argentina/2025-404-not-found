Class {
	#name : 'SpaceshipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
SpaceshipTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'tests' }
SpaceshipTest >> testSpacheShipWithEmptyNameThenCreationFails [

	| aSpaceship sizeOfBoard aBoard |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	
	self
		should: [ aSpaceship := Spaceship withName: '' withBoard: aBoard. ]
		raise: Error
		withMessageText: 'Name should have at least one character'
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipInitializesOnPosition0 [

	| aSpaceship sizeOfBoard aBoard |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.

	self assert: aSpaceship position equals: 0
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipKnowsItsName [

	| aSpaceship sizeOfBoard aBoard |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.

	self assert: aSpaceship name equals: 'Nave 1'
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesNBoxesAhead [

	| aSpaceship sizeOfBoard aBoard |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship move: 8.

	self assert: aSpaceship position equals: 8
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesOneBoxAhead [

	| aSpaceship sizeOfBoard aBoard |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard entranceBox: 2 exitBox: 6.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship move: 1.

	self assert: aSpaceship position equals: 1
]
