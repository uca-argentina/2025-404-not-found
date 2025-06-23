Class {
	#name : 'Overload',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Overload >> actOn: aSpaceship from: cardSpaceship in: aGame [
	aSpaceship modifyRoll: -2

]
