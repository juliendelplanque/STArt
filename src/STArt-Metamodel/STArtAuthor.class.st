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

	<MSEClass: #Author super: #STArtNamedEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #testing }
STArtAuthor >> isAuthor [

	<generated>
	^ true
]

{ #category : #accessing }
STArtAuthor >> wrote [
	"Relation named: #wrote type: #STArtWrote opposite: #author"

	<generated>
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
