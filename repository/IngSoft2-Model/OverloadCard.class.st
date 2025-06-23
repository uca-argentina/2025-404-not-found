"
overload card
"
Class {
	#name : 'OverloadCard',
	#superclass : 'Object',
	#instVars : [
		'penalty',
		'name',
		'applied'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
OverloadCard >> appliedTo: aSpaceship [ 
	applied:=aSpaceship .
]

{ #category : 'initialization' }
OverloadCard >> initialize [ 
	penalty:=2.
	name:='overload'.
]

{ #category : 'testing' }
OverloadCard >> is: aName [
^ name=aName. 
]

{ #category : 'accessing' }
OverloadCard >> penalty [
	^ penalty
]
