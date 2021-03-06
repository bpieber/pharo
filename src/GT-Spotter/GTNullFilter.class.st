Class {
	#name : #GTNullFilter,
	#superclass : #GTStringFilter,
	#category : #'GT-Spotter-Filters'
}

{ #category : #public }
GTNullFilter class >> gtListFilter [
	^ GTFilterSubstring new
]

{ #category : #testing }
GTNullFilter class >> isDeprecated [
	^ true
]

{ #category : #private }
GTNullFilter >> doApplyFilterWithQuery [
	self streamed 
		ifTrue: [
			" this will be more responsive (faster) for very large collections and/or expensive filters "
			| allItems |
			self filteredItems: (allItems := OrderedCollection new).
			self allItems withIndexDo: [ :each :index |				
				allItems add: each.
				self addItem: each.
				index = self itemsLimit ifTrue: [ GTLimitArrived signal ] ] ]
		ifFalse: [
			" this will be much much faster for small collections and/or very quick filters " 
			self filteredItems: self allItems.
			self addItems: (self allItems first: (self itemsLimit min: self allItems size)) ]
]

{ #category : #public }
GTNullFilter >> gtListFilter [
	^ GTFilterSubstring new
]
