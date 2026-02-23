Class {
	#name : 'GameWithTurnsAndCards',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
GameWithTurnsAndCards >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'tests' }
GameWithTurnsAndCards >> testWhenSpaceshipPlaysDoubleThenOtherWait [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame aSpaceship3 doubleCard aCardDeck drawCardTile |
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
	doubleCard:=Card with: Double new.
	aCardDeck addCard: doubleCard.
	aGame := Game with: spaceships andDice: dice laps: lap .
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aBoard setGame: aGame.
	aSpaceship1 drawCard: doubleCard .
	
	aGame nextTurnWithCard: doubleCard against:nil. 
	aGame nextTurn .
	
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0).
]

{ #category : 'tests' }
GameWithTurnsAndCards >> testWhenSpaceshipPlaysDoubleThenTurnsAgain [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame aSpaceship3 doubleCard aCardDeck drawCardTile |
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
	doubleCard:=Card with: Double new.
	aCardDeck addCard: doubleCard.
	aGame := Game with: spaceships andDice: dice laps: lap .
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aBoard setGame: aGame.
	aSpaceship1 drawCard: doubleCard .
	
	aGame nextTurnWithCard: doubleCard against:nil. 
	aGame nextTurn .
	
	self assert: aSpaceship1 position equals: (Position in: 11 at: 0).
]

{ #category : 'tests' }
GameWithTurnsAndCards >> testWhenSpaceshipPlaysReverseCardAndNextCantPlay [
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

{ #category : 'tests' }
GameWithTurnsAndCards >> testWhenSpaceshipPlaysReverseThenTurnsInvert [
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

{ #category : 'tests' }
GameWithTurnsAndCards >> testWhenSpaceshipPlaysSkipThenCantmove [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame aSpaceship3 skipCard aCardDeck drawCardTile |
	aBoard := Board with: 20.
	aSpaceship1:= Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30 withCards: OrderedCollection new.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	aSpaceship3 := Spaceship withName: 'Nave 3' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 .aSpaceship3}.
	"Exacto una vuelta         1   2   1   2   1   2 "
	aDie1 := LoadedDie with: { 3 . 2 . 3 . 3 . 4 . 4}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3 . 5 . 5}.
	dice := { aDie1 . aDie2 }.
	lap := 1.
	aCardDeck:=CardDeck new.
	skipCard:=Card with: Skip new.
	aCardDeck addCard: skipCard.
	aGame := Game with: spaceships andDice: dice laps: lap .
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aBoard setGame: aGame.
	aSpaceship1 drawCard: skipCard .
	
	aGame nextTurnWithCard: skipCard against:nil. 
	aGame nextTurn .
	
	self assert: aSpaceship1 position equals: (Position in: 0 at: 0).
]

{ #category : 'tests' }
GameWithTurnsAndCards >> testWhenSpaceshipPlaysSkipThenNextPlays [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame aSpaceship3 skipCard aCardDeck drawCardTile |
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
	skipCard:=Card with: Skip new.
	aCardDeck addCard: skipCard.
	aGame := Game with: spaceships andDice: dice laps: lap .
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aBoard setGame: aGame.
	aSpaceship1 drawCard: skipCard .
	
	aGame nextTurnWithCard: skipCard against:nil. 
	aGame nextTurn .
	
	self assert: aSpaceship2 position equals: (Position in: 5 at: 0).
]

{ #category : 'tests' }
GameWithTurnsAndCards >> testWhenTakingTurnsAndUseCardNotInTurn [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame aSpaceship3 accelerationCard aCardDeck drawCardTile |
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
	accelerationCard:=Card with: Acceleration new.
	aCardDeck addCard: accelerationCard.
	aGame := Game with: spaceships andDice: dice laps: lap .
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aBoard setGame: aGame.
	aSpaceship2 drawCard: accelerationCard .
	
	aGame nextTurn .
	self
		should: [ aSpaceship2 useCard: accelerationCard against:nil in:aGame]
		raise: Error
		withMessageText: 'Permanent Card can only be played turing turn'.
	aGame nextTurn .
	self assert: aSpaceship1 position equals: (Position in: 6 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 5 at: 0).

]

{ #category : 'tests' }
GameWithTurnsAndCards >> testWhenTwoReverseCardsReturnToNormalOrder [
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
