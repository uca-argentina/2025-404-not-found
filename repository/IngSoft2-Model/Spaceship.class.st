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

{ #category : 'logic' }
Spaceship >> checkLaps: aPosition [
	doneLaps := doneLaps + (board checkLimits: aPosition)
]

{ #category : 'accessing' }
Spaceship >> doneLaps [
	^ doneLaps
]

{ #category : 'accessing' }
Spaceship >> fuel [
	^fuel
]

{ #category : 'logic' }
Spaceship >> hasWon: requiredLaps [
	^ doneLaps == requiredLaps
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

{ #category : 'logic' }
Spaceship >> managePenalization [
	(penalization == 0) ifTrue: [^false].
	penalization := penalization - 1.
	(penalization == 0) ifTrue: [ self refuel ].
	^true
]

{ #category : 'moving' }
Spaceship >> move: numberOfBoxes [
	[
		self newPosition: numberOfBoxes.
		board applyTileEffectTo: self.
	] on: Error do: [ 
		position := 0.
		penalization := 2.
		fuel := 0.
	]
	
	
]

{ #category : 'accessing' }
Spaceship >> name [
	^ name
]

{ #category : 'moving' }
Spaceship >> newPosition: numberOfBoxes [
	self useFuel: numberOfBoxes.
	self checkLaps: position + numberOfBoxes.
	position := board boardPosition: position + numberOfBoxes.
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]

{ #category : 'moving' }
Spaceship >> refuel [
	fuel := maxFuel.
]

{ #category : 'initialization' }
Spaceship >> resetToStartWithoutFuelLoss [     
	position := 0.
]

{ #category : 'moving' }
Spaceship >> useFuel: numberOfBoxes [
	fuel := fuel - (numberOfBoxes abs).
	(fuel < 0) ifTrue: [ Error signal: 'Ran out of fuel']. 
]
