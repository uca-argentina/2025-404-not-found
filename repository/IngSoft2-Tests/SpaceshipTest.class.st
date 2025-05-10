Class {
	#name : 'SpaceshipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipInitializesOnPosition0 [

	| aSpaceship sizeOfBoard aBoard aWormhole |
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: sizeOfBoard wormhole: aWormhole.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.

	self assert: aSpaceship position equals: 0
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipKnowsItsName [

	| aSpaceship sizeOfBoard aBoard aWormhole |
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: sizeOfBoard wormhole: aWormhole.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.

	self assert: aSpaceship name equals: 'Nave 1'
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesNBoxesAhead [

	| aSpaceship sizeOfBoard aBoard aWormhole |
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: sizeOfBoard wormhole: aWormhole.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship move: 8.

	self assert: aSpaceship position equals: 8
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesOneBoxAhead [

	| aSpaceship sizeOfBoard aBoard aWormhole |
	sizeOfBoard := 10.
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: sizeOfBoard wormhole: aWormhole.
	aSpaceship := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship move: 1.

	self assert: aSpaceship position equals: 1
]
