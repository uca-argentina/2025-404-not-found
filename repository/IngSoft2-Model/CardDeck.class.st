"
Contains all the different cards of the game. Draw method returns card at the top of the deck
"
Class {
	#name : 'CardDeck',
	#superclass : 'Object',
	#instVars : [
		'cards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'adding' }
CardDeck >> addCard: aCard [
	cards add: aCard
]

{ #category : 'drawing' }
CardDeck >> draw [
	^ 1
]

{ #category : 'adding' }
CardDeck >> initialize [
	cards := OrderedCollection new.
]
