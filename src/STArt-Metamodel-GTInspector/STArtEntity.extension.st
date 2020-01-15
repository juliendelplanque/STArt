Extension { #name : #STArtEntity }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtEntity >> gtShowPapersIn: composite [
	"Builds a fast table configured to display papers data.
	 The goal for this method is to avoid duplicating the code everywhere as paper
	 tab is something often needed in inspector views.
	"
	^ STArtInspectorExtensionBuilder gtShowPapersIn: composite
]
