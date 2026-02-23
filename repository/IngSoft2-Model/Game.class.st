"
Controls the game functioning and logic
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'spaceships',
		'dice',
		'turnNumber',
		'numberSpaceships',
		'laps',
		'permanentCards',
		'lastEffect',
		'cardTargets',
		'extraTurn',
		'direction'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Game class >> with: spaceShips andDice: someDice laps: lap [
	(lap < 1) ifTrue: [ Error signal: 'Number of laps should be greater than 0' ].
	^ self new initializeWith: spaceShips andDice: someDice laps: lap.
]

{ #category : 'logic' }
Game >> activateAtomicBomb [     
	self spaceships do: [:ship | ship resetToStartWithoutFuelLoss ].
]

{ #category : 'logic' }
Game >> activateMoonWalk: nTiles from: triggeringSpaceship [
	self spaceships do: [:ship |
		ship = triggeringSpaceship ifFalse: [
			ship move: nTiles
		]
	].
]

{ #category : 'adding' }
Game >> addCard: aCard against:aSpaceship [
	permanentCards add: aCard .
	cardTargets at: aCard put:aSpaceship .
]

{ #category : 'logic' }
Game >> addExtraTurn [
	extraTurn :=extraTurn +1.
]

{ #category : 'adding' }
Game >> addPermanentCard: anOverloadCard against: aSpaceship [ 
	self addCard:anOverloadCard against: aSpaceship .
	aSpaceship modifyRoll: anOverloadCard penalty .
]

{ #category : 'as yet unclassified' }
Game >> advanceTurn [
	extraTurn > 0 ifTrue: [ 
        extraTurn := extraTurn - 1. 
        ^ self ].
	turnNumber := (turnNumber - 1 + direction) \\ numberSpaceships + 1.
	
]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceships andDice: someDice laps: someLaps [
	direction:=1.
	extraTurn := 0.
	laps := someLaps.
	spaceships := someSpaceships.
	dice := someDice.
	turnNumber := 1.
	numberSpaceships := spaceships size.
	permanentCards := OrderedCollection new.
	cardTargets:=Dictionary new.
]

{ #category : 'logic' }
Game >> isFinished [
	^ spaceships anySatisfy: [ :ship | ship hasWon: laps ].
]

{ #category : 'accessing' }
Game >> lastEffect [
^lastEffect 
]

{ #category : 'accessing' }
Game >> maximumValueOfDice [
	 ^ dice sum: [:die | die numberSides]

]

{ #category : 'as yet unclassified' }
Game >> modifyRollAll: aNumber [
	
	spaceships do: [ :ship | ship modifyRoll: aNumber ].
	
]

{ #category : 'logic' }
Game >> nextTurn [
    ^ self nextTurnWithCard: nil against: nil
]

{ #category : 'logic' }
Game >> nextTurnWithCard:aCard against:targetSpaceship [
| currentShip rollResult |
	self isFinished ifTrue: [ ^ self ].
	currentShip := spaceships at:turnNumber .

	(currentShip managePenalization) ifTrue: [ ^ self advanceTurn ].
	
	rollResult := self rollDices.
	(rollResult = self maximumValueOfDice)ifTrue: [
			currentShip getRewardWithPorcentage:80.].
	aCard ifNotNil: [currentShip turn: rollResult playCard: aCard against:targetSpaceship in: self]
	ifNil:[
	currentShip turn: rollResult.].

	self advanceTurn.
]

{ #category : 'accessing' }
Game >> permanentCards [

	^ permanentCards size
]

{ #category : 'removing' }
Game >> readLastCard [

	permanentCards isEmptyOrNil ifTrue: [
		^ NullCard with: NullAction new ].
	nil.
	^ permanentCards last
]

{ #category : 'removing' }
Game >> removeCard: aCardToRemove [

	| cardToRemoveFromGame  targetSpaceship |
	cardToRemoveFromGame  := permanentCards
		        detect: [ :aPermanentCard  | aPermanentCard  class = aCardToRemove action class ]
		        ifNone: [
		        Error signal: 'La carta a eliminar no esta en juego' ].
	
	permanentCards remove: cardToRemoveFromGame .
	
	targetSpaceship:= (cardTargets at:cardToRemoveFromGame).
	targetSpaceship ifNotNil: [ 
		cardToRemoveFromGame removeAction:targetSpaceship in:self.
		cardTargets removeKey:cardToRemoveFromGame ]ifNil: [ cardToRemoveFromGame  removeAction:self . ].
	
	^ cardToRemoveFromGame 
]

{ #category : 'as yet unclassified' }
Game >> reverseTurns [
	direction :=direction negated.
	
]

{ #category : 'logic' }
Game >> rollDices [
	| resultados |
	resultados := dice collect: [ :dado | dado roll ].
	^ resultados sum.

]

{ #category : 'as yet unclassified' }
Game >> saveLastEffect: aBlock [
	lastEffect :=aBlock .
]

{ #category : 'logic' }
Game >> skipTurn [
	self isFinished ifTrue: [ ^ self ].
  (spaceships at:turnNumber) refuel.
	self advanceTurn .
]

{ #category : 'accessing' }
Game >> spaceships [
	^ spaceships 
]
