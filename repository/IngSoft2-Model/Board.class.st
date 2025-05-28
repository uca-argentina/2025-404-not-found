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
Board class >> with: aBoardSize [ 
	aBoardSize negative ifTrue: [Error signal: 'Board size should be positive'].
	^ self new with: aBoardSize
]

{ #category : 'instance creation' }
Board class >> with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox [ 
	aBoardSize negative ifTrue: [Error signal: 'Board size should be positive'].
	((anEntranceBox negative) or: (anEntranceBox >aBoardSize )) ifTrue: [ Error signal: 'Entrance box should be inside the board' ].
	((anExitBox negative) or: (anExitBox >aBoardSize )) ifTrue: [ Error signal: 'Exit box should be inside the board' ].
	^ self new with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox.
]

{ #category : 'adding' }
Board >> addTile: aTile [
	self tiles at: aTile position put: aTile.
]

{ #category : 'adding' }
Board >> addWormHolewithEntraceTile: entrancePosition exitTile: exitPosition [ 

	|wormholeEntrance wormholeExit |
	
	wormholeEntrance:= WormHole inPosition: 2 withEffect: exitPosition -entrancePosition.
	wormholeExit:= WormHole  inPosition:6 withEffect:entrancePosition -exitPosition.
	
	self addTile:wormholeEntrance.
	self addTile:wormholeExit.
	 
]

{ #category : 'accessing' }
Board >> applyTileEffectTo: aSpaceship [
	| tile |
    "tile := self tileAt: aSpaceship position.
    tile ifNotNil: [ tile applyEffectsTo: aSpaceship ]."
	tile := self tileAt: aSpaceship position.
	tile ifNotNil: [ tile applyEffectsTo: aSpaceship ].
]

{ #category : 'check' }
Board >> boardPosition: position [
	(position < 0) ifTrue: [ ^ size + position ].
	(position > size) ifTrue: [ ^ position \\ size -1].
	^ position.
]

{ #category : 'check' }
Board >> checkLimits: aPosition [ 
	(aPosition < 0) ifTrue: [ ^ -1 ].
	(aPosition > size) ifTrue: [ ^ 1 ].
	^ 0. 
]

{ #category : 'initialization' }
Board >> initializeTiles [
    tiles := (1 to: size) collect: [ :i |
        (CommonTile new)
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
Board >> with: aBoardSize [
	size := aBoardSize.
	self initializeTiles.
]

{ #category : 'initialization' }
Board >> with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox [
	size := aBoardSize.
	self initializeTiles.
	wormhole := Wormhole entrance: anEntranceBox exit: anExitBox.
]
