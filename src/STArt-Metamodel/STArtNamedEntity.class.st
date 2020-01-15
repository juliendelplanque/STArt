Class {
	#name : #STArtNamedEntity,
	#superclass : #STArtEntity,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #STArtEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]
