Class {
	#name : 'Cancellation',
	#superclass : 'CardAction',
	#instVars : [
		'spaceship',
		'cardSpaceship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cancellation >> actOn: aSpaceship from: aCardSpaceship in: aGame [
	spaceship := aSpaceship.
	cardSpaceship := aCardSpaceship.
	aGame removeCard. 

]

{ #category : 'as yet unclassified' }
Cancellation >> nameOfCard [
^'cancellation'

]
