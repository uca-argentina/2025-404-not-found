Class {
	#name : 'GameWithReverse',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
GameWithReverse >> testWhenSpaceshipPlaysReverseCard [
	| aBoard aSpaceship1 aSpaceship2 spaceships aDie1 aDie2 dice lap aGame |
	aBoard := Board with: 20.
	aSpaceship1 := Spaceship withName: 'Nave 1' withBoard: aBoard withMaxFuel: 30.
	aSpaceship2 := Spaceship withName: 'Nave 2' withBoard: aBoard withMaxFuel: 30.
	spaceships := { aSpaceship1 . aSpaceship2 }.
	"Exacto una vuelta         1   2   1   2   1   2 "
	aDie1 := LoadedDie with: { 3 . 3 . 3 . 3 . 4 . 4}.
	aDie2 := LoadedDie with: { 3 . 3 . 3 . 3 . 5 . 5}.
	dice := { aDie1 . aDie2 }.
	lap := 1.
	aGame := Game with: spaceships andDice: dice laps: lap .
	aBoard addWormHolewithEntraceTile: 12 exitTile: 18.
	aBoard setGame: aGame.
	
	aGame nextTurn.
	aGame nextTurn.
	
]
