Class {
	#name : #GLMRubEditingArea,
	#superclass : #RubEditingArea,
	#category : #'Glamour-Morphic-Brick-Morphic'
}

{ #category : #testing }
GLMRubEditingArea class >> isDeprecated [
	^ true
]

{ #category : #drawing }
GLMRubEditingArea >> drawKeyboardFocusOn: aCanvas [
	"remove focused border"
]

{ #category : #drawing }
GLMRubEditingArea >> drawKeyboardFocusOnAthensCanvas: anAthensCanvas [
	"remove focused border"
]
