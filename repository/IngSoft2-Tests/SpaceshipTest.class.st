Class {
	#name : 'SpaceshipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipInitializesOnPosition0 [

	| aSpaceship |
	aSpaceship := Spaceship withName: 'Nave 1'.

	self assert: aSpaceship position equals: 0
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipKnowsItsName [

	| aSpaceship |
	aSpaceship := Spaceship withName: 'Nave 1'.

	self assert: aSpaceship name equals: 'Nave 1'
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesNBoxesAhead [

	| aSpaceship sizeOfBoard aBoard |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard andEntranceHole: 2 andExitHole: 6.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship move: 8.

	self assert: aSpaceship position equals: 8
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesOneBoxAhead [

	| aSpaceship sizeOfBoard aBoard |
	sizeOfBoard := 10.
	aBoard := Board with: sizeOfBoard andEntranceHole: 2 andExitHole: 6.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship move: 1.

	self assert: aSpaceship position equals: 1
]
