"
Creates the tiles for the board
"
Class {
	#name : 'TileDistributionStrategy',
	#superclass : 'Object',
	#instVars : [
		'maxDiceValue',
		'boardSize'
	],
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
	boardSize :=numberOfTiles .
	tiles := (1 to: numberOfTiles) collect: [ :pos |
        | tile |
        tile := self randomTile:pos.
      " tile position: pos."
        tile
    ].
	^ tiles
]

{ #category : 'initialization' }
TileDistributionStrategy >> randomTile [
   | r strategies |
    r := Random new next.
    strategies := { 
			 0.10 -> [ DrawCardTile new].
        0.38 -> [ CommonTile new ].
        0.60 -> [ BlackHole new ].
        0.80 -> [ HyperGravity new ].
        0.90 -> [ MoonWalk new ].
        0.92 -> [ AtomicBomb new ].
        1.00 -> [ HyperJump new ] 
    }.
    
    ^ (strategies detect: [ :assoc | r < assoc key ]) value value.
]

{ #category : 'initialization' }
TileDistributionStrategy >> randomTile:pos [
   | random strategies selectionValue parsecs |
    random := Random new.
		selectionValue := random next. "Valor para la probabilidad (0.0 a 1.0)"
    strategies := { 
			 0.10 -> [ DrawCardTile inPosition: pos withDeck: (CardDeck new)].
        0.38 -> [ CommonTile inPosition: pos].
        0.60 -> [ BlackHole inPosition:pos ].
        0.80 -> [ HyperGravity inPosition: pos needingToRoll:((1 to: maxDiceValue) atRandom: random)].
        0.90 -> [ MoonWalk inPosition: pos backingUp: ((1 to: maxDiceValue) atRandom: random).].
        0.92 -> [ AtomicBomb inPosition:pos ].
        1.00 -> [ 
			parsecs := (1 to:3) collect: [ :i | 
        Parsec with: ((1 to: 10) atRandom:random ) ].
				(HyperJump inPosition: pos)convert: 2 with: (Parsec with:(boardSize ))and: {Parsec with:10 . Parsec with:12 . Parsec with:8 . Parsec with:5 . Parsec with:3. Parsec with:2}
				].
    }.
    
    ^ (strategies detect: [ :assoc | selectionValue < assoc key ]) value value.
]

{ #category : 'initialization' }
TileDistributionStrategy >> setBoardSize: aNumber [
	boardSize:=aNumber
]

{ #category : 'initialization' }
TileDistributionStrategy >> setMaxDiceValue:aValue [
	maxDiceValue:=aValue .
]
