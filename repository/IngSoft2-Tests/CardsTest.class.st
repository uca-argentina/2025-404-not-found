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
	aBoard := Board with: 20. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30. 	
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

{ #category : 'tests' }
CardsTest >> test01WhenSpaceshipLandsOnCardTileThenReceivesACard [
	
	drawCardTile setCardDeck: CardDeck new.
	aSpaceship1 turn: 6.
	
	self assert: aSpaceship1 cards equals: 1.
	 
]

{ #category : 'tests' }
CardsTest >> test02WhenSpaceshipLandsOnCardTileTwiceThenHasTwoCards [
	
	| drawCardTile2 |
	drawCardTile setCardDeck: CardDeck new.
	drawCardTile2 := DrawCardTile inPosition: 12.
	drawCardTile2 setCardDeck: CardDeck new.
	aBoard addTile: drawCardTile2.
	
	aSpaceship1 turn: 6.
	aSpaceship1 turn: 6.
	
	self assert: aSpaceship1 cards equals: 2.
	 
]
