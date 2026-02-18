Class {
	#name : 'Overload',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Overload >> actOn: aSpaceship from: aCardSpaceship during: aGame [ 
	aGame addCard: self against: aSpaceship .
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
Overload >> removeAction:aSpaceship in:aGame [
	aGame modifyRollAll: 2.
]
