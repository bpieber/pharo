Class {
	#name : #GLMExpanderContentsNodeModel,
	#superclass : #MorphTreeNodeModel,
	#instVars : [
		'containerNode'
	],
	#category : #'Glamour-Morphic-Widgets'
}

{ #category : #testing }
GLMExpanderContentsNodeModel class >> isDeprecated [
	^ true
]

{ #category : #accessing }
GLMExpanderContentsNodeModel >> containerNode [
	^ containerNode
]

{ #category : #accessing }
GLMExpanderContentsNodeModel >> containerNode: anObject [
	containerNode := anObject
]

{ #category : #callbacks }
GLMExpanderContentsNodeModel >> elementColumn [
	| row morph |
	
	morph := GLMMorphicPaneWithoutTitleRenderer new render: self containerNode item.
	morph 
		borderStyle: (UITheme current buttonSelectedBorderStyleFor: morph).

	row := OrderedCollection with: morph.
	^ UITheme current newRowIn: self for: row
]

{ #category : #accessing }
GLMExpanderContentsNodeModel >> icon [
	^ nil
]
