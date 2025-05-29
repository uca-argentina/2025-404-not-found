"
Board class creates a board with a size, checks for limits and for warm holes.
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'wormhole',
		'size',
		'tiles',
		'game'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> with: arg1 [

	arg1 negative ifTrue: [
		Error signal: 'Board size should be positive' ].
	^ self new with: arg1
]

{ #category : 'instance creation' }
Board class >> with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox [ 
	aBoardSize negative ifTrue: [Error signal: 'Board size should be positive'].
	((anEntranceBox negative) or: (anEntranceBox >aBoardSize )) ifTrue: [ Error signal: 'Entrance box should be inside the board' ].
	((anExitBox negative) or: (anExitBox >aBoardSize )) ifTrue: [ Error signal: 'Exit box should be inside the board' ].
	^ self new with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox.
]

{ #category : 'instance creation' }
Board class >> withRandom: arg1 [

	arg1 negative ifTrue: [
		Error signal: 'Board size should be positive' ].
	^ self new withRandom: arg1
]

{ #category : 'adding' }
Board >> addTile: arg1 [
	(self checkLimits:(arg1 position) )~=0 ifTrue: [ 
		 Error signal: 'Tile should be inside board'].

	self tiles at: arg1 position put: arg1
]

{ #category : 'adding' }
Board >> addWormHolewithEntraceTile: arg1 exitTile: arg2 [

	| tmp1 tmp2 |
	(arg1 > size)  ifTrue: [
		Error signal: 'Tile should be inside the board' ].
	(arg2 > size)  ifTrue: [
		Error signal: 'Tile should be inside the board' ].
	
	
	tmp1 := WormHole inPosition: arg1 withEffect: arg2 - arg1.
	tmp2 := WormHole inPosition: arg2 withEffect: arg1 - arg2.
	self
		addTile: tmp1;
		addTile: tmp2
]

{ #category : 'accessing' }
Board >> applyTileEffectTo: aSpaceship [ 	
	| tile |   
	tile := self tileAt: aSpaceship position. 	
	tile ifNotNil: [ tile applyEffectsTo: aSpaceship in: game].
]

{ #category : 'check' }
Board >> boardPosition: arg1 [

	arg1 < 0 ifTrue: [ ^ size + arg1 ].
	nil.
	arg1 > size ifTrue: [ ^ arg1 \\ size - 1 ].
	nil.
	^ arg1
]

{ #category : 'check' }
Board >> checkLimits: arg1 [

	arg1 < 0 ifTrue: [ ^  -1 ].
	nil.
	arg1 > size ifTrue: [ ^ 1 ].
	nil.
	^ 0
]

{ #category : 'accessing' }
Board >> game [ 	
	^game
]

{ #category : 'initialization' }
Board >> initializeTiles [

	tiles := (1 to: size) collect: [ :arg1 |
		         | tmp2 |
		         tmp2 := CommonTile new.
		         tmp2
			         position: arg1;
			         yourself ]

]

{ #category : 'initialization' }
Board >> initializeTilesRandom [
    tiles := (1 to: size) collect: [ :i |
        | tile |
        tile := self randomTile.
        tile position: i.
        tile
    ].
]

{ #category : 'as yet unclassified' }
Board >> randomTile [
    | r |
    r := Random new next.

    (r < 0.40) ifTrue: [ ^ CommonTile new ].
    (r < 0.60) ifTrue: [ ^ BlackHole new ].
    (r < 0.80) ifTrue: [ ^ HyperGravity new ].
    (r < 0.90) ifTrue: [ ^ MoonWalk new ].
    (r < 0.92) ifTrue: [ ^ AtomicBomb new ].
    ^ HyperJump new.
]

{ #category : 'initialization' }
Board >> setGame: aGame [ 
	game := aGame.
]

{ #category : 'accessing' }
Board >> size [ 
	^size
]

{ #category : 'accessing' }
Board >> tileAt: arg1 [

	arg1 = 0 ifTrue: [ ^ nil ].
	nil.
	^ tiles at: arg1
]

{ #category : 'accessing' }
Board >> tiles [

	^ tiles
]

{ #category : 'initialization' }
Board >> with: arg1 [

	size := arg1.
	self initializeTiles
]

{ #category : 'instance creation' }
Board >> with: aBoardSize entranceBox: anEntranceBox exitBox: anExitBox [.
	size := aBoardSize.
	entranceBox := anEntranceBox.
	exitBox := anEntranceBox.
	self initializeTiles.
]

{ #category : 'initialization' }
Board >> withRandom: arg1 [

	size := arg1.
	self initializeTilesRandom
]
