Class {
	#name : 'Unit',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#classInstVars : [
		'value'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Unit class >> with: aValue [
	^self new initializeWith:aValue .
]

{ #category : 'initialization' }
Unit >> initializeWith: aValue [
	value:=aValue 
]

{ #category : 'as yet unclassified' }
Unit >> parsec [ 
  self subclassResponsibility.

]
