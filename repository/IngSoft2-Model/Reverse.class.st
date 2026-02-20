Class {
	#name : 'Reverse',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Reverse >> actOn: aSpaceship from: aCardSpaceship during: aGame [
	aGame reverseTurns.
]
