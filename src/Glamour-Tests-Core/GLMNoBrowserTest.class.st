Class {
	#name : #GLMNoBrowserTest,
	#superclass : #TestCase,
	#category : #'Glamour-Tests-Core'
}

{ #category : #testing }
GLMNoBrowserTest class >> isDeprecated [
	^ true
]

{ #category : #tests }
GLMNoBrowserTest >> testCreation [
	self deny: GLMNoBrowser new isNil.
	self assert: GLMNoBrowser new identicalTo: GLMNoBrowser new
]
