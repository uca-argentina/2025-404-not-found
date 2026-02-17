Class {
	#name : 'FreedomTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
FreedomTest >> testWhenSpaceshipJailedAndPlaysFreedomCard [

	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame jail drawCardTile aCardDeck freedomCard |
	aBoard := Board with: 20. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30 withCards: OrderedCollection new.	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30 withCards: OrderedCollection new. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap . 	
	aBoard setGame: aGame. 
	jail := Jail inPosition: 4. 	
	aBoard addTile: jail.
	
	aCardDeck:=CardDeck new.
	freedomCard:=Card with:Freedom new.
	aCardDeck addCard: freedomCard.
	drawCardTile:= DrawCardTile inPosition: 2 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship2 turn: 2.
	aSpaceship1 turn: 5.
	aSpaceship2 turn:2.
	aSpaceship1 turn: 2.
	aSpaceship2 turn:4 playCard: freedomCard against: aSpaceship2 in: aGame.
	
	
	
	self assert: aSpaceship2 position equals: (Position in:8 at: 0).
]

{ #category : 'tests' }
FreedomTest >> testWhenSpaceshipJailedReleasedAndPlaysRedo [

	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame jail drawCardTile aCardDeck freedomCard redoCard |
	aBoard := Board with: 20. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30 withCards: OrderedCollection new.	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30 withCards: OrderedCollection new. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap . 	
	aBoard setGame: aGame. 
	jail := Jail inPosition: 4. 	
	aBoard addTile: jail.
	
	aCardDeck:=CardDeck new.
	freedomCard:=Card with:Freedom new.
	redoCard:=Card with:Redo new.
	aCardDeck addCard: redoCard.
	aCardDeck addCard: freedomCard.
	drawCardTile:= DrawCardTile inPosition: 2 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship2 turn: 2.
	aSpaceship1 turn: 2.
	aSpaceship2 turn:2.
	aSpaceship1 turn: 2.
	aSpaceship2 turn:4 playCard: freedomCard against: aSpaceship2 in: aGame.
	aSpaceship1 turn:1 playCard: redoCard against: aSpaceship1 in: aGame.
	
	
	self assert: aSpaceship1 position equals: (Position in:5 at: 0).
]
