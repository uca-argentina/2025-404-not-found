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
		'penalization',
		'exitRoll'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard withMaxFuel: maxFuel [
	(aName size < 1) ifTrue: [ Error signal: 'Name should have at least one character'].
	^ self new initializeWith: aName withBoard: aBoard  withMaxFuel: maxFuel
]

{ #category : 'logic' }
Spaceship >> checkLaps: newPosition [

	doneLaps := doneLaps + (board checkLimits: newPosition)
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
Spaceship >> hasWon: laps [

	^ doneLaps == laps
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
	exitRoll := 0.
]

{ #category : 'logic' }
Spaceship >> lockUntil: anExitRoll [
	exitRoll := anExitRoll.
]

{ #category : 'logic' }
Spaceship >> managePenalization [

	penalization == 0 ifTrue: [ ^ false ].
	nil.
	penalization := penalization - 1.
	penalization == 0 ifTrue: [ self refuel ].
	^ true
]

{ #category : 'moving' }
Spaceship >> move: numberOfTiles [
	[
		self checkLaps: position + numberOfTiles.
		position := board boardPosition: position + numberOfTiles.
		self useFuel: numberOfTiles.
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

	position := 0
]

{ #category : 'logic' }
Spaceship >> turn: numberOfTiles [
	(numberOfTiles < exitRoll ) ifTrue: [^self].
	exitRoll := 0.
	self move: numberOfTiles.
	board applyTileEffectTo: self.

	
]

{ #category : 'moving' }
Spaceship >> useFuel: numberOfTiles [

	fuel := fuel - numberOfTiles abs.
	fuel < 0 ifTrue: [ Error signal: 'Ran out of fuel' ]
]
