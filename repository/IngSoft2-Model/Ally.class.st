Class {
	#name : 'Ally',
	#superclass : 'CardAction',
	#instVars : [
		'spaceship',
		'cardSpaceship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ally >> actOn: aSpaceship from: aCardSpaceship in: aGame [
	spaceship := aSpaceship.
	cardSpaceship := aCardSpaceship.
	aGame addCard: self.
	cardSpaceship allyWith: aSpaceship.
	aSpaceship allyWith: cardSpaceship.

]

{ #category : 'removing' }
Ally >> removeAction [
	spaceship breakAlliance.
	cardSpaceship breakAlliance.
	
]
