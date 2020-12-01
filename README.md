# Containers-Stack
A dead stupid stack implementation, but one fully working with super cool coverage:)


![https://github.com/pharo-containers/Containers-Stack/workflows/test/badge.svg](https://github.com/pharo-containers/Containers-Stack/workflows/test/badge.svg)

## Example

``` 
| aStack |
 aStack := CTStack new.
 aStack push: 'a'.
 aStack size >>> 1.
 aStack push: 'b'.
 aStack size >>> 2.
 aStack top >>> 'b'.
 aStack size >>> 2.
 aStack pop  >>> 'b'.
 aStack size >>> 1.
 aStack pop >>> 'a'.
 aStack size >>> 0. 
 ```

## Loading 
The following script installs Containers-Stack in Pharo.

```smalltalk
Metacello new
  baseline: 'ContainersStack';
  repository: 'github://pharo-containers/Containers-Stack:v1.0/src';
  load.
```

## If you want to depend on it 

Add the following code to your Metacello baseline or configuration 

```smalltalk
spec 
   baseline: 'ContainersStack' 
   with: [ spec repository: 'github://pharo-containers/Containers-Stack:v1.0/src' ].
```
