# Containers-Stack
A High-performance, Array based Stack implementation providing efficient LIFO (Last In, First Out) operations with fixed capacity and proper bounds checking.

![Pharo Version](https://img.shields.io/badge/Pharo-10+-blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## What is a Stack?

A Stack is a linear data structure that follows the LIFO (Last In, First Out) principle. Elements are added and removed from the same end, called the "top" of the stack. Think of it like a stack of plates - you can only add or remove plates from the top.

### Key Benefits
- **O(1) Performance**: Constant time push, pop, and top operations
- **Fixed Memory Usage**: Array-based implementation with bounded capacity
- **Memory Safe**: Automatic cleanup prevents memory leaks
- **Simple API**: Clean, intuitive interface following standard conventions
- **Robust Error Handling**: Proper stack overflow and underflow protection

## Loading 
The following script installs Containers-Stack in Pharo.

```smalltalk
Metacello new
  baseline: 'ContainersStack';
  repository: 'github://pharo-containers/Containers-Stack/src';
  load.
```

## If you want to depend on it 

Add the following code to your Metacello baseline or configuration 

```smalltalk
spec 
   baseline: 'ContainersStack' 
   with: [ spec repository: 'github://pharo-containers/Containers-Stack/src' ].
```

## Quick Start

```smalltalk
"Create a stack with capacity of 5"
stack := CTStack new: 5.

"Push elements"
stack push: 'first'.
stack push: 'second'.
stack push: 'third'.

"Check top element without removing"
stack top.           "Returns 'third'"
stack size.          "Returns 3"

"Pop elements (LIFO order)"
stack pop.           "Returns 'third'"
stack pop.           "Returns 'second'"  
stack pop.           "Returns 'first'"

"Stack is now empty"
stack isEmpty.       "Returns true"
```

## Contributing

This is part of the Pharo Containers project. Feel free to contribute by implementing additional methods, improving tests, or enhancing documentation.