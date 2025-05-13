Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> testAllTheSpaceshipsStartAtPosition0 [
	| aGame |

	aGame := GameFactory buildGame.

	self assert: (aGame spaceships anySatisfy: [ :spaceship | spaceship position = 0 ]).
]

{ #category : 'tests' }
GameTest >> testBanana [ 
	| aBoard aSpaceship1 aSpaceship2 aDie spaceShips aGame aWormhole |
	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: 10 wormhole: aWormhole.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard.
	spaceShips := [aSpaceship1,aSpaceship2].
	aDie := Die with: 6.
	aGame := Game with: spaceShips andDice: aDie andBoard: aBoard.
]

{ #category : 'tests' }
GameTest >> testGameInitialization [ 
	| aBoard aSpaceship1 aSpaceship2 aspaceShips aDie dice aGame aWormhole |

	aWormhole := Wormhole entrance: 2 exit: 6.
	aBoard := Board with: 10 wormhole: aWormhole.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard.
	aspaceShips := { aSpaceship1. aSpaceship2 }.
	aDie := Die with: 6.
	dice := { aDie }.

	aGame := Game with: aspaceShips andDice: dice andBoard: aBoard.

	self assert: aGame spaceships size equals: 2.
	self assert: (aGame spaceships anySatisfy: [ :s | s name = 'Nave 1' ]).
	self assert: aGame board equals: aBoard.
]

{ #category : 'tests' }
GameTest >> testWhenADiceIsRolledOneSpaceshipMovesAndTheOtherDoesnt [
	| aSpaceship1 spaceships aGame aSpaceship2 |

	aGame := GameFactory buildGame.
	aGame nexTurn.
	spaceships := aGame spaceships.
	aSpaceship1 := spaceships at: 1.
	aSpaceship2 := spaceships at: 2.
	
	self assert: aSpaceship1 position equals: 3.
	self assert: aSpaceship2 position equals: 0.
	
	
]

{ #category : 'tests' }
GameTest >> testWhenMultiplesDicesAreRolledTheSumIsCalculatedCorrectly [
	| aGame result |

	aGame := GameFactory buildGame.
	result := aGame rollDices.

	self assert: (result = 6 ).
]

{ #category : 'tests' }
GameTest >> testWhenTheDiceIsRolledASpaceshipMoves [
	| aSpaceship1 spaceships aGame |

	aGame := GameFactory buildGame.
	aGame nexTurn.
	spaceships := aGame spaceships.
	aSpaceship1 := spaceships at: 1.
	
	self assert: aSpaceship1 position equals: 3
	
	
]
