Class {
	#name : 'Skip',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'introspection' }
Skip class >> className [ 
	'Skip'.
]

{ #category : 'as yet unclassified' }
Skip >> actOn: aSpaceship from: aCardSpaceship during: aGame [
	aCardSpaceship skip.
]
