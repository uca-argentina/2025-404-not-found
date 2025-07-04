Class {
	#name : 'AtomicBomb',
	#superclass : 'BoardTile',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'effects' }
AtomicBomb >> applyEffectsTo: aSpaceship in: aGame [
	aGame saveLastEffect: [:aShip | aShip resetToStartWithoutFuelLoss ].
   aGame activateAtomicBomb.
]
