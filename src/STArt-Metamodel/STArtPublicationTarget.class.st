Class {
	#name : #STArtPublicationTarget,
	#superclass : #STArtNamedEntity,
	#instVars : [
		'#papers => FMMany type: #STArtPaper opposite: #publicationTarget'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtPublicationTarget class >> annotation [

	<FMClass: #PublicationTarget super: #STArtNamedEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #adding }
STArtPublicationTarget >> addPaper: anObject [
	<generated>
	^ self papers add: anObject
]

{ #category : #accessing }
STArtPublicationTarget >> authors [
	"Returns all the authors that published a paper at least once in this target."
	^ (self papers flatCollect: [ :paper | paper authors ]) asSet asArray
]

{ #category : #accessing }
STArtPublicationTarget >> kind [
	^ self className allButFirst: 'STArt' size
]

{ #category : #accessing }
STArtPublicationTarget >> papers [
	"Relation named: #papers type: #STArtPaper opposite: #publicationTarget"

	<generated>
	<derived>
	^ papers
]

{ #category : #accessing }
STArtPublicationTarget >> papers: anObject [

	<generated>
	papers value: anObject
]

{ #category : #accessing }
STArtPublicationTarget >> papersCount [
	^ self papers size
]
