"
I implement a simple Stack. 

- #push: adds a new object of any kind on top of the stack. 
- #pop returns the first element and remove it from the stack. 
- #top answer the first element of the stack without removing it.
"
Class {
	#name : #CTStack,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'Containers-Stack'
}

{ #category : #testing }
CTStack >> ifEmpty: aBlock [
	"If the receiver is empty execute the given block, returning its value, otherwise return the receiver."

	
	"Note that the fact that this method returns its receiver in case the receiver is not empty allows one to write expressions like the following ones: self classifyMethodAs: (myProtocol ifEmpty: ['As yet unclassified'])"

	^ elements ifEmpty: aBlock ifNotEmpty: [ self ]
]

{ #category : #testing }
CTStack >> ifEmpty: aBlockClosure ifNotEmpty: aBlockClosure2 [ 
	"Evaluate emptyBlock if I'm empty, evalute notEmptyBlock otherwise"
	"If the notEmptyBlock has an argument, execute it using the receiver as its argument"

	
	^ elements ifEmpty: aBlockClosure ifNotEmpty: aBlockClosure2
]

{ #category : #testing }
CTStack >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as its argument, returning its value
	unless the receiver is empty, in which case return the receiver."


	^ elements ifNotEmpty: aBlock ifEmpty: [ self ]
]

{ #category : #testing }
CTStack >> ifNotEmpty: aBlockClosure ifEmpty: aBlockClosure2 [ 
	"Evaluate emptyBlock if I'm empty, otherwise evaluate notEmptyBlock.
	 If the notEmptyBlock has an argument, execute with the receiver as its argument"
	
	^ elements ifNotEmpty: aBlockClosure ifEmpty: aBlockClosure2
]

{ #category : #initialization }
CTStack >> initialize [

	super initialize.
	elements := OrderedCollection new
]

{ #category : #testing }
CTStack >> isEmpty [ 
	
	^ elements isEmpty
]

{ #category : #operations }
CTStack >> pop [
	"Returns the first element and removes it from the receiver."

	^ elements removeFirst 
]

{ #category : #operations }
CTStack >> push: anObject [ 
	"Adds a new object of any kind on top of the receiver."
	
	elements addFirst: anObject.
	^ anObject
]

{ #category : #query }
CTStack >> size [

	^ elements size
]

{ #category : #operations }
CTStack >> top [
	"Returns the first element of the receiver without removing it."
	
	^ elements first
]
