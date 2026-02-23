Class {
	#name : 'Ally',
	#superclass : 'CardAction',
	#instVars : [
		'ship1',
		'ship2'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'introspection' }
Ally class >> className [ 
	'Ally'.
]

{ #category : 'effects' }
Ally >> actOn: aSpaceship from: aCardSpaceship during: aGame [
	ship1:=aSpaceship.
	ship2:=aCardSpaceship .

	aGame cards add: self against: aSpaceship .
	aCardSpaceship allyWith: aSpaceship.
	aSpaceship allyWith: aCardSpaceship .

]

{ #category : 'effects' }
Ally >> actOn: aSpaceship from: aCardSpaceship in: aGame [
	Error signal:'Permanent Card can only be played turing turn'

]

{ #category : 'removing' }
Ally >> removeAction:aSpaceship in:aGame [
	
	ship1 breakAlliance.
  	ship2 breakAlliance.
	
]
