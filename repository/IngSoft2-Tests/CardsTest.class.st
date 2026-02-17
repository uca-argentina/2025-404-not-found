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
		'drawCardTile',
		'aSpaceship3'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
CardsTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	aBoard := Board with: 30. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 10 withCards: OrderedCollection new. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 10 withCards: OrderedCollection new. 	
	aSpaceship3 := Spaceship withName: 'Nave 3' withBoard: aBoard withMaxFuel: 20. 
	spaceships := { aSpaceship1 . aSpaceship2 . aSpaceship3}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 3}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap. 	
	aBoard setGame: aGame. 
	
	
	
]

{ #category : 'asserting' }
CardsTest >> should: arg1 raise: arg2 withMessageText: arg3 [

	self
		should: arg1
		raise: arg2
		withExceptionDo: [ :arg4 |
		self assert: arg4 messageText equals: arg3 ]
]

{ #category : 'tests' }
CardsTest >> test01WhenSpaceshipLandsOnCardTileThenReceivesACard [

	| aCardDeck |
	
	aCardDeck := CardDeck new.
	aCardDeck addCard: (Card with: Overload new).
	drawCardTile := DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile.
	aSpaceship1 turn: 6.
	self assert: aSpaceship1 cards equals: 1
]

{ #category : 'tests' }
CardsTest >> test02WhenSpaceshipLandsOnCardTileTwiceThenHasTwoCards [

	| anotherDrawCardTile aCardDeck anotherCardDeck |
	aCardDeck := CardDeck new.
	aCardDeck addCard: (Card with: Overload new).
	anotherCardDeck := CardDeck new.
	anotherCardDeck addCard: (Card with: Overload new).
	drawCardTile := DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	anotherDrawCardTile := DrawCardTile inPosition: 9 withDeck: anotherCardDeck.
	aBoard addTile: anotherDrawCardTile.
	aSpaceship1
		turn: 6;
		turn: 3.
	self assert: aSpaceship1 cards equals: 2
]

{ #category : 'tests' }
CardsTest >> test03WhenSpaceShipPicksUpOverloadCardAndUses [
	| aCardDeck overloadCard|
	overloadCard:=Card with: Overload new.
	aCardDeck:=CardDeck new.
	aCardDeck addCard: overloadCard.
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship1 turn: 6.
	aSpaceship1 turn:1 playCard: overloadCard against: aSpaceship2 in:aGame .
	
	self assert: aSpaceship1 cards equals: 0.
]

{ #category : 'tests' }
CardsTest >> test04WhenSpaceShipUsesOverloadCardAndApplyEffect [
	| aCardDeck overloadCard|
	aCardDeck:=CardDeck new.
	overloadCard:=Card with: Overload new.
	aCardDeck addCard:overloadCard.
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	
	aSpaceship1 turn: 6.
	aSpaceship1 turn:1 playCard: overloadCard against: aSpaceship2 in:aGame .
	
	aSpaceship2 turn:4.
	
	self assert: aSpaceship2 position equals:(Position in: 2 at: 0).
]

{ #category : 'tests' }
CardsTest >> test05WhenUsedAllyCardThenBothSpaceshipFuelsGoDown [

	| aCardDeck allyCard|
	aCardDeck:=CardDeck new.
	allyCard:=Card with: Ally new.
	aCardDeck addCard: allyCard.
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship1 turn: 6.
	aSpaceship1 turn:6 playCard: allyCard against: aSpaceship2 in: aGame.
	
	self assert: aSpaceship2 fuel equals: 8
]

{ #category : 'tests' }
CardsTest >> test06WhenAllyRunsOutOfFuelThenBothRunOutOfFuel [

	| aCardDeck allyCard|
	aCardDeck:=CardDeck new.
	allyCard:=Card with:Ally new.
	aCardDeck addCard: allyCard.
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship1 turn: 6.
	aSpaceship1 turn:15 playCard: allyCard against: aSpaceship2 in: aGame.
	
	self assert: aSpaceship1 fuel equals: 0.
	self assert: aSpaceship2 fuel equals: 0
]

{ #category : 'tests' }
CardsTest >> test07WhenAllyRunsOutOfFuelThenBothRGoBackToZero [

	| aCardDeck allyCard|
	aCardDeck:=CardDeck new.
	allyCard:=Card with: Ally new.
	aCardDeck addCard: allyCard.
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship1 turn: 6.
	aSpaceship1 turn:15 playCard: allyCard against: aSpaceship2 in: aGame.

	
	self assert: aSpaceship1 position equals: (Position in: 0 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0).
]

{ #category : 'tests' }
CardsTest >> test08WhenAccelerationCardIsUsedThenTheNextMoveIsUpByOne [

	| aCardDeck accelerationCard|
	aCardDeck:=CardDeck new.
	accelerationCard:=Card with: Acceleration new.
	aCardDeck addCard: accelerationCard.
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship1 turn: 6.
	aSpaceship1 turn: 2 playCard: accelerationCard against: nil in: aGame .
	
	self assert: aSpaceship1 position equals: (Position in: 9 at: 0).
]

{ #category : 'tests' }
CardsTest >> test09WhenAccelerationCardIsUsedThenAllMovesAreUpByOne [

	| aCardDeck accelerationCard|
	aCardDeck:=CardDeck new.
	accelerationCard:=Card with: Acceleration new.
	aCardDeck addCard: accelerationCard.
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship1 turn: 6.
	aSpaceship1 turn: 2 playCard: accelerationCard against: nil in: aGame .
	aSpaceship2 turn: 6.
	
	self assert: aSpaceship1 position equals: (Position in: 9 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 7 at: 0).
]

{ #category : 'tests' }
CardsTest >> test10WhenUsedACancellationCardThenAPermanentCardIsEliminatedtest [

	| cancellationCard accelerationCard |
	cancellationCard := Card with: Cancellation new.
	accelerationCard := Card with: Acceleration new.
	aSpaceship1 drawCard: accelerationCard.
	aSpaceship2 drawCard: cancellationCard.
	aSpaceship1 turn: 2 playCard: accelerationCard against: nil in: aGame .
	aSpaceship2 useCancellationOn: accelerationCard inGame: aGame.
	self assert: aGame permanentCards equals: 0
]

{ #category : 'tests' }
CardsTest >> test11WhenUsedACancellationCardThenAccelerationActionIsGone [

	| cancellationCard accelerationCard |
	cancellationCard := Card with: Cancellation new.
	accelerationCard := Card with: Acceleration new.
	aSpaceship1 drawCard: accelerationCard.
	aSpaceship2 drawCard: cancellationCard.
	aSpaceship1 turn: 2 playCard: accelerationCard against: nil in: aGame .
	
	aSpaceship2 useCancellationOn: accelerationCard inGame: aGame.
	aSpaceship1 turn: 1.
	self assert: aSpaceship1 position equals: (Position in: 4 at: 0)
]

{ #category : 'tests' }
CardsTest >> test12WhenUsedACancellationCardThenOverloadActionIsGone [

	| cancellationCard overloadCard |
	cancellationCard := Card with: Cancellation new.
	overloadCard := Card with: Overload new.
	aSpaceship1 drawCard: overloadCard.
	aSpaceship2 drawCard: cancellationCard.
	aSpaceship1 turn:1 playCard:overloadCard against:aSpaceship2 in:aGame.
	aSpaceship2
		turn: 5;
		useCancellationOn: overloadCard inGame: aGame;
		turn: 1.
	self assert: aSpaceship2 position equals: (Position in: 4 at: 0)
]

{ #category : 'tests' }
CardsTest >> test13WhenUsedACancellationCardThenAllyActionIsGone [

	| aCancellationCard anAllyCard |
	aCancellationCard := Card with: Cancellation new.
	anAllyCard := Card with: Ally new.
	aSpaceship1 drawCard: anAllyCard.
	aSpaceship2 drawCard: aCancellationCard.
	aSpaceship1 turn: 12 playCard: anAllyCard against:aSpaceship2 in:aGame .
		
	aSpaceship2 useCancellationOn: anAllyCard inGame: aGame.
	aSpaceship1 turn: 2.
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0)
]

{ #category : 'tests' }
CardsTest >> test14WhenUsedACancellationCardOnANonExistenCardThenIsInvalid [

	| cancellationCard allyCard accelerationCard |
	cancellationCard := Card with: Cancellation new.
	allyCard := Card with: Ally new.
	accelerationCard := Card with: Acceleration new.
	aSpaceship1 drawCard: allyCard.
	aSpaceship2 drawCard: cancellationCard.
	aSpaceship1 turn:12 playCard:allyCard against:aSpaceship2 in:aGame .
	self
		should: [ aSpaceship2 useCancellationOn: accelerationCard inGame: aGame ]
		raise: Error
		withMessageText: 'La carta a eliminar no esta en juego'
]

{ #category : 'tests' }
CardsTest >> test15WhenRedoCardUsedPlaysLatestPlayedCard [

	| redoCard overloadCard |
	redoCard := Card with: Redo new.
	overloadCard := Card with: Overload new.
	aSpaceship1 drawCard: redoCard.
	aSpaceship2
		drawCard: overloadCard;
		turn:1 playCard: overloadCard against:aSpaceship1 in:aGame.
	aSpaceship1 turn:5 playCard: redoCard against:aSpaceship2 in:aGame.
		"turn: 5;
		useCardAgainst: aSpaceship2 in: aGame."
	aSpaceship2 turn: 3.
	self
		assert: aSpaceship2 position equals: (Position in: 2 at: 0);
		assert: aSpaceship1 position equals: (Position in: 3 at: 0);
		assert: aGame permanentCards equals: 2
]

{ #category : 'tests' }
CardsTest >> test16WhenNotCardsInGameThenRedoNoEffect [

	| redoCard overloadCard |
	redoCard := Card with: Redo new.
	overloadCard := Card with: Overload new.
	aSpaceship1
		drawCard: redoCard;
		useCard:redoCard against: aSpaceship2 in: aGame.
	aSpaceship2 turn: 3.
	self
		assert: aSpaceship2 position equals: (Position in: 3 at: 0);
		assert: aGame permanentCards equals: 0
]

{ #category : 'tests' }
CardsTest >> test17WhenRedoCardUsedPlaysLatestAccelerationCard [

	| redoCard accelerationCard aCardDeck |
	redoCard := Card with: Redo new.
	accelerationCard := Card with: Acceleration new.
	aCardDeck := CardDeck new.
	aCardDeck addCard: accelerationCard.
	drawCardTile:= DrawCardTile inPosition: 6 withDeck: aCardDeck.
	aBoard addTile: drawCardTile .
	aSpaceship1 drawCard: redoCard.
	aSpaceship2
		turn: 6;
		turn: 1 playCard: accelerationCard against: nil in: aGame .
	aSpaceship1 turn: 2 playCard: redoCard against: nil in: aGame .
	self
		assert: aSpaceship2 position equals: (Position in: 8 at: 0);
		assert: aSpaceship1 position equals: (Position in: 4 at: 0);
		assert: aGame permanentCards equals: 2
]

{ #category : 'tests' }
CardsTest >> test18WhenRepeatCardUsedThenAppliesBlackHoleEffectToSpaceship [
	|repeat blackHole|
	repeat := Card with: Repeat new.
	aSpaceship2  drawCard: repeat.
	
	blackHole:= BlackHole inPosition: 9.
	aBoard addTile: blackHole.
	aSpaceship3 turn: 9. "Aplicamos el efecto blackHole en el juego, la Nave 3 tiene 20 de fuel"
	aSpaceship2 useCard:repeat against: aSpaceship3 in:aGame. "usa la carta repetida y va 4 mas para atras"
	
	self assert:aSpaceship3 position equals: (Position in:1 at:0).
]

{ #category : 'tests' }
CardsTest >> test19WhenRepeatCardUsedThenAppliesAtomicBombEffectToSpaceship [
	|repeat atomicBomb|
	repeat := Card with: Repeat new.
	aSpaceship2  drawCard: repeat.
	
	atomicBomb:= AtomicBomb inPosition: 9.
	aBoard addTile: atomicBomb.
	aSpaceship3 turn: 9. "Aplicamos el efecto atomicBomb en el juego, la Nave 3 tiene 20 de fuel"
	aSpaceship3 turn: 5. "Vuelve a comenzar de cero y se mueve hasta 5"
	aSpaceship1 turn: 3.
	aSpaceship2 useCard:repeat against: aSpaceship3 in:aGame. "usa la carta repetida y vuelve a 0"
	
	self assert:aSpaceship3 position equals: (Position in:0 at:0).
	self assert:aSpaceship1 position equals: (Position in:3 at:0).
]

{ #category : 'tests' }
CardsTest >> test20WhenRepeatCardUsedThenAppliesHyperGravityEffectToSpaceship [
	|repeat hyperGravity|
	repeat := Card with: Repeat new.
	aSpaceship2  drawCard: repeat.
	
	hyperGravity:= HyperGravity inPosition: 5 needingToRoll: 3.
	aBoard addTile: hyperGravity.
	
	aSpaceship3 turn: 5. "Aplicamos el efecto HyperGravity "
	aSpaceship3 turn: 6. "sale del casillero"
	aSpaceship2 useCard:repeat against: aSpaceship3 in:aGame. "usa la carta repetida y vuelve a aplicarse con el mismo exit roll"
	aSpaceship3 turn: 2. 
	
	self assert:aSpaceship3 position equals: (Position in:11 at:0). "No se pudo mover de 11 al no sacar mas de 3"
	
]

{ #category : 'tests' }
CardsTest >> test21WhenRepeatCardUsedThenAppliesMoonWalkEffectToSpaceship [
	|repeat moonwalk|
	repeat := Card with: Repeat new.
	aSpaceship2  drawCard: repeat.
	
	moonwalk:= MoonWalk inPosition: 5 backingUp: 3. "lo que tendra que retroceder"
	aBoard addTile: moonwalk.
	
	aSpaceship3 turn: 5. "hace retroceder a los demas 3 posiciones"
	aSpaceship3 turn: 4. "avanza a 9"
	aSpaceship2 useCard:repeat against: aSpaceship3 in:aGame. "usa la carta repetida y vuelve a aplicarse MW"
	
	
	self assert:aSpaceship3 position equals: (Position in:6 at:0). 
	
]

{ #category : 'tests' }
CardsTest >> test22WhenRepeatCardUsedThenAppliesHyperJumpEffectToSpaceship [
	|repeat hyperJump|
	repeat := Card with: Repeat new.
	aSpaceship2  drawCard: repeat.
	
	hyperJump:= HyperJump inPosition: 5.
	hyperJump convert: 2 with: (Parsec with:(aBoard size))and: {Parsec with:10 . Parsec with:12 . Parsec with:8 . Parsec with:5 . Parsec with:3. Parsec with:2} .
	aBoard addTile: hyperJump.
	
	aSpaceship3 turn: 5. "se movera 6 lugares mas adelante"
	aSpaceship2 useCard:repeat against: aSpaceship3 in:aGame. "al volverselo a aplicar se movera 5 lugares mas"
	
	
	self assert:aSpaceship3 position equals: (Position in:17 at:0). 
	
]
