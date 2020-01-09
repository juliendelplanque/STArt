Class {
	#name : #STArtNamedEntity,
	#superclass : #STArtEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #STArtEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]
