Extension { #name : #STArtModel }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtAuthorsIn: composite [
	<gtInspectorPresentationOrder: 1> 
	^ (STArtInspectorExtensionBuilder gtShowAuthorsIn: composite)
		title: 'Authors';
		display: [ self authors ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtInspectorActionImportDBLPRecord [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :composite | 
			(STArtDBLPImporterSpec on: self) openWithSpec];
		icon: (self iconNamed: #dblpImportIcon);
		title: 'Import dblp record'
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtInspectorActionSearchDBLP [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :composite | 
			(STArtDBLPExplorerSpec on: self) openWithSpec];
		icon: (self iconNamed: #dblpSearchIcon);
		title: 'Search dblp'
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtPapersIn:  composite [
	<gtInspectorPresentationOrder: 0> 
	^ (STArtInspectorExtensionBuilder gtShowPapersIn: composite)
		title: 'Papers';
		display: [ self papers ];
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtPublicationTargetsIn: composite [
	<gtInspectorPresentationOrder: 2> 
	^ composite fastTable
		title: 'Publication targets';
		display: [ self publicationTargets ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Name' evaluated: [ :target | target name ];
		column: 'Kind' evaluated: [ :target | target className allButFirst: 'STArt' size ];
		column: '# papers (in model)' evaluated: [ :target | target papersCount ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]
