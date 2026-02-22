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
   | r strategies |
    r := Random new next.
    strategies := { 
        0.40 -> [ CommonTile new ].
        0.60 -> [ BlackHole new ].
        0.80 -> [ HyperGravity new ].
        0.90 -> [ MoonWalk new ].
        0.92 -> [ AtomicBomb new ].
        1.00 -> [ HyperJump new ] 
    }.
    
    ^ (strategies detect: [ :assoc | r < assoc key ]) value value.
]
