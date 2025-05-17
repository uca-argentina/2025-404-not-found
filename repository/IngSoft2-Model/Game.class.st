"
Controls the game functioning and logic
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'spaceships',
		'dice',
		'turnNumber',
		'numberSpaceships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Game class >> with: spaceShips andDice: someDice [
	^self new initializeWith: spaceShips andDice: someDice.
]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceShips andDice: someDice [ 
	spaceships := someSpaceShips.
	dice := someDice.
	turnNumber := 1.
	numberSpaceships := spaceships size.
]

{ #category : 'logic' }
Game >> isFinished [
	^ spaceships anySatisfy: [ :ship | ship hasWon ].
]

{ #category : 'logic' }
Game >> nexTurn [

	self isFinished ifTrue: [ ^ self ].
	(spaceships at: turnNumber) move: self rollDices.
	turnNumber := (turnNumber \\ numberSpaceships) + 1.


	
]

{ #category : 'logic' }
Game >> rollDices [
	| resultados |
	resultados := dice collect: [ :dado | dado roll ].
	^ resultados sum.

]

{ #category : 'logic' }
Game >> showStatus [
	| status |
	status := Dictionary new.
	spaceships do: [ :ship  | 
		status at: ship name put: { ship position . ship hasWon}].
	^ status
]

{ #category : 'accessing' }
Game >> spaceships [
	^ spaceships 
]
