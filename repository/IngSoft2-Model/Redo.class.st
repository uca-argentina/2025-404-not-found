Class {
	#name : 'Redo',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'introspection' }
Redo class >> className [ 
	'Redo'.
]

{ #category : 'as yet unclassified' }
Redo >> actOn: aSpaceship from: aCardSpaceship during: aGame [ 
	| newCard |
	newCard:=(aGame readLastCard) class new.
	newCard actOn: aSpaceship from: aCardSpaceship during: aGame.
]

{ #category : 'as yet unclassified' }
Redo >> actOn: aSpaceship from: aCardSpaceship in: aGame [ 
	| newCard |
	newCard:=(aGame readLastCard) class new.
	newCard actOn: aSpaceship from: aCardSpaceship in: aGame.
]
