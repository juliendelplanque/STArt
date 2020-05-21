Class {
	#name : #STArtInspectorExtensionBuilder,
	#superclass : #Object,
	#category : #'STArt-Metamodel-GTInspector'
}

{ #category : #actions }
STArtInspectorExtensionBuilder class >> gtInspectorActionAddTopic [
	^ GLMGenericAction new
		action: [ :composite | 
			self halt: 'TODO' ];
		icon: (self iconNamed: #smallAdd);
		title: 'Add topic';
		yourself
]

{ #category : #'extension building' }
STArtInspectorExtensionBuilder class >> gtPublicationTargetsIn: composite [
	^ composite fastTable
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
					ifFalse: [self species withAll: result]]];
		yourself
]

{ #category : #'extension building' }
STArtInspectorExtensionBuilder class >> gtShowAuthorsIn: composite [
	"Builds a fast table configured to display authors data.
	 The goal for this method is to avoid duplicating the code everywhere as authors
	 tab is something often needed in inspector views.
	"
	^ composite fastTable
		title: 'Authors';
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Name' evaluated: [ :author | author name ];
		column: '# papers (in model)' evaluated: [ :author | author papersCount ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result ]]];
		yourself
]

{ #category : #'extension building' }
STArtInspectorExtensionBuilder class >> gtShowPapersIn: composite [
	"Builds a fast table configured to display papers data.
	 The goal for this method is to avoid duplicating the code everywhere as paper
	 tab is something often needed in inspector views.
	"
	^ composite fastTable
		title: 'Papers';
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Title' evaluated: [ :paper | paper title ] width: 400;
		column: 'Year' evaluated: [ :paper | paper year ] width: 40;
		column: 'Authors' evaluated: [ :paper | paper authorNamesSeparatedByColons ];
		column: 'Publication target' evaluated: [ :paper | paper publicationTarget name ];
		column: 'Kind of publication target' evaluated: [ :paper | paper publicationTarget kind ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]];
		yourself
]

{ #category : #'extension building' }
STArtInspectorExtensionBuilder class >> gtShowTopicsIn: composite [
	"Builds a fast table configured to display topics data.
	 The goal for this method is to avoid duplicating the code everywhere as topic
	 tab is something often needed in inspector views.
	"
	^ composite fastTable
		title: 'Topics';
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Name' evaluated: [ :topic | topic name ];
		column: 'Description' evaluated: [ :topic | topic topicDescription ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result ]]];
		yourself
]
