Class {
	#name : 'Ally',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'introspection' }
Ally class >> className [ 
	'Ally'.
]

{ #category : 'as yet unclassified' }
Ally >> actOn: aSpaceship from: aCardSpaceship during: aGame [
	aGame addCard: self against:aSpaceship .
	aCardSpaceship allyWith: aSpaceship.
	aSpaceship allyWith: aCardSpaceship .

]

{ #category : 'as yet unclassified' }
Ally >> actOn: aSpaceship from: aCardSpaceship in: aGame [
	Error signal:'Permanent Card can only be played turing turn'

]

{ #category : 'removing' }
Ally >> removeAction:aSpaceship in:aGame [
	(aSpaceship breakAlliance)breakAlliance .
	
]
