Class {
	#name : 'CardsTest',
	#superclass : 'TestCase',
	#instVars : [
		'aBoard',
		'aSpaceship1',
		'aSpaceship2',
		'spaceships',
		'aDie1',
		'aDie2',
		'dice',
		'lap',
		'aGame',
		'drawCardTile'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
CardsTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	aBoard := Board with: 30. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 10. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 3}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap. 	
	aBoard setGame: aGame. 
	
	drawCardTile := DrawCardTile inPosition: 6.
	aBoard addTile: drawCardTile.
]

{ #category : 'asserting' }
CardsTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'tests' }
CardsTest >> test01WhenSpaceshipLandsOnCardTileThenReceivesACard [
	| aCardDeck |
	
	aCardDeck:=CardDeck new.
	aCardDeck addCard: (Card with: Overload new).
	drawCardTile setCardDeck: aCardDeck.
	aSpaceship1 turn: 6.
	
	self assert: aSpaceship1 cards equals: 1.
	 
]

{ #category : 'tests' }
CardsTest >> test02WhenSpaceshipLandsOnCardTileTwiceThenHasTwoCards [
	
	| drawCardTile2 aCardDeck1 aCardDeck2|
	
	aCardDeck1:=CardDeck new.
	aCardDeck1 addCard: (Card with: Overload new).
	aCardDeck2:=CardDeck new.
	aCardDeck2 addCard: (Card with: Overload new).
	
	drawCardTile setCardDeck: aCardDeck1 .
	drawCardTile2 := DrawCardTile inPosition: 9.
	drawCardTile2 setCardDeck: aCardDeck2 .
	aBoard addTile: drawCardTile2.
	
	aSpaceship1 turn: 6.
	aSpaceship1 turn: 3.
	
	self assert: aSpaceship1 cards equals: 2.
	 
]

{ #category : 'tests' }
CardsTest >> test03WhenSpaceShipPicksUpOverloadCardAndUses [
	| aCardDeck |
	aCardDeck:=CardDeck new.
	aCardDeck addCard: (Card with: Overload new).
	drawCardTile setCardDeck: aCardDeck.
	
	aSpaceship1 turn: 6.
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame.
	
	self assert: aSpaceship1 cards equals: 0.
]

{ #category : 'tests' }
CardsTest >> test04WhenSpaceShipUsesOverloadCardAndApplyEffect [
	| aCardDeck |
	aCardDeck:=CardDeck new.
	aCardDeck addCard:(Card with: Overload new).
	drawCardTile setCardDeck: aCardDeck.
	
	aSpaceship1 turn: 6.
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame.
	
	aSpaceship2 turn:4.
	
	self assert: aSpaceship2 position equals:(Position in: 2 at: 0).
]

{ #category : 'tests' }
CardsTest >> test05WhenUsedAllyCardThenBothSpaceshipFuelsGoDown [

	| aCardDeck |
	aCardDeck:=CardDeck new.
	aCardDeck addCard: (Card with: Ally new).
	drawCardTile setCardDeck: aCardDeck.
	aSpaceship1 turn: 6.
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame.
	aSpaceship1 turn: 6.
	
	self assert: aSpaceship2 fuel equals: 8
]

{ #category : 'tests' }
CardsTest >> test06WhenAllyRunsOutOfFuelThenBothRunOutOfFuel [

	| aCardDeck |
	aCardDeck:=CardDeck new.
	aCardDeck addCard: (Card with: Ally new).
	drawCardTile setCardDeck: aCardDeck.
	aSpaceship1 turn: 6.
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame.
	aSpaceship1 turn: 15.
	
	self assert: aSpaceship1 fuel equals: 0.
	self assert: aSpaceship2 fuel equals: 0
]

{ #category : 'tests' }
CardsTest >> test07WhenAllyRunsOutOfFuelThenBothRGoBackToZero [

	| aCardDeck |
	aCardDeck:=CardDeck new.
	aCardDeck addCard: (Card with: Ally new).
	drawCardTile setCardDeck: aCardDeck.
	aSpaceship1 turn: 6.
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame.
	aSpaceship1 turn: 15.
	
	self assert: aSpaceship1 position equals: (Position in: 0 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0).
]

{ #category : 'tests' }
CardsTest >> test08WhenAccelerationCardIsUsedThenTheNextMoveIsUpByOne [

	| aCardDeck |
	aCardDeck:=CardDeck new.
	aCardDeck addCard: (Card with: Acceleration new).
	drawCardTile setCardDeck: aCardDeck.
	aSpaceship1 turn: 6.
	aSpaceship1 useCardAgainst: nil in: aGame.
	aSpaceship1 turn: 2.
	
	self assert: aSpaceship1 position equals: (Position in: 9 at: 0).
]

{ #category : 'tests' }
CardsTest >> test09WhenAccelerationCardIsUsedThenAllMovesAreUpByOne [

	| aCardDeck |
	aCardDeck:=CardDeck new.
	aCardDeck addCard: (Card with: Acceleration new).
	drawCardTile setCardDeck: aCardDeck.
	aSpaceship1 turn: 6.
	aSpaceship1 useCardAgainst: nil in: aGame.
	aSpaceship2 turn: 6.
	aSpaceship1 turn: 2.
	
	self assert: aSpaceship1 position equals: (Position in: 9 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 7 at: 0).
]

{ #category : 'tests' }
CardsTest >> test10WhenUsedACancellationCardThenAPermanentCardIsEliminatedtest [

	| cancellation acceleration |
	cancellation := Card with: Cancellation new.
	acceleration := Card with: Acceleration new.
	aSpaceship1 drawCard: acceleration.
	aSpaceship2 drawCard: cancellation. 
	aSpaceship1 useCardAgainst: nil in: aGame. "uso de acceleration"
	aSpaceship2 useCancellationOn: acceleration inGame: aGame. "uso de cancellation"
	
	self assert: aGame permanentCards equals: 0.
	
]

{ #category : 'tests' }
CardsTest >> test11WhenUsedACancellationCardThenAccelerationActionIsGone [

	| cancellation acceleration |
	cancellation := Card with: Cancellation new.
	acceleration := Card with: Acceleration new.
	aSpaceship1 drawCard: acceleration.
	aSpaceship2 drawCard: cancellation. 
	aSpaceship1 useCardAgainst: nil in: aGame. "uso de acceleration"
	aSpaceship1 turn: 2. "caeria en 3"
	aSpaceship2 useCancellationOn: acceleration inGame: aGame. "uso de cancellation"
	aSpaceship1 turn: 1. "caeria en 4 en vez de 5 ya que no esta mas"
	
	self assert: aSpaceship1 position equals: (Position in: 4 at: 0).
	
]

{ #category : 'tests' }
CardsTest >> test12WhenUsedACancellationCardThenOverloadActionIsGone [

	| cancellation overload |
	cancellation := Card with: Cancellation new.
	overload := Card with: Overload new.
	aSpaceship1 drawCard: overload.
	aSpaceship2 drawCard: cancellation. 
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame. "uso de overload"
	aSpaceship2 turn: 5. "caeria en 3"
	aSpaceship2 useCancellationOn: overload inGame: aGame. "uso de cancellation"
	aSpaceship2 turn: 1. "caeria en 4" 
	
	self assert: aSpaceship2 position equals: (Position in: 4 at: 0).
	
]

{ #category : 'tests' }
CardsTest >> test13WhenUsedACancellationCardThenAllyActionIsGone [

	| cancellation ally |
	cancellation := Card with: Cancellation new.
	ally := Card with: Ally new.
	aSpaceship1 drawCard: ally.
	aSpaceship2 drawCard: cancellation. 
	
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame. "uso de overload"
	aSpaceship1 turn: 12. "usa 2 combustible del otro"
	aSpaceship2 useCancellationOn: ally inGame: aGame. "uso de cancellation"
	aSpaceship1 turn: 2. "no tiene mas ally, se queda sin y vuelve a 0"
	
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0).
	
]

{ #category : 'tests' }
CardsTest >> test14WhenUsedACancellationCardOnANonExistenCardThenIsInvalid [
	| cancellation ally acceleration|
	cancellation := Card with: Cancellation new.
	ally := Card with: Ally new.
	acceleration := Card with: Acceleration new.
	aSpaceship1 drawCard: ally.
	aSpaceship2 drawCard: cancellation. 
	
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame. "uso de ally"
	aSpaceship1 turn: 12. "usa 2 combustible del otro"
	 "uso de cancellation"
	self
		should: [ aSpaceship2 useCancellationOn: acceleration inGame: aGame.]
		raise: Error
		withMessageText: 'La carta a eliminar no esta en juego'.
	
]

{ #category : 'tests' }
CardsTest >> test15WhenRedoCardUsedPlaysLatestPlayedCard [
	| redo overload|
	redo := Card with: Redo new.
	overload := Card with: Overload new.
	aSpaceship1 drawCard: redo.
	aSpaceship2 drawCard: overload. 
	aSpaceship2 useCardAgainst: aSpaceship1 in: aGame. "uso de overload"
	aSpaceship1 turn: 5. "caeria en 3"
	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame. "uso de redo"
	aSpaceship2 turn: 3. "caeria en 1"

"con debug, da una cosa si no otra"
	self assert: aSpaceship2 position equals: (Position in: 1 at: 0).
	self assert: aSpaceship1 position equals: (Position in: 3 at: 0).
	self assert: aGame permanentCards equals: 2.
	
]

{ #category : 'tests' }
CardsTest >> test16WhenNotCardsInGameThenRedoNoEffect [
	| redo overload|
	redo := Card with: Redo new.
	overload := Card with: Overload new.
	aSpaceship1 drawCard: redo.

	aSpaceship1 useCardAgainst: aSpaceship2 in: aGame. "uso de redo"
	aSpaceship2 turn: 3. "caeria en 1"

	self assert: aSpaceship2 position equals: (Position in: 3 at: 0).
	self assert: aGame permanentCards equals: 0.
	
]

{ #category : 'tests' }
CardsTest >> test17WhenRedoCardUsedPlaysLatestAccelerationCard [
	|redo acceleration aCardDeck|
	redo := Card with: Redo new.
	acceleration := Card with: Acceleration new.
	aCardDeck:=CardDeck new.
	aCardDeck addCard: acceleration .
	drawCardTile setCardDeck: aCardDeck.
	
	aSpaceship1 drawCard: redo.
	aSpaceship2 turn:6. "cae y se le asigna acceleration"
	aSpaceship2 useCardAgainst: nil in: aGame. "usa la carta"
	aSpaceship1 turn: 4. "caeria en 5"
	aSpaceship1 useCardAgainst: nil in: aGame. "uso de redo"
	aSpaceship2 turn: 1. "caeria en 9"
	

	self assert: aSpaceship2 position equals: (Position in: 9 at: 0).
	self assert: aSpaceship1 position equals: (Position in: 5 at: 0).
	self assert: aGame permanentCards equals: 2.
]
