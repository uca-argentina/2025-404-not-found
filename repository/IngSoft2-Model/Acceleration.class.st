Class {
	#name : 'Acceleration',
	#superclass : 'CardAction',
	#instVars : [
		'spaceship',
		'cardSpaceship',
		'game'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Acceleration >> actOn: aSpaceship from: aCardSpaceship during: aGame [ 
	spaceship := aSpaceship.
	cardSpaceship := aCardSpaceship.
	game := aGame.
	aGame addCard: self.
	aGame modifyRollAll: 1

]

{ #category : 'as yet unclassified' }
Acceleration >> actOn: aSpaceship from: aCardSpaceship in: aGame [ 
	Error signal:'Permanent Card can only be played turing turn'

]

{ #category : 'as yet unclassified' }
Acceleration >> nameOfCard [ 
^'acceleration'
]

{ #category : 'removing' }
Acceleration >> removeAction [
	game modifyRollAll: -1.
]
