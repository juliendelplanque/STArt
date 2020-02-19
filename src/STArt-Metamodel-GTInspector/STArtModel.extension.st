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
	^ GLMGenericAction new
		action: [ :composite | 
			(STArtDBLPImporterSpec on: self) openWithSpec];
		icon: (self iconNamed: #add);
		title: 'Import dblp record';
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtInspectorActionSearchDBLP [
	^ GLMGenericAction new
		action: [ :composite | 
			(STArtDBLPExplorerSpec on: self) openWithSpec];
		icon: (self iconNamed: #smallFind);
		title: 'Search dblp';
		yourself
]

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtPapersIn:  composite [
	<gtInspectorPresentationOrder: 0> 
	^ (STArtInspectorExtensionBuilder gtShowPapersIn: composite)
		title: 'Papers';
		display: [ self papers ];
		addAction: self gtInspectorActionImportDBLPRecord;
		addAction: self gtInspectorActionSearchDBLP;
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

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtTopicsIn:  composite [
	<gtInspectorPresentationOrder: 3> 
	^ (STArtInspectorExtensionBuilder gtShowTopicsIn: composite)
		title: 'Topics';
		display: [ self topics ];
		column: '# papers (in model)' evaluated: [ :topic | topic papersCount ];
		addAction: STArtInspectorExtensionBuilder gtInspectorActionAddTopic;
		yourself
]
