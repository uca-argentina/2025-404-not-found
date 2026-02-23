Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'permanentCards',
		'cardTargets',
		'game'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
CardManager class >> of: aGame [
	^self new initializeOf:aGame.
]

{ #category : 'accessing' }
CardManager >> activeCardsCount [ 
	^ permanentCards size
]

{ #category : 'initialization' }
CardManager >> add: aPermanentCard [ 
	permanentCards add: aPermanentCard.

]

{ #category : 'initialization' }
CardManager >> add: aPermanentCard against:aSpaceship [
	permanentCards add: aPermanentCard .
	cardTargets at: aPermanentCard put:aSpaceship .

]

{ #category : 'accessing' }
CardManager >> cards [ 
	^permanentCards size.
]

{ #category : 'initialization' }
CardManager >> initializeOf:aGame [
	game:=aGame. 
	permanentCards := OrderedCollection new.
	cardTargets:=Dictionary new.
]

{ #category : 'initialization' }
CardManager >> lastCard [ 
	^ permanentCards ifEmpty: [ NullCard with: NullAction new ] ifNotEmpty: [ permanentCards last ].


]

{ #category : 'initialization' }
CardManager >> readLastCard [ 
	permanentCards isEmptyOrNil ifTrue: [
			^ NullCard with: NullAction new ].
	^ permanentCards last


]

{ #category : 'initialization' }
CardManager >> removeCard:aCardToRemove [
| cardToRemoveFromGame  targetSpaceship |
	cardToRemoveFromGame  := permanentCards
		        detect: [ :aPermanentCard  | aPermanentCard  class = aCardToRemove action class ]
		        ifNone: [
		        Error signal: 'La carta a eliminar no esta en juego' ].
	permanentCards remove: cardToRemoveFromGame ."saco"
	
	targetSpaceship:= (cardTargets at:cardToRemoveFromGame).
	targetSpaceship ifNotNil: [ 
		cardToRemoveFromGame removeAction:targetSpaceship in:game.
		cardTargets removeKey:cardToRemoveFromGame ]ifNil: [ cardToRemoveFromGame  removeAction:game . ].
		^ cardToRemoveFromGame 

]
