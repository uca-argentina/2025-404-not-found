"
Board class creates a board with a size, checks for limits and for warm holes.
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'wormhole',
		'size',
		'tiles'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox [ 
	aBoardSize negative ifTrue: [Error signal: 'Board size should be positive'].
	((anEntranceBox negative) or: (anEntranceBox >aBoardSize )) ifTrue: [ Error signal: 'Entrance box should be inside the board' ].
	((anExitBox negative) or: (anExitBox >aBoardSize )) ifTrue: [ Error signal: 'Exit box should be inside the board' ].
	^ self new with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox.
]

{ #category : 'adding' }
Board >> addEffect: anEffect [
    (self tileAt: anEffect position) addEffect: anEffect.
]

{ #category : 'as yet unclassified' }
Board >> applyTileEffectTo: aSpaceship [
    | tile |
    tile := self tileAt: aSpaceship position.
    tile ifNotNil: [ tile applyEffectsTo: aSpaceship ].
]

{ #category : 'check' }
Board >> calculateMoves: position and: newPosition [
	| finalPosition moves |
	finalPosition := self checkAndRelocate: newPosition.
	moves := (finalPosition > position)
	ifTrue: [ finalPosition - position ]
	ifFalse: [ size - position + finalPosition ].
	^moves.
]

{ #category : 'check' }
Board >> checkAndRelocate: aSpaceshipPosition [
	| position |
	position := aSpaceshipPosition.
	(self checkLimits: aSpaceshipPosition) ifFalse: [ 
		position := aSpaceshipPosition \\ size - 1.
	].
	^ wormhole newPosition: position 

 
	
	
]

{ #category : 'check' }
Board >> checkLimits: aPosition [ 
	^(aPosition>=0 and: aPosition<=size)
]

{ #category : 'initialization' }
Board >> initializeTiles [
    tiles := (1 to: size) collect: [ :i |
        (BoardTile new)
            position: i;
            yourself ].
]

{ #category : 'accessing' }
Board >> size [ 
	^size
]

{ #category : 'accessing' }
Board >> tileAt: aPosition [
    (aPosition = 0) ifTrue: [ ^ nil ].
    ^ tiles at: aPosition.

]

{ #category : 'accessing' }
Board >> tiles [
    ^ tiles
]

{ #category : 'initialization' }
Board >> with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox [
	size := aBoardSize.
	self initializeTiles.
	wormhole := Wormhole entrance: anEntranceBox exit: anExitBox.
]
