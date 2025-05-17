"
Spaceship that can move by updating its position
"
Class {
	#name : 'Spaceship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'name',
		'board'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard [
	^ self new initializeWith: aName withBoard: aBoard 
]

{ #category : 'testing' }
Spaceship >> hasWon [
	^ (board checkLimits: position) not
]

{ #category : 'initialization' }
Spaceship >> initializeWith: aName withBoard:aBoard [
	board:=aBoard.
	position := 0.
	name := aName.
]

{ #category : 'accessing' }
Spaceship >> move: numberOfBoxes [ 
	position := position + numberOfBoxes.
	position := board checkHoleAndRelocate: position.
	
]

{ #category : 'accessing' }
Spaceship >> name [
	^ name
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]
