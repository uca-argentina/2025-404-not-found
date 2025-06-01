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
		'lock',
		'exitRoll'
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
Spaceship >> checkLaps: arg1 [

	doneLaps := doneLaps + (board checkLimits: arg1)
]

{ #category : 'accessing' }
Spaceship >> doneLaps [

	^ doneLaps
]

{ #category : 'accessing' }
Spaceship >> fuel [
	^fuel
]

{ #category : 'testing' }
Spaceship >> hasEnoughFuelFor: delta [
	^ fuel >= delta abs.
]

{ #category : 'logic' }
Spaceship >> hasWon: arg1 [

	^ doneLaps == arg1
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
	lock := false.
	exitRoll := 0.
]

{ #category : 'logic' }
Spaceship >> lockUntil: anExitRoll [
	lock := true.
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

{ #category : 'moving' }
Spaceship >> newPosition: delta [
	| newPos |
	newPos := position + delta.
	
	(self hasEnoughFuelFor: delta) ifFalse: [
		position := 0.
		penalization := 2.
		^self
	].
	self useFuel: delta.
	self checkLaps: newPos.
	position := board boardPosition: newPos.
	"self useFuel: delta.
	self checkLaps: position + delta.
	position := board boardPosition: position + delta."
	
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]

{ #category : 'moving' }
Spaceship >> refuel [

	fuel := maxFuel
]

{ #category : 'initialization' }
Spaceship >> resetToStartWithoutFuelLoss [

	position := 0
]

{ #category : 'logic' }
Spaceship >> tryUnlock: aRoll [
	(aRoll > exitRoll ) ifFalse: [^ self].
	lock := false.
	exitRoll := 0.
]

{ #category : 'as yet unclassified' }
Spaceship >> turn: numberOfTiles [
	self move: numberOfTiles.
	board applyTileEffectTo: self.
]

{ #category : 'moving' }
Spaceship >> useFuel: numberOfTiles [

	fuel := fuel - numberOfTiles abs.
	fuel < 0 ifTrue: [ Error signal: 'Ran out of fuel' ]
]
