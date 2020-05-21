Class {
	#name : #STArtAuthor,
	#superclass : #STArtNamedEntity,
	#instVars : [
		'#wrote => FMMany type: #STArtWrote opposite: #author'
	],
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtAuthor class >> annotation [

	<FMClass: #Author super: #STArtNamedEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #adding }
STArtAuthor >> addWrote: anObject [
	<generated>
	^ self wrote add: anObject
]

{ #category : #accessing }
STArtAuthor >> coAuthors [
	^ ((self writtenPapers flatCollect: #authors) asSet \ { self }) asArray
]

{ #category : #testing }
STArtAuthor >> isAuthor [

	<generated>
	^ true
]

{ #category : #accessing }
STArtAuthor >> papersCount [
	^ self writtenPapers size
]

{ #category : #accessing }
STArtAuthor >> publicationTargets [
	^ (self writtenPapers collect: #publicationTarget) removeDuplicates
]

{ #category : #accessing }
STArtAuthor >> writtenPapers [
	^ self wrote collect: #paper
]

{ #category : #accessing }
STArtAuthor >> wrote [
	"Relation named: #wrote type: #STArtWrote opposite: #author"

	<generated>
	<derived>
	^ wrote
]

{ #category : #accessing }
STArtAuthor >> wrote: anObject [

	<generated>
	wrote value: anObject
]

{ #category : #'model building' }
STArtAuthor >> wrotePaper: aPaper [
	^ STArtWrote new
		mooseModel: self mooseModel;
		paper: aPaper;
		author: self;
		yourself
]
