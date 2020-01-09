Class {
	#name : #STArtEntity,
	#superclass : #MooseEntity,
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #meta }
STArtEntity class >> metamodel [

	<generated>
	^ (self class environment at: #STArtMetamodelGenerator) metamodel
]

{ #category : #testing }
STArtEntity >> isAuthor [

	<generated>
	^ false
]

{ #category : #testing }
STArtEntity >> isPaper [

	<generated>
	^ false
]

{ #category : #testing }
STArtEntity >> isTopic [

	<generated>
	^ false
]
