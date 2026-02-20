Class {
	#name : 'GameWithReverse',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
GameWithReverse >> testWhenSpaceshipPlaysReverseCard [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame aSpaceship3 reverseCard |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	aSpaceship3 := Spaceship withName: 'Nave 3' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 .aSpaceship3}.
	"Exacto una vuelta         1   2   1   2   1   2 "
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 3 . 4 . 4}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3 . 5 . 5}.
	dice := { aDie1 . aDie2 }.
	lap := 1.
	reverseCard := Card with: Reverse new.
	aGame := Game with: spaceships andDice: dice laps: lap .
	aBoard addWormHolewithEntraceTile: 12 exitTile: 18.
	aBoard setGame: aGame.
	
	
	aSpaceship1 turn: 6  .
	aGame nextTurn.
	
	
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0).
	
]

{ #category : 'as yet unclassified' }
GameWithReverse >> testWhenSpaceshipPlaysReverseThenTurnsInvert [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame aSpaceship3 reverseCard aCardDeck drawCardTile |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30 withCards: OrderedCollection new.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	aSpaceship3 := Spaceship withName: 'Nave 3' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 .aSpaceship3}.
	"Exacto una vuelta         1   2   1   2   1   2 "
	aDie1 := LoadedDie with: { 3 . 2 . 3 . 3 . 4 . 4}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3 . 5 . 5}.
	dice := { aDie1 . aDie2 }.
	lap := 1.
	aCardDeck:=CardDeck new.
	reverseCard:=Card with: Reverse new.
	aCardDeck addCard: reverseCard.
	aGame := Game with: spaceships andDice: dice laps: lap .
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aBoard setGame: aGame.
	aSpaceship1 drawCard: reverseCard .
	
	aGame nextTurnWithCard: reverseCard against:nil. 
	aGame nextTurn .
	
	self assert: aSpaceship1 position equals: (Position in: 6 at: 0).
	self assert: aSpaceship3 position equals: (Position in: 5 at: 0).
	

]

{ #category : 'as yet unclassified' }
GameWithReverse >> testWhenTwoReverseCardsReturnToNormalOrder [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame aSpaceship3 reverseCard aCardDeck drawCardTile |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30 withCards: OrderedCollection new.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	aSpaceship3 := Spaceship withName: 'Nave 3' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 .aSpaceship3}.
	"Exacto una vuelta         1   2   1   2   1   2 "
	aDie1 := LoadedDie with: { 3 . 2 . 3 . 3 . 4 . 4}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3 . 5 . 5}.
	dice := { aDie1 . aDie2 }.
	lap := 1.
	aCardDeck:=CardDeck new.
	reverseCard:=Card with: Reverse new.
	aCardDeck addCard: reverseCard.
	aCardDeck addCard: reverseCard.
	aGame := Game with: spaceships andDice: dice laps: lap .
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aBoard setGame: aGame.
	aSpaceship1 drawCard: reverseCard .
	aGame nextTurnWithCard: reverseCard against:nil. 
	aSpaceship3 drawCard:reverseCard .
	aGame nextTurnWithCard: reverseCard against:nil.
	aGame nextTurn .
	
	self assert: aSpaceship1 position equals: (Position in: 12 at: 0).
	self assert: aSpaceship3 position equals: (Position in: 5 at: 0).
	

]
