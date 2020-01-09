Class {
	#name : #STArtPaperMetaDataStringSource,
	#superclass : #STArtPaperMetaDataSource,
	#instVars : [
		'#content => FMProperty'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtPaperMetaDataStringSource class >> annotation [

	<MSEClass: #PaperMetaDataStringSource super: #STArtPaperMetaDataSource>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #accessing }
STArtPaperMetaDataStringSource >> content [

	<MSEProperty: #content type: #String>
	<generated>
	^ content
]

{ #category : #accessing }
STArtPaperMetaDataStringSource >> content: anObject [

	<generated>
	content := anObject

]

{ #category : #'serialize/materialize' }
STArtPaperMetaDataStringSource >> serializeOn: stream [
	stream nextPutAll: self content
]
