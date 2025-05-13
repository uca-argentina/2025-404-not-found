Class {
	#name : 'GameFactoryToPlay',
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
GameFactoryToPlay >> addDieWithValue: aValue [
    dieValues add: aValue.
]

{ #category : 'initialization' }
GameFactoryToPlay >> addSpaceshipNamed: aName [
    spaceshipNames add: aName.
]

{ #category : 'initialization' }
GameFactoryToPlay >> buildGameToPlay [
    | dice board wormhole spaceships |

    dice := dieValues collect: [ :val | Die with: val ].
    wormhole := Wormhole entrance: wormholeEntrance exit: wormholeExit.
    board := Board with: boardSize wormhole: wormhole.

    spaceships := spaceshipNames collect: [ :name | Spaceship withName: name withBoard: board ].

    ^ Game with: spaceships andDice: dice andBoard: board.
]

{ #category : 'initialization' }
GameFactoryToPlay >> initialize [
    spaceshipNames := OrderedCollection new.
    dieValues := OrderedCollection new.
]

{ #category : 'initialization' }
GameFactoryToPlay >> setBoardSize: aSize [
    boardSize := aSize.
]

{ #category : 'initialization' }
GameFactoryToPlay >> setWormholeEntrance: entrance exit: exit [
    wormholeEntrance := entrance.
    wormholeExit := exit.
]
