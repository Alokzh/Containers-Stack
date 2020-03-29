# Containers-Stack
A dead stupid stack implementation, but one fully working :)

[![Build Status](https://travis-ci.com/Ducasse/Containers-Stack.svg?branch=master)](https://travis-ci.com/Ducasse/Containers-Stack)
[![Coverage Status](https://coveralls.io/repos/github//Ducasse/Containers-Stack/badge.svg?branch=master)](https://coveralls.io/github//Ducasse/Containers-Stack?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/dataframe)  -->

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
