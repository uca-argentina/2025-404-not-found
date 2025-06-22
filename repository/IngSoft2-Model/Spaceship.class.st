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
		'penalization',
		'exitRoll',
		'fuelTank',
		'cards',
		'minusMoves'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard withMaxFuel: maxFuel [
	(aName size < 1) ifTrue: [ Error signal: 'Name should have at least one character'].
	^ self new initializeWith: aName withBoard: aBoard  withMaxFuel: maxFuel
]

{ #category : 'accessing' }
Spaceship >> cards [
	^cards size
]

{ #category : 'cardLogic' }
Spaceship >> drawCard: aCard [
	cards add: aCard
]

{ #category : 'accessing' }
Spaceship >> fuel [
	^ fuelTank fuel
]

{ #category : 'logic' }
Spaceship >> hasWon: laps [

	^ position hasDoneLaps: laps
]

{ #category : 'initialization' }
Spaceship >> initializeWith: aName withBoard:aBoard withMaxFuel: aMaxFuel [
	board:=aBoard.
	position := Position in: 0 at: 0.
	name := aName.
	fuelTank := FuelTank with: aMaxFuel.
	penalization := 0.
	exitRoll := 0.
	cards := OrderedCollection new.
	minusMoves :=0.
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
	penalization == 0 ifTrue: [ fuelTank refuel ].
	^ true
]

{ #category : 'moving' }
Spaceship >> move: numberOfTiles [

	position := board boardPosition: position + numberOfTiles.
	fuelTank useFuel: numberOfTiles from: self.
	
	
	
]

{ #category : 'accessing' }
Spaceship >> name [
	^ name
]

{ #category : 'logic' }
Spaceship >> penalize [
	position := position backToZero.
	penalization := 2.
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]

{ #category : 'enumerating' }
Spaceship >> reduce: penalty [ 
	minusMoves:=penalty .
]

{ #category : 'moving' }
Spaceship >> refuel [
	fuelTank refuel
]

{ #category : 'initialization' }
Spaceship >> resetToStartWithoutFuelLoss [

	position := position backToZero.
]

{ #category : 'logic' }
Spaceship >> turn: numberOfTiles [
	(numberOfTiles < exitRoll ) ifTrue: [^self].
	exitRoll := 0.
	self move: numberOfTiles-minusMoves .
	board applyTileEffectTo: self.

	
]

{ #category : 'as yet unclassified' }
Spaceship >> useCardAgainst: anotherSpaceship [ 
	| overloadCard |
	overloadCard:= cards detect:[:card | card is:'overload' ] ifNone:[nil].
	overloadCard ifNotNil: [ 
		cards remove: overloadCard.
		board applyCard: overloadCard to:anotherSpaceship 
		].
]
