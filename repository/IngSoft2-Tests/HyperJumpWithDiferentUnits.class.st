Class {
	#name : 'HyperJumpWithDiferentUnits',
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
HyperJumpWithDiferentUnits >> setUp [
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
HyperJumpWithDiferentUnits >> testWhenHyperJumpReceivesLightYears [	
	| hyperJump | 	  
	
	hyperJump := HyperJump inPosition: 4. 	
	hyperJump convert: 2 with: (LightYear with:(aBoard size)*3 )and: {LightYear with:30 . LightYear with:36 . LightYear with:24 . LightYear with:15 . LightYear with:9. LightYear with:6} .

	aBoard addTile: hyperJump .
	
	aSpaceship1 turn: 4.
	
	self assert: aSpaceship1 position equals: (Position in: 10 at: 0).
]

{ #category : 'tests' }
HyperJumpWithDiferentUnits >> testWhenHyperJumpReceivesLightYearsAndParsec [
	| hyperJump | 	  
	
	hyperJump := HyperJump inPosition: 4. 	
	hyperJump convert: 2 with: (Parsec with:(aBoard size) )and: {LightYear with:30 . LightYear with:36 . LightYear with:24 . LightYear with:15 . LightYear with:9. LightYear with:6} .

	aBoard addTile: hyperJump .
	
	aSpaceship1 turn: 4.
	
	self assert: aSpaceship1 position equals: (Position in: 10 at: 0).
]

{ #category : 'tests' }
HyperJumpWithDiferentUnits >> testWhenHyperJumpReceivesParsecs [	
	| hyperJump | 	  
	
	hyperJump := HyperJump inPosition: 4. 	
	hyperJump convert: 2 with: (Parsec with:(aBoard size) )and: {Parsec with:10 . Parsec with:12 . Parsec with:8 . Parsec with:5 . Parsec with:3. Parsec with:2} .

	aBoard addTile: hyperJump .
	
	aSpaceship1 turn: 4.
	
	self assert: aSpaceship1 position equals: (Position in: 10 at: 0).
]
