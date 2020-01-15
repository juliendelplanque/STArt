Extension { #name : #STArtEntity }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtEntity >> gtShowAuthorsIn: composite [
	^ STArtInspectorExtensionBuilder gtShowAuthorsIn: composite
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtEntity >> gtShowPapersIn: composite [
	^ STArtInspectorExtensionBuilder gtShowPapersIn: composite
]
