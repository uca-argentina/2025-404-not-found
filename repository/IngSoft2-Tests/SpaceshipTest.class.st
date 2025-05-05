Class {
	#name : 'SpaceshipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipInitializesOnPosition0 [

	| aSpaceship |
	aSpaceship := Spaceship new.

	self assert: aSpaceship position equals: 0
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesNBoxesAhead [

	| aSpaceship |
	aSpaceship := Spaceship new.
	aSpaceship move: 6.

	self assert: aSpaceship position equals: 6
]

{ #category : 'tests' }
SpaceshipTest >> testTheSpaceshipMovesOneBoxAhead [

	| aSpaceship |
	aSpaceship := Spaceship new.
	aSpaceship move: 1.

	self assert: aSpaceship position equals: 1
]
