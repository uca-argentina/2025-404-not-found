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
		'lastEffect',
		'extraTurn',
		'direction',
		'cardManager'
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

{ #category : 'logic' }
Game >> addExtraTurn [
	extraTurn :=extraTurn +1.
]

{ #category : 'logic' }
Game >> advanceTurn [
	extraTurn > 0 ifTrue: [ 
        extraTurn := extraTurn - 1. 
        ^ self ].
	turnNumber := (turnNumber - 1 + direction) \\ numberSpaceships + 1.
	
]

{ #category : 'accessing' }
Game >> cards [ 	
	^cardManager 
]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceships andDice: someDice laps: someLaps [
	cardManager:=CardManager of:self.
	direction:=1.
	extraTurn := 0.
	laps := someLaps.
	spaceships := someSpaceships.
	dice := someDice.
	turnNumber := 1.
	numberSpaceships := spaceships size.

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

{ #category : 'logic' }
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

{ #category : 'logic' }
Game >> ranking [
	^ spaceships asSortedCollection: [ :shipA :shipB | 
        shipA isAheadOf: shipB ]
]

{ #category : 'logic' }
Game >> reverseTurns [
	direction :=direction negated.
	
]

{ #category : 'logic' }
Game >> rollDices [
	| resultados |
	resultados := dice collect: [ :dado | dado roll ].
	^ resultados sum.

]

{ #category : 'logic' }
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

{ #category : 'accessing' }
Game >> turn [
	^turnNumber .
]
