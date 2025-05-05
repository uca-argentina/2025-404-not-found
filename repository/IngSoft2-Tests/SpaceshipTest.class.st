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

	| aSpaceship |
	aSpaceship := Spaceship withName: 'Nave 1'.
	aSpaceship move: 6.

	self assert: aSpaceship position equals: 6
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesOneBoxAhead [

	| aSpaceship |
	aSpaceship := Spaceship withName: 'Nave 1'.
	aSpaceship move: 1.

	self assert: aSpaceship position equals: 1
]
