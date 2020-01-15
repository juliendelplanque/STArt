Extension { #name : #STArtModel }

{ #category : #'*STArt-Metamodel-GTInspector' }
STArtModel >> gtAuthorsIn:  composite [
	<gtInspectorPresentationOrder: 0> 
	^ composite fastTable
		title: 'Authors';
		display: [ self authors ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Name' evaluated: [ :author | GTObjectPrinter asTruncatedTextFrom: author name ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
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
	^ composite fastTable
		title: 'Papers';
		display: [ self papers ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Title' evaluated: [ :paper | paper title ] width: 400;
		column: 'Year' evaluated: [ :paper | paper year ] width: 40;
		column: 'Authors' evaluated: [ :paper | paper authorNamesSeparatedByColons ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]