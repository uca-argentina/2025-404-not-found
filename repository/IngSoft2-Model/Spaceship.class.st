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
		'fuel',
		'maxFuel',
		'penalization'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard [
	(aName size < 1) ifTrue: [ Error signal: 'Name should have at least one character'].
	^ self new initializeWith: aName withBoard: aBoard 
]

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard withMaxFuel: maxFuel [
	(aName size < 1) ifTrue: [ Error signal: 'Name should have at least one character'].
	^ self new initializeWith: aName withBoard: aBoard  withMaxFuel: maxFuel
]

{ #category : 'accessing' }
Spaceship >> chargeFuel: amountFuel [ 
	fuel := fuel + amountFuel.
]

{ #category : 'accessing' }
Spaceship >> checkLaps [
	(board checkLimits: position ) ifFalse: [ 
		doneLaps := doneLaps + 1.
	].
]

{ #category : 'accessing' }
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

{ #category : 'initialization' }
Spaceship >> initializeWith: aName withBoard:aBoard withMaxFuel: aMaxFuel [
	board:=aBoard.
	position := 0.
	name := aName.
	doneLaps := 0.
	fuel := aMaxFuel.
	maxFuel := aMaxFuel.
	penalization := 0.
]

{ #category : 'testing' }
Spaceship >> isPenalized [
	(penalization == 0) ifTrue: [^false].
	penalization := penalization - 1.
	(penalization == 0) ifTrue: [ fuel := maxFuel ].
	^true
]

{ #category : 'accessing' }
Spaceship >> move: numberOfBoxes [ 
	| startPosition dicePosition |
	startPosition := position.
	dicePosition :=position + numberOfBoxes.
	position := position + numberOfBoxes.
	
	self checkLaps.
	
	position := board checkAndRelocate: position.
	(fuel < (dicePosition -startPosition +(position-dicePosition ))) ifTrue: [ 
		position := 0.
		penalization := 2] 
	ifFalse: [fuel := fuel - (dicePosition -startPosition +(position-dicePosition ))].
	
	
]

{ #category : 'accessing' }
Spaceship >> name [
	^ name
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]
