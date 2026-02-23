Class {
	#name : 'CardAction',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardAction >> actOn: aSpaceship from: cardSpaceship in: aGame [
	self subclassResponsibility 

]

{ #category : 'initialization' }
CardAction >> initialize [ 
	super initialize.
  	name := self class className.
]

{ #category : 'as yet unclassified' }
CardAction >> nameOfCard [ 
^name
"
^self subclassResponsibility."
]

{ #category : 'removing' }
CardAction >> removeAction [
	self subclassResponsibility.
]
