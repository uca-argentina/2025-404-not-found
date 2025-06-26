Class {
	#name : 'GameWithCardsTest',
	#superclass : 'TestCase',
	#instVars : [
		'aBoard',
		'aSpaceship1',
		'aSpaceship2',
		'aSpaceship3',
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
GameWithCardsTest >> setUp [
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
	
	drawCardTile := DrawCardTile inPosition: 6.
	aBoard addTile: drawCardTile.
]

{ #category : 'asserting' }
GameWithCardsTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'tests' }
GameWithCardsTest >> testInstantCardAllyIsPlayedDuringAnytime [
	| aCardDeck allyCard|
	aCardDeck:=CardDeck new.
	allyCard:=Card with: Ally new.
	aCardDeck addCard: allyCard.
	drawCardTile setCardDeck: aCardDeck.
	aSpaceship1 turn: 6.
	aSpaceship2 turn: 3.
	aSpaceship1 useCard: allyCard against: aSpaceship2 in: aGame.
	aSpaceship1 turn:6.
	
	self assert: aSpaceship2 fuel equals: 5
	
]

{ #category : 'tests' }
GameWithCardsTest >> testOnlyCardsOnHandCanBePlayed [
	| aCardDeck allyCard repeatCard |
	aCardDeck:=CardDeck new.
	allyCard:=Card with: Ally new.
	repeatCard:=Card with:Repeat new.
	aCardDeck addCard: allyCard.
	drawCardTile setCardDeck: aCardDeck.
	aSpaceship1 turn: 6.
	
	self
		should: [ aSpaceship1 useCard: repeatCard against: aSpaceship2 in: aGame.]
		raise: Error
		withMessageText: 'The chosen card was not found'

]

{ #category : 'tests' }
GameWithCardsTest >> testPermanentCardAOverloadIsPlayedDuringTurn [
	| aCardDeck overloadCard|
	aCardDeck:=CardDeck new.
	overloadCard:=Card with: Overload new.
	aCardDeck addCard: overloadCard.
	drawCardTile setCardDeck: aCardDeck.

	aSpaceship1 turn:6.
	aSpaceship1 turn: 1 playCard: overloadCard against: aSpaceship2 in:aGame .
	aSpaceship2 turn:4.
	
	
	self assert: aSpaceship2 position equals: (Position in: 2 at: 0).
	
]

{ #category : 'tests' }
GameWithCardsTest >> testPermanentCardAccelerationIsCantBePlayedOutsideTurn [
	| aCardDeck accelerationCard|
	aCardDeck:=CardDeck new.
	accelerationCard:=Card with: Acceleration new.
	aCardDeck addCard: accelerationCard.
	drawCardTile setCardDeck: aCardDeck.

	aSpaceship2 turn:6.
	self
		should: [ aSpaceship2 useCard: accelerationCard against:nil in:aGame]
		raise: Error
		withMessageText: 'Permanent Card can only be played turing turn'


	
]

{ #category : 'tests' }
GameWithCardsTest >> testPermanentCardAccelerationIsPlayedDuringTurn [
	| aCardDeck accelerationCard|
	aCardDeck:=CardDeck new.
	accelerationCard:=Card with: Acceleration new.
	aCardDeck addCard: accelerationCard.
	drawCardTile setCardDeck: aCardDeck.

	aSpaceship2 turn:6.
	aSpaceship2 turn: 2 playCard: accelerationCard against: nil in:aGame .
	
	self assert: aSpaceship2 position equals: (Position in: 9 at: 0).
	
]

{ #category : 'tests' }
GameWithCardsTest >> testPermanentCardAllyIsCantBePlayedOutsideTurn [
	| aCardDeck allyCard|
	aCardDeck:=CardDeck new.
	allyCard:=Card with: Ally new.
	aCardDeck addCard: allyCard.
	drawCardTile setCardDeck: aCardDeck.

	aSpaceship2 turn:6.
	self
		should: [ aSpaceship2 useCard: allyCard against:aSpaceship1 in:aGame]
		raise: Error
		withMessageText: 'Permanent Card can only be played turing turn'


	
]
