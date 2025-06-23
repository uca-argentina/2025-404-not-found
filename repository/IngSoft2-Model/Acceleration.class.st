Class {
	#name : 'Acceleration',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Acceleration >> actOn: aSpaceship from: cardSpaceship in: aGame [
	aGame modifyRollAll: 1

]
