Class {
	#name : #STArtWorkshop,
	#superclass : #STArtPublicationTarget,
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtWorkshop class >> annotation [

	<FMClass: #Workshop super: #STArtPublicationTarget>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #testing }
STArtWorkshop >> isWorkshop [

	<generated>
	^ true
]
