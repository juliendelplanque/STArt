Class {
	#name : #STArtCitation,
	#superclass : #STArtEntity,
	#instVars : [
		'#sourcePaper => FMOne type: #STArtPaper opposite: #outgoingCitations',
		'#targetPaper => FMOne type: #STArtPaper opposite: #incomingCitations'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtCitation class >> annotation [

	<FMClass: #Citation super: #STArtEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #accessing }
STArtCitation >> sourcePaper [
	"Relation named: #sourcePaper type: #STArtPaper opposite: #outgoingCitations"

	<generated>
	^ sourcePaper
]

{ #category : #accessing }
STArtCitation >> sourcePaper: anObject [

	<generated>
	sourcePaper := anObject
]

{ #category : #accessing }
STArtCitation >> targetPaper [
	"Relation named: #targetPaper type: #STArtPaper opposite: #incomingCitations"

	<generated>
	^ targetPaper
]

{ #category : #accessing }
STArtCitation >> targetPaper: anObject [

	<generated>
	targetPaper := anObject
]
