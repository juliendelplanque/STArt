Class {
	#name : #STArtPaperMetaDataSource,
	#superclass : #STArtEntity,
	#instVars : [
		'#relatedPaper => FMOne type: #STArtPaper opposite: #source'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtPaperMetaDataSource class >> annotation [

	<MSEClass: #PaperMetaDataSource super: #STArtEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #accessing }
STArtPaperMetaDataSource >> relatedPaper [
	"Relation named: #relatedPaper type: #STArtPaper opposite: #source"

	<generated>
	^ relatedPaper
]

{ #category : #accessing }
STArtPaperMetaDataSource >> relatedPaper: anObject [

	<generated>
	relatedPaper := anObject

]

{ #category : #'serialize/materialize' }
STArtPaperMetaDataSource >> serializeOn: stream [
	self subclassResponsibility
]
