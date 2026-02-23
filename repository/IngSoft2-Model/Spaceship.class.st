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
		'rollAddOn',
		'jailTime'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard: aBoard withMaxFuel: maxFuel [

	aName size < 1 ifTrue: [
		Error signal: 'Name should have at least one character' ].
	^ self new initializeWith: aName withBoard: aBoard	 withMaxFuel: maxFuel withCards: OrderedCollection new.
]

{ #category : 'instance creation' }
Spaceship class >> withName: aName withBoard:aBoard withMaxFuel: maxFuel withCards: cards [
	(aName size < 1) ifTrue: [ Error signal: 'Name should have at least one character'].
	^ self new initializeWith: aName withBoard: aBoard  withMaxFuel: maxFuel withCards: cards
]

{ #category : 'accessing' }
Spaceship >> ally [
^ally
]

{ #category : 'cardLogic' }
Spaceship >> allyWith: aSpaceship [
	ally := ActiveAlliance with:aSpaceship .
	
]

{ #category : 'cardLogic' }
Spaceship >> breakAlliance [
	ally:=NoAlliance new.
	
]

{ #category : 'moving' }
Spaceship >> canExecuteMove:toMove [
	(toMove < exitRoll) ifTrue: [ ^ false ].

    "2. Validación de estado de salto (Skip)"
    (self manageSkip) ifTrue: [ ^ false ].

    "3. Validación de estado de cárcel (Jail)"
    "Si manageJail devuelve true, significa que está atrapado [cite: 17]"
    (self manageJail: toMove) ifTrue: [ ^ false ].

    "Si pasó todas las validaciones, el camino está libre"
    ^ true
]

{ #category : 'accessing' }
Spaceship >> cards [
	^cards size
]

{ #category : 'accessing' }
Spaceship >> checkFuelCapacity [
^fuelTank maxFuel

]

{ #category : 'cardLogic' }
Spaceship >> drawCard: aCard [
	cards add: aCard
]

{ #category : 'accessing' }
Spaceship >> fuelTank [
	^fuelTank 
	
	
]

{ #category : 'logic' }
Spaceship >> getRewardWithPorcentage:aPorcentage [
	| randomNumber |

    randomNumber := (Random new next * 100) rounded.

    randomNumber <= aPorcentage
        ifTrue: [ self increaseMaxFuelBy: 1 ]
        ifFalse: [ self reduceFuelBy: 1 ].
	
]

{ #category : 'logic' }
Spaceship >> goToJailIn:aPosition [
	position := Position in:aPosition at:0.
	jailTime:=1.
]

{ #category : 'logic' }
Spaceship >> hasWon: laps [
	^ position hasDoneLaps: laps
]

{ #category : 'moving' }
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
	ally:=NoAlliance new.
	rollAddOn := 0.
	jailTime :=0.
]

{ #category : 'accessing' }
Spaceship >> isAheadOf:anotherSpaceship [
	^ (self position lap > anotherSpaceship position lap) or: [ 
        (self position lap = anotherSpaceship position lap) and: [ 
            self position index > anotherSpaceship position index ] ]
]

{ #category : 'logic' }
Spaceship >> lockUntil: anExitRoll [
	exitRoll := anExitRoll.
]

{ #category : 'logic' }
Spaceship >> manageJail: aRoll [
	(aRoll isNumber )ifTrue: [  
		(board gotMaxRoll: aRoll) ifTrue:[
		jailTime:=0.
		].
		^jailTime = 1.
	]
	 ifFalse: [jailTime:=0.].
	
	
	
	
]

{ #category : 'logic' }
Spaceship >> managePenalization [
	penalization isZero ifTrue: [ ^ false ].

	penalization := penalization - 1.
	penalization isZero ifTrue: [ fuelTank refuel ].

	^ true
]

{ #category : 'logic' }
Spaceship >> manageSkip [
	penalization isZero ifTrue: [ ^ false ].

	penalization := penalization - 1.

	^ true
]

{ #category : 'moving' }
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
"Cuando se queda sin combustible"
	position := position backToZero.
	penalization := penalization +2.
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position
]

{ #category : 'moving' }
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

{ #category : 'logic' }
Spaceship >> skip [
	penalization := penalization + 1.
]

{ #category : 'logic' }
Spaceship >> turn: toMove [
	 (self canExecuteMove: toMove) ifFalse: [ ^ self ].
    self move: (toMove + rollAddOn).
    board applyTileEffectTo: self.
]

{ #category : 'logic' }
Spaceship >> turn: toMove playCard: aCard against: aSpaceship in:aGame [
	self useCard: aCard against: aSpaceship during: aGame . 
	self turn:toMove .
]

{ #category : 'cardLogic' }
Spaceship >> useCancellationOn: cardToRemove inGame: aGame [
	| cancellationCard |
	cancellationCard := cards detect: [:c | c action class = Cancellation] ifNone: [ Error signal:'No cancellation card was found' ].
	cards remove: cancellationCard.
	aGame cards removeCard: cardToRemove . 
   ^cancellationCard 
]

{ #category : 'cardLogic' }
Spaceship >> useCard: aCard against: aSpaceship during: aGame [
	| cardToUse |
	cardToUse := cards detect: [:c | c == aCard ] ifNone: [ Error signal:'The chosen card was not found' ].
	cardToUse useAgainst: aSpaceship from: self during: aGame.
	cards remove: (cards at: 1).
]

{ #category : 'cardLogic' }
Spaceship >> useCard: aCard against: aSpaceship in: aGame [
	| cardToUse |
	cardToUse := cards detect: [:c | c == aCard ] ifNone: [ Error signal:'The chosen card was not found' ].
	cardToUse useAgainst: aSpaceship from: self in: aGame.
	cards remove: (cards at: 1).
]
