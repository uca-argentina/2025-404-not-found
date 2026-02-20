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
		'orderTurns',
		'extraTurn'
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
	extraTurn :=true.
]

{ #category : 'adding' }
Game >> addPermanentCard: anOverloadCard against: aSpaceship [ 
	self addCard:anOverloadCard against: aSpaceship .
	aSpaceship modifyRoll: anOverloadCard penalty .
]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceships andDice: someDice laps: someLaps [
	extraTurn :=false.
	laps := someLaps.
	spaceships := someSpaceships.
	dice := someDice.
	turnNumber := 1.
	orderTurns :=true.
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

{ #category : 'as yet unclassified' }
Game >> manageTurn [
	(extraTurn)ifFalse: [  
		(orderTurns)ifTrue: [ 
			turnNumber := (turnNumber \\ numberSpaceships) + 1.
		 	] ifFalse: [ 
				turnNumber := (turnNumber - 2 \\ numberSpaceships) + 1.
			 ]
		].
	extraTurn :=false.

	
	
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
	self isFinished ifTrue: [ ^ self ]. "veo si el juego esta terminado"
	
	spaceship := spaceships at: turnNumber. "obtengo nave actual"
	
	(spaceship managePenalization) ifFalse:[
		positionsToMove:= self rollDices.
		(positionsToMove = self maximumValueOfDice)ifTrue: [
			spaceship getRewardWithPorcentage:80.
		].
		spaceship turn: positionsToMove.
	].
	self manageTurn .



	
]

{ #category : 'logic' }
Game >> nextTurnWithCard:aCard against:aSpaceship [
	| spaceship positionsToMove|
	self isFinished ifTrue: [ ^ self ]. "veo si el juego esta terminado"
	
	spaceship := spaceships at: turnNumber. "obtengo nave actual"
	
	(spaceship managePenalization) ifFalse:[
		positionsToMove:= self rollDices.
		(positionsToMove = self maximumValueOfDice)ifTrue: [
			spaceship getRewardWithPorcentage:80.
		].
		spaceship turn: positionsToMove playCard: aCard against:aSpaceship in: self.
	].
	self manageTurn .



	
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
	orderTurns :=orderTurns not.
	
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
