Class {
	#name : #STArtConference,
	#superclass : #STArtPublicationTarget,
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtConference class >> annotation [

	<FMClass: #Conference super: #STArtPublicationTarget>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #testing }
STArtConference >> isConference [

	<generated>
	^ true
]
