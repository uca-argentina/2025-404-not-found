Class {
	#name : 'Cancellation',
	#superclass : 'CardAction',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'introspection' }
Cancellation class >> className [ 
	'Cancellation'.
]

{ #category : 'effects' }
Cancellation >> actOn: aSpaceship from: aCardSpaceship in: aGame [

	aGame removeCard. 

]
