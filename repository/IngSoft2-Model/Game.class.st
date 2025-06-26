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
		'lastEffect'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Game class >> with: spaceShips andDice: someDice laps: lap [
	(lap < 1) ifTrue: [ Error signal: 'Number of laps should be greater than 0' ].
	^ self new initializeWith: spaceShips andDice: someDice laps: lap
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
Game >> addCard: aCard [

	permanentCards add: aCard 
]

{ #category : 'adding' }
Game >> addPermanentCard: anOverloadCard against: aSpaceship [ 
	permanentCards add: anOverloadCard.
	anOverloadCard appliedTo:aSpaceship.
	aSpaceship modifyRoll: anOverloadCard penalty .
]

{ #category : 'as yet unclassified' }
Game >> applyRewardTo: aSpaceship withPorcentageOf: aPorcentage [
	| randomNumber |

    randomNumber := (Random new next * 100) rounded.

    randomNumber <= aPorcentage
        ifTrue: [ aSpaceship increaseMaxFuelBy: 1 ]
        ifFalse: [ aSpaceship reduceFuelBy: 1 ].

]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceships andDice: someDice laps: someLaps [

	laps := someLaps.
	spaceships := someSpaceships.
	dice := someDice.
	turnNumber := 1.
	numberSpaceships := spaceships size.
	permanentCards := OrderedCollection new
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

	| spaceship positionsToMove|
	self isFinished ifTrue: [ ^ self ].
	spaceship := spaceships at: turnNumber.
	((spaceship) managePenalization) ifFalse:[
		positionsToMove:= self rollDices.
		(positionsToMove = self maximumValueOfDice)ifTrue: [self applyRewardTo: spaceship withPorcentageOf: 80].
		spaceship turn: positionsToMove.
	].
	turnNumber := (turnNumber \\ numberSpaceships) + 1.



	
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

	| cardToRemoveFromGame  |
	cardToRemoveFromGame  := permanentCards
		        detect: [ :aPermanentCard  | aPermanentCard  class = aCardToRemove action class ]
		        ifNone: [
		        Error signal: 'La carta a eliminar no esta en juego' ].
	permanentCards remove: cardToRemoveFromGame .
	cardToRemoveFromGame  removeAction.
	^ cardToRemoveFromGame 
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
	(spaceships at: turnNumber) refuel.
	turnNumber := (turnNumber \\ numberSpaceships) + 1.
]

{ #category : 'accessing' }
Game >> spaceships [
	^ spaceships 
]
