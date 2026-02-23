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
		'maxFuel',
		'spaceships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'adding' }
GameBuilder >> addCards [
	| deck cards |
	deck := CardDeck new.
	cards := OrderedCollection new.
	2 timesRepeat: [ cards add: (deck draw) ].
	^cards
]

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

	| dice board cards game |
	maxFuel := dieValues sum.
	dice := dieValues collect: [ :val | Die with: val ].
	board := Board withRandom: boardSize withMax: (dice sum: [ :die | die numberSides ]).
	board addWormHolewithEntraceTile:wormholeEntrance exitTile:wormholeExit .
	cards := self addCards.
	spaceships := spaceshipNames collect: [ :name | Spaceship withName: name withBoard: board withMaxFuel: maxFuel withCards: cards].
	game:=Game with: spaceships andDice: dice laps: laps .
	board setGame: game.
	^ game. 
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

{ #category : 'accessing' }
GameBuilder >> spaceships [
	^spaceships .
]
