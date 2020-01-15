Class {
	#name : #STArtEntity,
	#superclass : #MooseEntity,
	#traits : 'TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'STArt-Metamodel-Entities'
}

{ #category : #meta }
STArtEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'STArt-Metamodel'>
	<generated>
	^self
]

{ #category : #meta }
STArtEntity class >> metamodel [

	<generated>
	^ STArtModel metamodel
]

{ #category : #testing }
STArtEntity >> isAuthor [

	<generated>
	^ false
]

{ #category : #testing }
STArtEntity >> isConference [

	<generated>
	^ false
]

{ #category : #testing }
STArtEntity >> isJournal [

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

{ #category : #testing }
STArtEntity >> isWorkshop [

	<generated>
	^ false
]
