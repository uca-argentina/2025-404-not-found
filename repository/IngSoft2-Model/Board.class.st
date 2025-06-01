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
Board class >> with: aBoardSize [

	aBoardSize negative ifTrue: [
		Error signal: 'Board size should be positive' ].
	^ self new with: aBoardSize
]

{ #category : 'instance creation' }
Board class >> withRandom: arg1 [

	arg1 negative ifTrue: [
		Error signal: 'Board size should be positive' ].
	^ self new withRandom: arg1
]

{ #category : 'adding' }
Board >> addTile: tile [
	(self checkLimits:(tile position) )~=0 ifTrue: [ 
		 Error signal: 'Tile should be inside board'].

	self tiles at: tile position put: tile
]

{ #category : 'adding' }
Board >> addWormHolewithEntraceTile: entrance exitTile: exit [

	| tmp1 tmp2 |
	(entrance > size)  ifTrue: [
		Error signal: 'Tile should be inside the board' ].
	(exit > size)  ifTrue: [
		Error signal: 'Tile should be inside the board' ].
	
	
	tmp1 := WormHole inPosition: entrance withEffect: exit - entrance.
	tmp2 := WormHole inPosition: exit withEffect: entrance - exit.
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
Board >> boardPosition: position [

	position < 0 ifTrue: [ ^ size + position ].
	position > size ifTrue: [ ^ position \\ size - 1 ].
	^ position
]

{ #category : 'check' }
Board >> checkLimits: position [

	position < 0 ifTrue: [ ^  -1 ].
	position > size ifTrue: [ ^ 1 ].
	^ 0
]

{ #category : 'accessing' }
Board >> game [ 	
	^game
]

{ #category : 'initialization' }
Board >> initializeTiles [		
	tiles := (1 to: size) collect: [ :pos |
        | tile |
        tile := CommonTile new.
        tile position: pos.
        tile
    ].

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

{ #category : 'initialization' }
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
Board >> tileAt: position [

	position = 0 ifTrue: [ ^ nil ].
	^ tiles at: position
]

{ #category : 'accessing' }
Board >> tiles [

	^ tiles
]

{ #category : 'initialization' }
Board >> with: aSize [

	size := aSize.
	self initializeTiles
]

{ #category : 'initialization' }
Board >> withRandom: aSize [

	size := aSize.
	self initializeTilesRandom
]
