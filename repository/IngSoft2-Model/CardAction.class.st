Class {
	#name : 'CardAction',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardAction >> actOn: aSpaceship from: cardSpaceship in: aGame [
	self subclassResponsibility 

]

{ #category : 'as yet unclassified' }
CardAction >> nameOfCard [ 
^self subclassResponsibility.
]

{ #category : 'removing' }
CardAction >> removeAction [
	self subclassResponsibility.
]
