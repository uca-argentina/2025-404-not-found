Class {
	#name : 'Acceleration',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'introspection' }
Acceleration class >> className [ 
	'Acceleration'.
]

{ #category : 'effects' }
Acceleration >> actOn: aSpaceship from: aCardSpaceship during: aGame [ 
	"aGame addCard: self against: aSpaceship ."
	aGame cards add: self against: aSpaceship .
	aGame modifyRollAll: 1

]

{ #category : 'effects' }
Acceleration >> actOn: aSpaceship from: aCardSpaceship in: aGame [ 
	Error signal:'Permanent Card can only be played turing turn'

]

{ #category : 'removing' }
Acceleration >> removeAction: aGame [
	aGame modifyRollAll: -1.
]
