"
Spaceship that can move by updating its position
"
Class {
	#name : 'Spaceship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'name',
		'board',
		'doneLaps',
		'fuel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard [
	(aName size < 1) ifTrue: [ Error signal: 'Name should have at least one character'].
	^ self new initializeWith: aName withBoard: aBoard 
]

{ #category : 'as yet unclassified' }
Spaceship >> chargeFuel: amountFuel [ 
	fuel := fuel + amountFuel.
]

{ #category : 'instance creation' }
Spaceship >> fuel [
	^fuel
]

{ #category : 'testing' }
Spaceship >> hasWon: requiredLaps [
	^ doneLaps == requiredLaps
]

{ #category : 'initialization' }
Spaceship >> initializeWith: aName withBoard:aBoard [
	board:=aBoard.
	position := 0.
	name := aName.
	doneLaps := 0.
	fuel := 0.
]

{ #category : 'accessing' }
Spaceship >> move: numberOfBoxes [ 
	| startPosition dicePosition |
	startPosition := position.
	dicePosition :=position + numberOfBoxes.
	position := position + numberOfBoxes.
	(board checkLimits: position ) ifFalse: [ 
		doneLaps := doneLaps + 1.
	].
	position := board checkAndRelocate: position.
	fuel := fuel - (dicePosition -startPosition +(position-dicePosition )).
	
]

{ #category : 'accessing' }
Spaceship >> name [
	^ name
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]
