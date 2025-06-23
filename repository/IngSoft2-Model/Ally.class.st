Class {
	#name : 'Ally',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ally >> actOn: aSpaceship from: cardSpaceship in: aGame [
	cardSpaceship allyWith: aSpaceship.
	aSpaceship allyWith: cardSpaceship.

]
