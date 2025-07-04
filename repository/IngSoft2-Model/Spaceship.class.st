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
		'minusMoves',
		'ally',
		'rollAddOn'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard: aBoard withMaxFuel: maxFuel [

	aName size < 1 ifTrue: [
		Error signal: 'Name should have at least one character' ].
	^ self new initializeWith: aName withBoard: aBoard	 withMaxFuel: maxFuel withCards: nil
]

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard withMaxFuel: maxFuel withCards: cards [
	(aName size < 1) ifTrue: [ Error signal: 'Name should have at least one character'].
	^ self new initializeWith: aName withBoard: aBoard  withMaxFuel: maxFuel withCards: cards
]

{ #category : 'as yet unclassified' }
Spaceship >> allyWith: aSpaceship [
	ally := aSpaceship.
	
]

{ #category : 'as yet unclassified' }
Spaceship >> askForFuel: fuelNeeded [
	ally ifNil: [ ^false ].
	^ally shareFuel: fuelNeeded
]

{ #category : 'as yet unclassified' }
Spaceship >> breakAlliance [

	ally := nil
]

{ #category : 'accessing' }
Spaceship >> cards [
	^cards size
]

{ #category : 'as yet unclassified' }
Spaceship >> checkFuelCapacity [
^fuelTank maxFuel

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

{ #category : 'as yet unclassified' }
Spaceship >> increaseMaxFuelBy: aNumberToIncreaseTank [
	fuelTank increaseSize:aNumberToIncreaseTank.

]

{ #category : 'initialization' }
Spaceship >> initializeWith: aName withBoard: aBoard withMaxFuel: aMaxFuel withCards: someCards [
	board:=aBoard.
	position := Position in: 0 at: 0.
	name := aName.
	fuelTank := FuelTank with: aMaxFuel.
	penalization := 0.
	exitRoll := 0.
	cards := someCards.
	minusMoves :=0.
	ally := nil.
	rollAddOn := 0.
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

{ #category : 'as yet unclassified' }
Spaceship >> modifyRoll: aNumber [
	rollAddOn := rollAddOn + aNumber.
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

{ #category : 'as yet unclassified' }
Spaceship >> reduceFuelBy:aNumber [
	fuelTank useFuel: 1 from: self.

]

{ #category : 'moving' }
Spaceship >> refuel [
	fuelTank refuel
]

{ #category : 'initialization' }
Spaceship >> resetToStartWithoutFuelLoss [

	position := position backToZero.
]

{ #category : 'as yet unclassified' }
Spaceship >> shareFuel: fuelNeeded [
	^fuelTank shareFuel: fuelNeeded from: self.
	
	
]

{ #category : 'logic' }
Spaceship >> turn: toMove [

	toMove < exitRoll ifTrue: [ ^ self ].
	nil.
	exitRoll := 0.
	self move: toMove + rollAddOn.
	board applyTileEffectTo: self
]

{ #category : 'as yet unclassified' }
Spaceship >> turn: aNumber playCard: aCard against: aSpaceship in:aGame [
	self useCard: aCard against:aSpaceship during:aGame .
	self turn: aNumber 
]

{ #category : 'as yet unclassified' }
Spaceship >> useCancellationOn: cardToRemove inGame: aGame [
	| cancellationCard |
	cancellationCard := cards detect: [:c | c action class = Cancellation] ifNone: [ Error signal:'No cancellation card was found' ].
	cards remove: cancellationCard.
	aGame removeCard: cardToRemove . 
   ^cancellationCard 
]

{ #category : 'as yet unclassified' }
Spaceship >> useCard: aCard against: aSpaceship during: aGame [
	| cardToUse |
	cardToUse := cards detect: [:c | c == aCard ] ifNone: [ Error signal:'The chosen card was not found' ].
	cardToUse useAgainst: aSpaceship from: self during: aGame.
	cards remove: (cards at: 1).
]

{ #category : 'as yet unclassified' }
Spaceship >> useCard: aCard against: aSpaceship in: aGame [
	| cardToUse |
	cardToUse := cards detect: [:c | c == aCard ] ifNone: [ Error signal:'The chosen card was not found' ].
	cardToUse useAgainst: aSpaceship from: self in: aGame.
	cards remove: (cards at: 1).
]

{ #category : 'as yet unclassified' }
Spaceship >> useCardAgainst: aSpaceship in: aGame [
	(cards at: 1) useAgainst: aSpaceship from: self in: aGame.
	cards remove: (cards at: 1).
]
