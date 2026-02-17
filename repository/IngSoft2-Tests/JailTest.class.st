Class {
	#name : 'JailTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
JailTest >> testWhenSpaceshipJailedGetsMaxDiceAndLeaves [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame jail |
	aBoard := Board with: 20. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap . 	
	aBoard setGame: aGame. 
	
	jail := Jail inPosition: 4. 	
	aBoard addTile: jail.
	aSpaceship2 turn: 4.
	aSpaceship1 turn: 5.
	aSpaceship2 turn: 12.
	
	self assert: aSpaceship2 position equals: (Position in: 16 at: 0).

]

{ #category : 'tests' }
JailTest >> testWhenSpaceshipLandsOnJailCantGo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame jail |
	aBoard := Board with: 20. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap  . 	
	aBoard setGame: aGame. 
	
	jail := Jail inPosition: 4. 	
	aBoard addTile: jail.
	aSpaceship2 turn: 4.
	aSpaceship1 turn: 5.
	aSpaceship2 turn: 5.
	
	self assert: aSpaceship2 position equals: (Position in: 4 at: 0).

]

{ #category : 'tests' }
JailTest >> testWhenSpaceshipLandsOnJailCantGo2 [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame jail |
	aBoard := Board with: 20. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap . 	
	aBoard setGame: aGame. 
	
	jail := Jail inPosition: 5. 	
	aBoard addTile: jail.
	aSpaceship2 turn: 5.
	aSpaceship1 turn: 5.
	aSpaceship2 turn: 4.
	
	self assert: aSpaceship2 position equals: (Position in: 5 at: 0).

]

{ #category : 'tests' }
JailTest >> testWhenSpaceshipLandsOnJailOtherMove [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame jail |
	aBoard := Board with: 20. 	
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30. 	
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30. 	
	spaceships := { aSpaceship1 . aSpaceship2}. 	
	"1 vuelta = 6 nextTurn     1   2   1   2   1   2 " 	
	aDie1 := LoadedDie with: { 3 . 4 . 3 . 1}. 
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 2}. 	
	dice := { aDie1 . aDie2 }. 	lap := 2. 	
	aGame := Game with: spaceships andDice: dice laps: lap  . 	
	aBoard setGame: aGame. 
	
	jail := Jail inPosition: 4. 	
	aBoard addTile: jail.
	aSpaceship2 turn: 4.
	aSpaceship1 turn: 5.
	aSpaceship2 turn: 4.
	
	self assert: aSpaceship1 position equals: (Position in: 5 at: 0).

]
