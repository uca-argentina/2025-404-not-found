Class {
	#name : 'BoardTileEffectTest',
	#superclass : 'TestCase',
	#instVars : [
		'aBoard',
		'aSpaceship1',
		'aSpaceship2',
		'spaceships',
		'aDie1',
		'aDie2',
		'dice',
		'lap',
		'aGame'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
BoardTileEffectTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	aBoard := Board with: 20. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap. 	
	aBoard setGame: aGame. 
]

{ #category : 'tests' }
BoardTileEffectTest >> testABWhenSpaceshipLandsOnAtomicBombAndGoesBackToOThenLapsDontChange [
	| atomicBomb | 	 	
	atomicBomb := AtomicBomb inPosition: 4. 	
	aBoard addTile: atomicBomb.
	aSpaceship2 turn: 18.
	aSpaceship1 turn: 25.
	
	self assert: aSpaceship1 position equals: (Position in: 0 at: 1).
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0).
]

{ #category : 'tests' }
BoardTileEffectTest >> testABWhenSpaceshipLandsOnAtomicBombThenAllSpaceshipsGoBackTo0 [
	| atomicBomb | 	 	
	atomicBomb := AtomicBomb inPosition: 9. 	
	aBoard addTile: atomicBomb.
	aSpaceship2 turn: 8.	
	aSpaceship1 turn: 9. 
	
	self assert: aSpaceship1 position equals: (Position in: 0 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 0 at: 0).
]

{ #category : 'tests' }
BoardTileEffectTest >> testABWhenSpaceshipLandsOnAtomicBombThenSpaceshipsDontUseFuel [
	| atomicBomb | 	 	
	atomicBomb := AtomicBomb inPosition: 9. 	
	aBoard addTile: atomicBomb.
	aSpaceship1 turn: 9. 
	 
	self assert: aSpaceship2 fuel equals: 30.
	self assert: aSpaceship1 fuel equals: 21.
]

{ #category : 'tests' }
BoardTileEffectTest >> testBHWhenBlackHoleEffectIsApliedThenFuelGoesDown [
	| blackHole |
	
	blackHole:= BlackHole inPosition: 9.
	aBoard addTile: blackHole.
	
	aSpaceship1 turn: 9.
	
	self assert: aSpaceship1 fuel equals: 17.
	

]

{ #category : 'tests' }
BoardTileEffectTest >> testBHWhenFuelRunsOutDurginBlackHoleThenGoesBackTo0AndIsPenalized [
	| blackHole |
	
	blackHole := BlackHole inPosition: 7.
	aBoard addTile: blackHole.
	
	aSpaceship1 turn: 28.
	
	self assert: aSpaceship1 position equals: (Position in: 0 at: 1).	

]

{ #category : 'tests' }
BoardTileEffectTest >> testBHWhenGoingBackwardsCanReduceOneLap [
	| blackHole |
	
	blackHole := BlackHole inPosition: 2.
	aBoard addTile: blackHole.
	
	aSpaceship1 turn: 23.
	
	self assert: aSpaceship1 position equals: (Position in: 18 at: 0).	

]

{ #category : 'tests' }
BoardTileEffectTest >> testBHWhenSpaceShipLandsOnBlackHoleMovesBackwardsThenNoOtherEffectIsApplied [
	
	| blackHole blackHole2 |
	blackHole := BlackHole inPosition: 9.
	aBoard addTile: blackHole.
	blackHole2 := BlackHole inPosition: 5.
	aBoard addTile: blackHole2.
	
	aSpaceship1 turn: 9.
	
	self assert: aSpaceship1 position equals:(Position in: 5 at: 0).
	

]

{ #category : 'tests' }
BoardTileEffectTest >> testBHWhenSpaceShipLandsOnBlackHoleThenItMovesBackwards [
	| blackHole |

	blackHole := BlackHole inPosition: 9.
	aBoard addTile: blackHole.
	
	aSpaceship1 turn: 9.
	
	self assert: aSpaceship1 position equals:(Position in: 5 at: 0).
	

]

{ #category : 'tests' }
BoardTileEffectTest >> testHGWhenSpaceshipLandsOnHyperGravityAndRollIsBiggerThenMoves [
	| hyperGravity | 	 	
	hyperGravity := HyperGravity inPosition: 6. 	
	hyperGravity exitRoll: 2.
	aBoard addTile: hyperGravity .
	
	aSpaceship1 turn: 6.
	aSpaceship1 turn: 6.
	 
	self assert: aSpaceship1 position equals: (Position in: 12 at: 0).
]

{ #category : 'tests' }
BoardTileEffectTest >> testHGWhenSpaceshipLandsOnHyperGravityButRollIsSmallerThenStaysAtTheSamePosition [
	| hyperGravity | 	 	
	hyperGravity := HyperGravity inPosition: 6. 	
	hyperGravity exitRoll: 10.
	aBoard addTile: hyperGravity .
	
	aSpaceship1 turn: 6.
	aSpaceship1 turn: 6.
	 
	self assert: aSpaceship1 position equals: (Position in: 6 at: 0).
]

{ #category : 'tests' }
BoardTileEffectTest >> testHJWhenSecondSpaceshipLandOnHyperJumpThenUsesSecondValue [
	| hyperJump | 	 	
	hyperJump := HyperJump inPosition: 4. 	
	hyperJump convert: 2 with: (Parsec with:(aBoard size))and: {Parsec with:10 . Parsec with:12 . Parsec with:8 . Parsec with:5 . Parsec with:3. Parsec with:2} . "es decir si el tamaño es 20, tendra 20*2 = 40 parsecs y esa es mi lista de valores maximos"
	aBoard addTile: hyperJump .
	
	aSpaceship1 turn: 4.
	aSpaceship2 turn: 4.
	 
	self assert: aSpaceship1 position equals: (Position in: 10 at: 0).
	self assert: aSpaceship2 position equals: (Position in: 9 at: 0).
	
]

{ #category : 'tests' }
BoardTileEffectTest >> testHJWhenSpaceShipLandsOnHyperJumpThenItMovesAccordingToParsecs [
	| hyperJump | 	 	
	hyperJump := HyperJump inPosition: 4. 	
	hyperJump convert: 2 with: (Parsec with:(aBoard size)) and: {Parsec with:10 . Parsec with:12 . Parsec with:8 . Parsec with:5 . Parsec with:3. Parsec with:2} . "es decir si el tamaño es 20, tendra 20*2 = 40 parsecs y esa es mi lista de valores maximos"
	aBoard addTile: hyperJump .
	
	aSpaceship1 turn: 4.
	
	self assert: aSpaceship1 position equals: (Position in: 10 at: 0).
	
]

{ #category : 'tests' }
BoardTileEffectTest >> testMWCorrectFuelUsage [
	| moonWalk | 	 	
	moonWalk := MoonWalk inPosition: 4. 	
	moonWalk tilesToBack: 3.
	aBoard addTile: moonWalk .
	
	aSpaceship1 turn: 6.
	aSpaceship2 turn: 4. "Cae en moonWalk y hace que la 1 retroceda"
	 
	self assert: aSpaceship2 fuel equals: 26.
	self assert: aSpaceship1 fuel equals: 21.
]

{ #category : 'tests' }
BoardTileEffectTest >> testMWWhenOtherSpaceShipRunsOutOfFuelThenItApplisPenalization [
	| moonWalk | 	 	
	moonWalk := MoonWalk inPosition: 4. 	
	moonWalk tilesToBack: 3.
	aBoard addTile: moonWalk .
	
	aSpaceship1 turn: 28.
	aSpaceship2 turn: 4. "Cae en moonWalk y hace que la 1 retroceda"
	 
	"self assert: aSpaceship2 fuel equals: 26."
	self assert: aSpaceship1 position equals: (Position in: 0 at: 1).
	self assert: aSpaceship2 position equals: (Position in: 4 at: 0).
	
]

{ #category : 'tests' }
BoardTileEffectTest >> testMWWhenSpaceShipLandsOnMoonWalkThenOthersBack [
	| moonWalk | 	 	
	moonWalk := MoonWalk inPosition: 4. 	
	moonWalk tilesToBack: 3.
	aBoard addTile: moonWalk .
	
	aSpaceship1 turn: 6.
	aSpaceship2 turn: 4. "Cae en moonWalk y hace que la 1 retroceda"
	 
	self assert: aSpaceship2 position equals: (Position in: 4 at: 0)."se queda en su posicion"
	self assert: aSpaceship1 position equals: (Position in: 3 at: 0). "retrocedio 3 posiciones"
]
