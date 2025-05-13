"
Controls the game functioning and logic
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'spaceships',
		'dice',
		'board',
		'finished',
		'winner'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Game class >> with: spaceShips andDice: someDice andBoard: aBoard [ 
	^self new initializeWith: spaceShips andDice: someDice andBoard: aBoard.
]

{ #category : 'accesing' }
Game >> board [ 
	^ board 
]

{ #category : 'accesing' }
Game >> dice [ 
 ^ dice
]

{ #category : 'testing' }
Game >> hasShipWon: aShip [
	^ aShip position >= board size

]

{ #category : 'initialization' }
Game >> initializeWith: someSpaceShips andDice: someDice andBoard: aBoard [ 
	spaceships := someSpaceShips.
	dice := someDice.
	board := aBoard.
	finished := false.
]

{ #category : 'testing' }
Game >> isFinished [
	^finished
]

{ #category : 'logic' }
Game >> nexTurn [
	self isFinished ifTrue: [ ^ self ].  

	spaceships do: [:ship |
		| roll |
		roll := self rollDices.
		ship move: roll.
		(self hasShipWon: ship) ifTrue: [
			winner := ship.
			finished := true.
			^self		
		].
	].
	
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
    status := ''.

    spaceships do: [:spaceship |
        status := status , 'Nave: ', spaceship name, ' - Posición: ', spaceship position asString, String cr.
].

    self isFinished ifTrue: [
        status := status , '🎉 El juego ha terminado. Ganó: ', winner name, String cr.].

    ^ status
]

{ #category : 'accesing' }
Game >> spaceships [
	^ spaceships 
]

{ #category : 'accessing' }
Game >> winner [
	^ winner
]
