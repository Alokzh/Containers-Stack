Class {
	#name : 'CTStackTest',
	#superclass : 'TestCase',
	#instVars : [
		'stack'
	],
	#category : 'Containers-Stack-Tests',
	#package : 'Containers-Stack-Tests'
}

{ #category : 'running' }
CTStackTest >> setUp [
	super setUp.
	stack := CTStack new: 5
]

{ #category : 'tests' }
CTStackTest >> testAlternatingPushPop [

	stack push: 'a'.
	self assert: stack pop equals: 'a'.
	
	stack push: 'b'; push: 'c'.
	self assert: stack pop equals: 'c'.
	
	stack push: 'd'.
	self assert: stack top equals: 'd'.
	self assert: stack size equals: 2
]

{ #category : 'tests' }
CTStackTest >> testAsArray [

	| result |
	stack push: 'first'; push: 'second'; push: 'third'.
	result := stack asArray.
	
	self assert: result equals: #('third' 'second' 'first').
	"Elements from top to bottom"
]

{ #category : 'tests' }
CTStackTest >> testAsOrderedCollection [

	| result |
	stack push: 'a'; push: 'b'; push: 'c'.
	result := stack asOrderedCollection.
	
	self assert: result class equals: OrderedCollection.
	self assert: result asArray equals: #('c' 'b' 'a').
]

{ #category : 'tests' }
CTStackTest >> testAvailableSpace [

	self assert: stack availableSpace equals: 5.
	stack push: 'a'.
	self assert: stack availableSpace equals: 4.
	stack push: 'b'; push: 'c'.
	self assert: stack availableSpace equals: 2.
	stack pop.
	self assert: stack availableSpace equals: 3
]

{ #category : 'tests' }
CTStackTest >> testCapacity [

	self assert: stack capacity equals: 5.
	stack push: 'test'.
	self assert: stack capacity equals: 5. "Capacity doesn't change"
]

{ #category : 'tests' }
CTStackTest >> testCopyCreatesNewObject [

	| copy |
	stack
		push: 'a';
		push: 'b'.
	copy := stack copy.
	self deny: stack identicalTo: copy
]

{ #category : 'tests' }
CTStackTest >> testCopyHasSameContents [

	| copy |
	stack push: 'first'; push: 'second'; push: 'third'.
	copy := stack copy.
	
	self assert: copy size equals: stack size.
	self assert: copy top equals: stack top.
	self assert: copy capacity equals: stack capacity
]

{ #category : 'tests' }
CTStackTest >> testDefaultStackCreation [

	| defaultStack |
	defaultStack := CTStack new.
	
	self assert: defaultStack capacity equals: 10.
	self assert: defaultStack isEmpty.
	self assert: defaultStack size equals: 0.
	self assert: defaultStack availableSpace equals: 10
]

{ #category : 'tests' }
CTStackTest >> testDoIteration [

	| elements |
	stack push: 'first'; push: 'second'; push: 'third'.
	elements := OrderedCollection new.
	
	stack do: [ :each | elements add: each ].
	
	self assert: elements asArray equals: #('third' 'second' 'first')
]

{ #category : 'tests' }
CTStackTest >> testIsEmpty [

	self assert: stack isEmpty.
	stack push: 'test'.
	self deny: stack isEmpty.
	stack pop.
	self assert: stack isEmpty
]

{ #category : 'tests' }
CTStackTest >> testIsFull [

	self deny: stack isFull.
	stack push: 'a'; push: 'b'; push: 'c'; push: 'd'; push: 'e'.
	self assert: stack isFull.
	stack pop.
	self deny: stack isFull
]

{ #category : 'tests' }
CTStackTest >> testLIFOOrdering [

	stack push: 'first'; push: 'second'; push: 'third'; push: 'fourth'.
	
	self assert: stack pop equals: 'fourth'.
	self assert: stack pop equals: 'third'.
	self assert: stack pop equals: 'second'.
	self assert: stack pop equals: 'first'
]

{ #category : 'tests' }
CTStackTest >> testLargeCapacityStack [

	| largeStack |
	largeStack := CTStack new: 1000000.
	
	1 to: 1000000 do: [ :i | largeStack push: i ].
	self assert: largeStack isFull.
	self assert: largeStack top equals: 1000000.
	
	1000000 to: 1 by: -1 do: [ :i |
		self assert: largeStack pop equals: i
	].
	self assert: largeStack isEmpty
]

{ #category : 'tests' }
CTStackTest >> testPopAllElements [

	stack push: 'a'; push: 'b'; push: 'c'.
	
	stack pop; pop; pop.
	
	self assert: stack isEmpty.
	self assert: stack size equals: 0.
	self assert: stack availableSpace equals: 5
]

{ #category : 'tests' }
CTStackTest >> testPopMultipleElements [

	stack push: 'first'; push: 'second'; push: 'third'.
	
	self assert: stack pop equals: 'third'.
	self assert: stack pop equals: 'second'.
	self assert: stack size equals: 1.
	self assert: stack top equals: 'first'
]

{ #category : 'tests' }
CTStackTest >> testPopSingleElement [

	| element |
	stack push: 'test'.
	element := stack pop.
	
	self assert: element equals: 'test'.
	self assert: stack isEmpty.
	self assert: stack size equals: 0.
	self assert: stack availableSpace equals: 5
]

{ #category : 'tests' }
CTStackTest >> testPushAllOverflow [

	stack push: 'existing'.
	
	self should: [ stack pushAll: #('a' 'b' 'c' 'd' 'e') ] raise: Error
]

{ #category : 'tests' }
CTStackTest >> testPushAllWithArray [

	| result |
	result := stack pushAll: #('a' 'b' 'c').
	
	self assert: stack size equals: 3.
	self assert: result equals: 'c'.
	self assert: stack top equals: 'c'
]

{ #category : 'tests' }
CTStackTest >> testPushAllWithEmptyCollection [

	| result |
	result := stack pushAll: #().
	
	self assert: stack size equals: 0.
	self assert: result isNil.
	self assert: stack isEmpty
]

{ #category : 'tests' }
CTStackTest >> testPushAllWithOrderedCollection [

	| collection result |
	collection := OrderedCollection with: 'x' with: 'y' with: 'z'.
	result := stack pushAll: collection.
	
	self assert: stack size equals: 3.
	self assert: result equals: 'z'.
	self assert: stack top equals: 'z'
]

{ #category : 'tests' }
CTStackTest >> testPushMultipleElements [

	stack push: 'first'; push: 'second'; push: 'third'.
	
	self assert: stack size equals: 3.
	self assert: stack top equals: 'third'.
	self assert: stack availableSpace equals: 2.
	self deny: stack isEmpty.
	self deny: stack isFull
]

{ #category : 'tests' }
CTStackTest >> testPushSingleElement [

	stack push: 'first'.
	
	self assert: stack size equals: 1.
	self deny: stack isEmpty.
	self deny: stack isFull.
	self assert: stack top equals: 'first'.
	self assert: stack availableSpace equals: 4
]

{ #category : 'tests' }
CTStackTest >> testPushToCapacity [

	stack push: 'a'; push: 'b'; push: 'c'; push: 'd'; push: 'e'.
	
	self assert: stack size equals: 5.
	self assert: stack isFull.
	self assert: stack availableSpace equals: 0.
	self assert: stack top equals: 'e'
]

{ #category : 'tests' }
CTStackTest >> testPushToFullStack [

	stack push: 'a'; push: 'b'; push: 'c'; push: 'd'; push: 'e'.
	
	self should: [ stack push: 'overflow' ] raise: Error
]

{ #category : 'removing' }
CTStackTest >> testRemoveAll [

	stack push: 'a'; push: 'b'; push: 'c'.
	stack removeAll.
	
	self assert: stack isEmpty.
	self assert: stack size equals: 0.
	self assert: stack availableSpace equals: 5
]

{ #category : 'tests' }
CTStackTest >> testRemoveAllOnEmptyStack [

	stack removeAll.
	
	self assert: stack isEmpty.
	self assert: stack size equals: 0
]

{ #category : 'tests' }
CTStackTest >> testSearchExistingElement [

	stack push: 'a'; push: 'b'; push: 'c'; push: 'b'.
	
	self assert: (stack search: 'b') equals: 1. "Top element"
	self assert: (stack search: 'c') equals: 2.
	self assert: (stack search: 'a') equals: 4. "Bottom element"
]

{ #category : 'tests' }
CTStackTest >> testSearchNonExistentElement [

	stack push: 'a'; push: 'b'; push: 'c'.
	
	self assert: (stack search: 'x') equals: -1
]

{ #category : 'tests' }
CTStackTest >> testSize [

	self assert: stack size equals: 0.
	stack push: 'a'.
	self assert: stack size equals: 1.
	stack push: 'b'; push: 'c'.
	self assert: stack size equals: 3.
	stack pop.
	self assert: stack size equals: 2
]

{ #category : 'tests' }
CTStackTest >> testStackCreationWithCapacity [

	| testStack |
	testStack := CTStack new: 3.
	
	self assert: testStack capacity equals: 3.
	self assert: testStack isEmpty.
	self assert: testStack size equals: 0.
	self assert: testStack availableSpace equals: 3
]

{ #category : 'tests' }
CTStackTest >> testStackCreationWithInvalidCapacity [

	self should: [ CTStack new: 0 ] raise: Error.
	self should: [ CTStack new: -1 ] raise: Error.
	self should: [ CTStack new: -10 ] raise: Error
]

{ #category : 'tests' }
CTStackTest >> testTopWithoutRemoving [

	stack push: 'first'; push: 'second'.
	
	self assert: stack top equals: 'second'.
	self assert: stack size equals: 2.
	self assert: stack top equals: 'second'. "Still there"
]
