"
Creates the tiles for the board
"
Class {
	#name : 'TileDistributionStrategy',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
TileDistributionStrategy >> initializeTiles: numberOfTiles [
	| tiles |
	tiles := (1 to: numberOfTiles) collect: [ :pos |
        | tile |
        tile := CommonTile inPosition: pos.
        tile
    ].
	^ tiles
]

{ #category : 'initialization' }
TileDistributionStrategy >> initializeTilesRandom: numberOfTiles [
   | tiles |
	tiles := (1 to: numberOfTiles) collect: [ :pos |
        | tile |
        tile := self randomTile.
        tile position: pos.
        tile
    ].
	^ tiles
]

{ #category : 'initialization' }
TileDistributionStrategy >> randomTile [
    | r |
    r := Random new next.

    (r < 0.40) ifTrue: [ ^ CommonTile new ].
    (r < 0.60) ifTrue: [ ^ BlackHole new ].
    (r < 0.80) ifTrue: [ ^ HyperGravity new ].
    (r < 0.90) ifTrue: [ ^ MoonWalk new ].
    (r < 0.92) ifTrue: [ ^ AtomicBomb new ].
    ^ HyperJump new.
]
