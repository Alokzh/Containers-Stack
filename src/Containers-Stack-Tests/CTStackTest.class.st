Class {
	#name : #CTStackTest,
	#superclass : #TestCase,
	#instVars : [
		'empty',
		'nonEmpty'
	],
	#category : #'Containers-Stack-Tests'
}

{ #category : #requirements }
CTStackTest >> empty [
	
	^ empty
]

{ #category : #requirements }
CTStackTest >> nonEmpty [
	
	^ nonEmpty
]

{ #category : #setup }
CTStackTest >> setUp [
	super setUp.
	empty := self stackClass new.
	nonEmpty := self stackClass new.
	nonEmpty push: 1.
	nonEmpty push: -2.
	nonEmpty push: 3.
	nonEmpty push: 1.
	
]

{ #category : #setup }
CTStackTest >> stackClass [

	^ CTStack
]

{ #category : #tests }
CTStackTest >> testCapacity [ 

	| aStack |
	aStack := self stackClass new.
	self assert: aStack capacity equals: OrderedCollection new capacity. 
	
]

{ #category : #tests }
CTStackTest >> testCapacityWhenGrowing [

	| aStack |
	aStack := self stackClass new.
	aStack 
		push: 1; push: 2; push: 3; push: 4; push: 5; 
		push: 6; push: 7; push: 8; push: 9 ; push: 10.
	self assert: aStack capacity equals: OrderedCollection new capacity. 
	aStack push: 11.
	self deny: aStack capacity equals: OrderedCollection new capacity
]

{ #category : #tests }
CTStackTest >> testCopyCreatesANewObject [

	| copy |
	copy := self nonEmpty copy.
	self deny: self nonEmpty == copy
]

{ #category : #tests }
CTStackTest >> testCopyEmpty [

	| copy |
	copy := self empty copy.
	self assert: copy isEmpty
]

{ #category : #tests }
CTStackTest >> testEmptyError [

	| aStack |
	aStack := self stackClass new.
	self should: [ aStack top ] raise: Error.
	self should: [ aStack pop ] raise: Error.
	aStack push: 'element'.
	aStack top.
	aStack pop.	"The stack is empty again due to previous pop"
	self should: [ aStack top ] raise: Error.
	self should: [ aStack pop ] raise: Error
]

{ #category : #tests }
CTStackTest >> testIfEmpty [

	| aStack |
	aStack := self stackClass new.
	self assert: (aStack ifEmpty: [ true ]). 
	aStack push: 11.
	self assert: (aStack ifEmpty: [ 1/0 ]) == aStack
]

{ #category : #tests }
CTStackTest >> testIfEmptyIfNotEmpty [

	| aStack |
	aStack := self stackClass new.
	self assert: (aStack ifEmpty: [ true ] ifNotEmpty: [ 1/0 ]). 
	aStack push: 11.
	self assert: (aStack ifEmpty: [ 1/0 ] ifNotEmpty: [ true ])
]

{ #category : #tests }
CTStackTest >> testIfNotEmpty [

	| aStack |
	aStack := self stackClass new.
	self assert: (aStack ifNotEmpty: [ 1/0 ]) == aStack. 
	aStack push: 11.
	self assert: (aStack ifNotEmpty: [ true ])
]

{ #category : #tests }
CTStackTest >> testIfNotEmptyIfEmpty [

	| aStack |
	aStack := self stackClass new.
	self assert: (aStack ifNotEmpty: [ 1/0 ] ifEmpty: [ true ]). 
	aStack push: 11.
	self assert: (aStack  ifNotEmpty: [ true ] ifEmpty: [ 1/0 ]) 
]

{ #category : #tests }
CTStackTest >> testIsEmpty [

	| aStack |
	aStack := self stackClass new.
	self assert: aStack isEmpty.
	aStack push: 1.
	self deny: aStack isEmpty

]

{ #category : #tests }
CTStackTest >> testPop [

	| aStack res elem |
	elem := 'anElement'.	
	aStack := self stackClass  new.
	self assert: aStack isEmpty.
	
	aStack push: 'a'.
	aStack push: elem.
	res := aStack pop.	
	self assert: res equals: elem.
	self assert: res == elem.
	
	self assert: aStack size equals: 1.
	aStack pop.
	self assert: aStack isEmpty.


]

{ #category : #tests }
CTStackTest >> testPreAllocateIntern [

	| aStack |
	aStack := self stackClass new: 1000.
	self assert: aStack capacity equals: 1000. 
	
]

{ #category : #tests }
CTStackTest >> testPush [
	
	| aStack |
	aStack := self stackClass new.
	aStack push: 'a'.
	self assert: aStack size = 1.	
	aStack push: 'b'.
	self assert: aStack size = 2.
	
]

{ #category : #tests }
CTStackTest >> testSize [
	
	| aStack |
	aStack := self stackClass new.
	self assert: aStack size equals: 0.
	aStack push: 'a'.
	self assert: aStack size equals: 1.
	aStack push: 'b'.
	self assert: aStack size equals: 2.
	aStack pop.
	self assert: aStack size equals: 1.
	aStack pop.
	self assert: aStack size equals: 0.

 
	



]

{ #category : #tests }
CTStackTest >> testTop [

	| aStack |
	aStack := self stackClass new.
	self assert: aStack isEmpty.
	aStack push: 'a'.
	aStack push: 'b'.
	self assert: aStack top equals: 'b'.
	self assert: aStack top equals: 'b'.
	self assert: aStack size equals: 2.
]
