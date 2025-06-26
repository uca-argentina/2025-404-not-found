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
	(self checkLimits:(tile position) ) ifFalse: [ 
		 Error signal: 'Tile should be inside board'].

	tiles at: tile position put: tile
]

{ #category : 'adding' }
Board >> addWormHolewithEntraceTile: entrance exitTile: exit [

	| entranceWormhole exitWormhole |
	(entrance > size)  ifTrue: [
		Error signal: 'Tile should be inside the board' ].
	(exit > size)  ifTrue: [
		Error signal: 'Tile should be inside the board' ].
	
	
	entranceWormhole := WormHole inPosition: entrance withEffect: exit - entrance.
	exitWormhole := WormHole inPosition: exit withEffect: entrance - exit.
	self
		addTile: entranceWormhole;
		addTile: exitWormhole
]

{ #category : 'as yet unclassified' }
Board >> applyCard: anOverloadCard to: aSpaceship [ 
	game addPermanentCard:anOverloadCard against:aSpaceship .
]

{ #category : 'accessing' }
Board >> applyTileEffectTo: aSpaceship [ 	
	| tile |   
	tile := self tileAt: aSpaceship position. 	
	"
	(tile notNil and: [ tile class ~= CommonTile ]) ifTrue: [
        game ifNotNil: [ game saveLastEffect: tile ].
    ]."
    tile ifNotNil: [
        tile applyEffectsTo: aSpaceship in: game
    ].
]

{ #category : 'check' }
Board >> boardPosition: position [	
	| finalPosition |
	finalPosition := position inside: size.
	^finalPosition
	
]

{ #category : 'check' }
Board >> checkLimits: aNumber [
	^ (aNumber<size) & (aNumber>0)
	
]

{ #category : 'as yet unclassified' }
Board >> gotMaxRoll: valueRoll [
	^ game maxRoll = valueRoll .
	
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

	position index = 0 ifTrue: [ ^ nil ].
	^ tiles at: position index
]

{ #category : 'initialization' }
Board >> with: aSize [

	size := aSize.
	tiles := (TileDistributionStrategy new) initializeTiles: aSize.
]

{ #category : 'initialization' }
Board >> withRandom: aSize [

	size := aSize.
	tiles := (TileDistributionStrategy new) initializeTilesRandom: aSize.
]
