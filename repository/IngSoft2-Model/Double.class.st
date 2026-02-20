Class {
	#name : 'Double',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Double >> actOn: aSpaceship from: aCardSpaceship during: aGame [
	aGame addExtraTurn .
]
