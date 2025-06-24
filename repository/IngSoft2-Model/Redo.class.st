Class {
	#name : 'Redo',
	#superclass : 'CardAction',
	#instVars : [
		'spaceship',
		'cardSpaceship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Redo >> actOn: aSpaceship from: aCardSpaceship in: aGame [ 
	| newCard |
	spaceship:=aSpaceship .
	cardSpaceship:=aCardSpaceship .
	newCard:=(aGame readLastCard) class new.
	newCard actOn: aSpaceship from: aCardSpaceship in: aGame.
]
