Class {
	#name : 'Cancellation',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cancellation >> actOn: aSpaceship from: cardSpaceship in: aGame [
	aGame removeCard 

]
