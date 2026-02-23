Class {
	#name : 'Repeat',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'introspection' }
Repeat class >> className [ 
	'Repeat'.
]

{ #category : 'as yet unclassified' }
Repeat >> actOn: aSpaceship from: cardSpaceship in: aGame [
	aGame lastEffect ifNotNil: [ :effect |effect value: aSpaceship ].
	"
	aGame lastEffect.
	effect ifNotNil: [ effect applyEffectsTo: aSpaceship in: aGame ].
"
]
