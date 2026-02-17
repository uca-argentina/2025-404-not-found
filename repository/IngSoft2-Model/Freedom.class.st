Class {
	#name : 'Freedom',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Freedom >> actOn: aSpaceship from: cardSpaceship during: aGame [
	aGame addCard: self against: aSpaceship .
	aSpaceship manageJail: true.
]

{ #category : 'as yet unclassified' }
Freedom >> actOn: aSpaceship from: cardSpaceship in: aGame [
	aGame addCard: self against: aSpaceship .
	aSpaceship manageJail: true.
]
