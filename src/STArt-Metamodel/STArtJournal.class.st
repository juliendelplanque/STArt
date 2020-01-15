Class {
	#name : #STArtJournal,
	#superclass : #STArtPublicationTarget,
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtJournal class >> annotation [

	<FMClass: #Journal super: #STArtPublicationTarget>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #testing }
STArtJournal >> isJournal [

	<generated>
	^ true
]
