Class {
	#name : 'WormholeTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
WormholeTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnEntranceHoleThenGoesThroughExitHole [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 }.
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap .
	aBoard addWormHolewithEntraceTile:2 exitTile:6.
	aBoard setGame: aGame.
	
	aSpaceship1 turn: 2.
	
	self assert: aSpaceship1 position equals: (Position in: 6 at: 0).
]

{ #category : 'tests' }
WormholeTest >> testWhenSpaceshipLandsOnExitHoleThenGoesThroughEntranceHole [ 
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 }.
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap .
	aBoard addWormHolewithEntraceTile:2 exitTile:6.
	aBoard setGame: aGame.
	
	aSpaceship1 turn: 6.
	
	self assert: aSpaceship1 position equals: (Position in: 2 at: 0).
]

{ #category : 'tests' }
WormholeTest >> testWhenWormholeEntranceBoxOutsideBoardThenCreationFails [
	| sizeOfBoard aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame |
	sizeOfBoard := 20.
	aBoard:=Board with: sizeOfBoard.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 }.
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap .
	aBoard setGame: aGame .
	self
		should: [ aBoard addWormHolewithEntraceTile:-1 exitTile:6.]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
		
	self
		should: [ aBoard addWormHolewithEntraceTile:22 exitTile:6. ]
		raise: Error
		withMessageText: 'Tile should be inside the board'.
]

{ #category : 'tests' }
WormholeTest >> testWhenWormholeExitBoxOutsideBoardThenCreationFails [
	| sizeOfBoard aBoard|
	sizeOfBoard := 20.
	aBoard:=Board with: sizeOfBoard.
	self
		should: [ aBoard addWormHolewithEntraceTile:2 exitTile:-6. ]
		raise: Error
		withMessageText: 'Tile should be a positive position'.
		
	self
		should: [ aBoard addWormHolewithEntraceTile:2 exitTile:26. ]
		raise: Error
		withMessageText: 'Tile should be inside the board'.
]
