Class {
	#name : #BaselineOfPharo,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharo
}

{ #category : #'repository urls' }
BaselineOfPharo class >> icebergRepository [

	^ 'github://pharo-vcs/iceberg:{1}' format: { self icebergVersion }
]

{ #category : #versions }
BaselineOfPharo class >> icebergVersion [

	^ 'v2.0.4'
]

{ #category : #versions }
BaselineOfPharo class >> newToolsReleaseCommit [
	"The commit corresponding to current release (to be used on bootstrap process)"

	"v0.6.8"
	^ '5d8b80ed8a8ff01666447d1f8f085296c152b8ab'
]

{ #category : #'repository urls' }
BaselineOfPharo class >> newToolsRepository [

	^ 'github://pharo-spec/NewTools:{1}/src' format: { self newToolsVersion }
]

{ #category : #versions }
BaselineOfPharo class >> newToolsVersion [

	^ 'v0.6.8'
]

{ #category : #versions }
BaselineOfPharo class >> specReleaseCommit [
	"The commit corresponding to current release (to be used on bootstrap process)"

	"v1.0.0"
	^ 'c3a851148767c73804ba04d73c1836532f136087'
]

{ #category : #'repository urls' }
BaselineOfPharo class >> specRepository [

	^ 'github://pharo-spec/Spec:{1}/src' format: { self specVersion }
]

{ #category : #versions }
BaselineOfPharo class >> specVersion [

	^ 'v1.0.0'
]

{ #category : #baseline }
BaselineOfPharo >> baseline: spec [
	<baseline>
	| repository |
	repository := self packageRepositoryURL.

	spec for: #common do: [
		spec postLoadDoIt: #'postload:package:'.
		spec baseline: 'BaseLibraries' with: [spec repository: repository].
		
		spec baseline: 'IDE' with: [spec repository: repository].
		spec baseline: 'Calypso' with: [ 
			spec repository: repository; loads: #('IcebergSupport'). ].

		spec package: 'Deprecated90'.
		
		spec package: 'FluidClassBuilder'.
		spec package: 'FluidClassBuilder-Tests' with: [ spec requires: 'FluidClassBuilder' ].
	]
]

{ #category : #baseline }
BaselineOfPharo >> postload: loader package: packageSpec [

	WelcomeHelp openForRelease
]
