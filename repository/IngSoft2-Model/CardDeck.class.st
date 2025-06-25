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
	(cards isEmpty) ifFalse: [^cards removeLast].
	self generateRandomCards: 20.
	^cards removeLast 
]

{ #category : 'adding' }
CardDeck >> generateRandomCards: aNumberOfCards [
	 1 to: aNumberOfCards do: [:i | cards add: self randomCard ].
]

{ #category : 'adding' }
CardDeck >> initialize [
	cards := OrderedCollection new.
]

{ #category : 'adding' }
CardDeck >> randomCard [
	| r |
    r := Random new next.

    (r < 0.17) ifTrue: [ ^ Card with: Acceleration new ].
    (r < 0.34) ifTrue: [ ^ Card with: Ally new ].
    (r < 0.51) ifTrue: [ ^ Card with: Overload new ].
    (r < 0.68) ifTrue: [ ^ Card with: Cancellation new ].
    (r < 0.84) ifTrue: [ ^ Card with: Repeat new ].
    ^ Card with: Redo new.
]
