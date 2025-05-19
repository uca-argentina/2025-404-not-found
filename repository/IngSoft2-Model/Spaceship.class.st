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
		'doneLaps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard [
	(aName size < 1) ifTrue: [ Error signal: 'Name should have at least one character'].
	^ self new initializeWith: aName withBoard: aBoard 
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
]

{ #category : 'accessing' }
Spaceship >> move: numberOfBoxes [ 
	position := position + numberOfBoxes.
	(board checkLimits: position ) ifFalse: [ 
		doneLaps := doneLaps + 1.
	].
	position := board checkAndRelocate: position.
	
]

{ #category : 'accessing' }
Spaceship >> name [
	^ name
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]
