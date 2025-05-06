Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> testBanana [
	| aBoard aSpaceship1 aSpaceship2 aDie spaceShips aGame |
	aBoard := Board with: 10 andEntranceHole: 2 andExitHole: 6.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard.
	spaceShips := [aSpaceship1,aSpaceship2].
	aDie := Die with: 6.
	aGame := Game with: spaceShips andDice: aDie andBoard: aBoard.
]

{ #category : 'tests' }
GameTest >> testGameInitialization [
	| aBoard aSpaceship1 aSpaceship2 aspaceShips aDie dice aGame |

	aBoard := Board with: 10 andEntranceHole: 2 andExitHole: 6.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard.
	aspaceShips := { aSpaceship1. aSpaceship2 }.
	aDie := Die with: 6.
	dice := { aDie }.

	aGame := Game with: aspaceShips andDice: dice andBoard: aBoard.

	self assert: aGame spaceShips size = 2.
	self assert: (aGame spaceShips anySatisfy: [ :s | s name = 'Nave 1' ]).
	self assert: aGame board = aBoard.
]
