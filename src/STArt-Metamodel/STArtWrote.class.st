Class {
	#name : #STArtWrote,
	#superclass : #STArtEntity,
	#instVars : [
		'#author => FMOne type: #STArtAuthor opposite: #wrote',
		'#paper => FMOne type: #STArtPaper opposite: #written'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtWrote class >> annotation [

	<FMClass: #Wrote super: #STArtEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #accessing }
STArtWrote >> author [
	"Relation named: #author type: #STArtAuthor opposite: #wrote"

	<generated>
	<source>
	^ author
]

{ #category : #accessing }
STArtWrote >> author: anObject [

	<generated>
	author := anObject
]

{ #category : #accessing }
STArtWrote >> paper [
	"Relation named: #paper type: #STArtPaper opposite: #written"

	<generated>
	<target>
	^ paper
]

{ #category : #accessing }
STArtWrote >> paper: anObject [

	<generated>
	paper := anObject
]
