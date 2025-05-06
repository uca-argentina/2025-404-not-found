Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'spaceShips',
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

{ #category : 'accessing' }
Game >> board [
	^ board

]

{ #category : 'accessing' }
Game >> dice [
	^ dice

]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceShips andDice: someDice andBoard: aBoard [
	spaceShips := someSpaceShips.
	dice := someDice.
	board := aBoard.
]

{ #category : 'accessing' }
Game >> spaceShips [
	^ spaceShips

]
