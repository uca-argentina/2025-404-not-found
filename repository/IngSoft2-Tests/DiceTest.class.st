Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceTest >> testWhenTheDieIsRolledThenTheResultIsBetween1And6 [

	| sides aDie number |
	sides := 6.
	aDie := Die with: sides.
	number := aDie roll.
	self assert: (number >= 1 and: number <= sides )
]

{ #category : 'tests' }
DiceTest >> testWhenTheDieIsRolledThenTheResultIsBetween1AndN [

	| sides aDie number |
	sides := 20.
	aDie := Die with: sides.
	number := aDie roll.
	self assert: (number >= 1 and: number <= sides)
]
