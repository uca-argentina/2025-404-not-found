"
Tile that when a spaceship lands on, it has to draw a card from the deck
"
Class {
	#name : 'DrawCardTile',
	#superclass : 'BoardTile',
	#instVars : [
		'cardDeck'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
DrawCardTile class >> inPosition: aPosition withDeck: aDeck [
	^ (self inPosition: aPosition) initializeWithDeck: aDeck .
]

{ #category : 'effects' }
DrawCardTile >> applyEffectsTo: aSpaceship in: aGame [
    aSpaceship drawCard: (cardDeck draw)
]

{ #category : 'initialization' }
DrawCardTile >> initializeWithDeck:aDeck [
	cardDeck := aDeck 
]
