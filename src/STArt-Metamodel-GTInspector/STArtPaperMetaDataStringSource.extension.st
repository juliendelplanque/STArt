Extension { #name : #STArtPaperMetaDataStringSource }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtPaperMetaDataStringSource >> gtInspectorTextIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite text
		title: 'Content';
		display: [ self content ];
		yourself
]
