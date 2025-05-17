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
		'wormholeExit'
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
	| dice board wormhole spaceships |

   dice := dieValues collect: [ :val | Die with: val ].
   wormhole := Wormhole entrance: wormholeEntrance exit: wormholeExit.
	board := Board with: boardSize wormhole: wormhole.
	spaceships := spaceshipNames collect: [ :name | Spaceship withName: name withBoard: board ].

   ^ Game with: spaceships andDice: dice.
]

{ #category : 'initialization' }
GameBuilder >> initialize [
    spaceshipNames := OrderedCollection new.
    dieValues := OrderedCollection new.
]

{ #category : 'initialization' }
GameBuilder >> setBoardSize: aSize [
    boardSize := aSize.
]

{ #category : 'initialization' }
GameBuilder >> setWormholeEntrance: entrance exit: exit [
    wormholeEntrance := entrance.
    wormholeExit := exit.
]
