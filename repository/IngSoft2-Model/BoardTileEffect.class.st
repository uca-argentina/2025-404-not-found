Class {
	#name : 'BoardTileEffect',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
BoardTileEffect >> applyTo: aSpaceship [
    self subclassResponsibility

]

{ #category : 'accessing' }
BoardTileEffect >> position [
    ^ position
]

{ #category : 'accessing' }
BoardTileEffect >> position: aNumber [
    position := aNumber
]
