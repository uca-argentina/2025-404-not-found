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
		'permanentCards'
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
Game >> addPermanentCard: anOverloadCard against: aSpaceship [ 
	permanentCards add: anOverloadCard.
	anOverloadCard appliedTo:aSpaceship.
	aSpaceship modifyRoll: anOverloadCard penalty .
]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceShips andDice: someDice laps: numberLaps [
	laps := numberLaps. 
	spaceships := someSpaceShips.
	dice := someDice.
	turnNumber := 1.
	numberSpaceships := spaceships size.
	permanentCards :=OrderedCollection new.
]

{ #category : 'logic' }
Game >> isFinished [
	^ spaceships anySatisfy: [ :ship | ship hasWon: laps ].
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

{ #category : 'removing' }
Game >> removeCard [
	permanentCards removeAt: 1.
]

{ #category : 'logic' }
Game >> rollDices [
	| resultados |
	resultados := dice collect: [ :dado | dado roll ].
	^ resultados sum.

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
