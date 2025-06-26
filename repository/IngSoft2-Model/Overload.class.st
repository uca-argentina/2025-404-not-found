Class {
	#name : 'Overload',
	#superclass : 'CardAction',
	#instVars : [
		'spaceship',
		'cardSpaceship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Overload >> actOn: aSpaceship from: aCardSpaceship during: aGame [ 
	spaceship := aSpaceship.
	cardSpaceship := aCardSpaceship.
	aGame addCard: self.
	aSpaceship modifyRoll: -2
]

{ #category : 'as yet unclassified' }
Overload >> actOn: aSpaceship from: aCardSpaceship in: aGame [
	Error signal:'Permanent Card can only be played turing turn'

]

{ #category : 'as yet unclassified' }
Overload >> nameOfCard [ 
^'overload'
]

{ #category : 'removing' }
Overload >> removeAction [
	spaceship modifyRoll: 2. 
]
