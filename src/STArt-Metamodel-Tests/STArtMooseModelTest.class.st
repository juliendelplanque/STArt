"
A STArtMooseModelTest is a test class for testing the behavior of STArtMooseModel
"
Class {
	#name : #STArtMooseModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'STArt-Metamodel-Tests'
}

{ #category : #running }
STArtMooseModelTest >> setUp [
	model := STArtMooseModel new
]

{ #category : #tests }
STArtMooseModelTest >> testAuthorCanWritePaper [
	| author paper wrote |
	author := STArtAuthor new
					mooseModel: model;
					name: 'Julien Delplanque';
					yourself.
					
	paper := STArtPaper new
					mooseModel: model;
					title: 'How to use STArt ?';
					filePath: '/foo/bar/paper.pdf';
					yourself.
					
	self assert: author wrote isEmpty.
	self assert: paper written isEmpty.
	
	wrote := author wrotePaper: paper.
	
	self assert: author wrote size equals: 1.
	self assert: author wrote first equals: wrote.
	self assert: paper written size equals: 1.
	self assert: paper written first equals: wrote
]

{ #category : #tests }
STArtMooseModelTest >> testPaperCanBeCited [
	| paper1 paper2 citation |
	paper1 := STArtPaper new
					mooseModel: model;
					title: 'How to use STArt?';
					year: 2018;
					yourself.
	paper2 := STArtPaper new
					mooseModel: model;
					title: 'How to do a great state of the art?';
					year: 2019;
					yourself.
	
	self assert: paper1 citedPapers isEmpty.
	self assert: paper2 citedPapers isEmpty.
	self assert: paper1 citingPapers isEmpty.
	self assert: paper2 citingPapers isEmpty.
	
	citation := paper2 addCitedPaper: paper1.
	
	self assert: paper1 citedPapers isEmpty.
	self assert: paper2 citedPapers size equals: 1.
	self assert: paper2 citedPapers first equals: paper1.
	self assert: paper2 outgoingCitations first equals: citation.
	self assert: paper1 citingPapers size equals: 1.
	self assert: paper1 citingPapers first equals: paper2.
	self assert: paper1 incomingCitations first equals: citation.
	self assert: paper2 citingPapers isEmpty.
]

{ #category : #tests }
STArtMooseModelTest >> testPaperCanBeCitedTheOtherWayAround [
	| paper1 paper2 citation |
	paper1 := STArtPaper new
					mooseModel: model;
					title: 'How to use STArt?';
					year: 2018;
					yourself.
	paper2 := STArtPaper new
					mooseModel: model;
					title: 'How to do a great state of the art?';
					year: 2019;
					yourself.
	
	self assert: paper1 citedPapers isEmpty.
	self assert: paper2 citedPapers isEmpty.
	self assert: paper1 citingPapers isEmpty.
	self assert: paper2 citingPapers isEmpty.
	
	citation := paper1 addCitingPaper: paper2.
	
	self assert: paper1 citedPapers isEmpty.
	self assert: paper2 citedPapers size equals: 1.
	self assert: paper2 citedPapers first equals: paper1.
	self assert: paper2 outgoingCitations first equals: citation.
	self assert: paper1 citingPapers size equals: 1.
	self assert: paper1 citingPapers first equals: paper2.
	self assert: paper1 incomingCitations first equals: citation.
	self assert: paper2 citingPapers isEmpty.
]

{ #category : #tests }
STArtMooseModelTest >> testPaperCanHaveTopic [
	|paper topic topicRef |
	paper := STArtPaper new
					mooseModel: model;
					title: 'How to use STArt ?';
					filePath: '/foo/bar/paper.pdf';
					yourself.
	
	topic := STArtTopic new
					mooseModel: model;
					name: 'documentation';
					yourself.
	
	self assert: paper outgoingTopicReferences isEmpty.
	self assert: topic incomingReferences isEmpty.
	
	topicRef := paper addTopic: topic.
	
	self assert: paper outgoingTopicReferences size equals: 1.
	self assert: paper outgoingTopicReferences first equals: topicRef.
	self assert: topic incomingReferences size equals: 1.
	self assert: topic incomingReferences first equals: topicRef.
]
