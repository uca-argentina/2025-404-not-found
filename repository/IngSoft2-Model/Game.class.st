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
Game >> addCard: arg1 [

	permanentCards add: arg1
]

{ #category : 'adding' }
Game >> addPermanentCard: anOverloadCard against: aSpaceship [ 
	permanentCards add: anOverloadCard.
	anOverloadCard appliedTo:aSpaceship.
	aSpaceship modifyRoll: anOverloadCard penalty .
]

{ #category : 'initialization' }
Game >> initializeWith: arg1 andDice: arg2 laps: arg3 [

	laps := arg3.
	spaceships := arg1.
	dice := arg2.
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

{ #category : 'as yet unclassified' }
Game >> modifyRollAll: aNumber [
	
	spaceships do: [ :ship | ship modifyRoll: aNumber ].
	
]

{ #category : 'logic' }
Game >> nextTurn [

	| spaceship |
	self isFinished ifTrue: [ ^ self ].
	spaceship := spaceships at: turnNumber.
	((spaceship) managePenalization) ifFalse:[
		spaceship turn: self rollDices.
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
Game >> removeCard: arg1 [

	| tmp1 |
	tmp1 := permanentCards
		        detect: [ :arg2 | arg2 class = arg1 action class ]
		        ifNone: [
		        Error signal: 'La carta a eliminar no esta en juego' ].
	permanentCards remove: tmp1.
	tmp1 removeAction.
	^ tmp1
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
Game >> showStatus [
	| status |
	status := Dictionary new.
	spaceships do: [ :ship  | 
		status at: ship name put: { ship position . ship hasWon}].
	^ status
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
