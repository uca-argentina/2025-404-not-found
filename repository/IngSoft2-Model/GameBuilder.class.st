"
Game builder 
"
Class {
	#name : 'GameBuilder',
	#superclass : 'Object',
	#instVars : [
		'spaceshipNames',
		'dieValues',
		'boardSize',
		'wormholeEntrance',
		'wormholeExit',
		'laps',
		'maxFuel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
GameBuilder >> addDieWithValue: aValue [
    dieValues add: aValue.
]

{ #category : 'initialization' }
GameBuilder >> addSpaceshipNamed: aName [
    spaceshipNames add: aName.
]

{ #category : 'initialization' }
GameBuilder >> buildGame [

	| dice board spaceships |
	maxFuel := dieValues sum.
	dice := dieValues collect: [ :val | Die with: val ].
	board := Board with: boardSize entranceBox: wormholeEntrance exitBox: wormholeExit.
	spaceships := spaceshipNames collect: [ :name | Spaceship withName: name withBoard: board withMaxFuel: maxFuel ].

	^ Game with: spaceships andDice: dice laps: laps
]

{ #category : 'initialization' }
GameBuilder >> initialize [
    spaceshipNames := OrderedCollection new.
    dieValues := OrderedCollection new.
]

{ #category : 'accessing' }
GameBuilder >> maxFuel [
	^maxFuel 
]

{ #category : 'initialization' }
GameBuilder >> setBoardSize: aSize [
    boardSize := aSize.
]

{ #category : 'initialization' }
GameBuilder >> setGameLaps: numberOfLaps [
	laps := numberOfLaps.
]

{ #category : 'initialization' }
GameBuilder >> setWormholeEntrance: entrance exit: exit [
    wormholeEntrance := entrance.
    wormholeExit := exit.
]
