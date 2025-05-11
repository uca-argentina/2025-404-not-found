"
Controls the game functioning and logic
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'spaceships',
		'dice',
		'board'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> with: spaceShips andDice: someDice andBoard: aBoard [ 
	^self new initializeWith: spaceShips andDice: someDice andBoard: aBoard.
]

{ #category : 'accesing' }
Game >> board [ 
	^ board 
]

{ #category : 'accesing' }
Game >> dice [ 
 ^ dice
]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceShips andDice: someDice andBoard: aBoard [ 
	spaceships := someSpaceShips.
	dice := someDice.
	board := aBoard.
]

{ #category : 'accesing' }
Game >> spaceships [
	^ spaceships 
]
