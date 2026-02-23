Class {
	#name : 'Acceleration',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Acceleration >> actOn: aSpaceship from: aCardSpaceship during: aGame [ 
	aGame addCard: self against: aSpaceship .
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
Acceleration >> removeAction: aGame [
	aGame modifyRollAll: -1.
]
