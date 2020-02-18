Class {
	#name : #STArtMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'author',
		'paper',
		'topic',
		'wrote',
		'citation',
		'topicReference',
		'entity',
		'namedEntity',
		'paperMetaDataSource',
		'paperMetaDataStringSource',
		'publicationTarget',
		'conference',
		'journal',
		'workshop'
	],
	#category : #'STArt-MetamodelGenerator'
}

{ #category : #generation }
STArtMetamodelGenerator class >> generate [
	<script>
	super generate
]

{ #category : #accessing }
STArtMetamodelGenerator class >> packageName [

	^ #'STArt-Metamodel'
]

{ #category : #accessing }
STArtMetamodelGenerator class >> prefix [

	^ #'STArt'
]

{ #category : #accessing }
STArtMetamodelGenerator class >> submetamodels [
	^ {FamixGenerator}
]

{ #category : #definition }
STArtMetamodelGenerator >> defineClasses [
	super defineClasses.
	entity := builder newClassNamed: #Entity.
	namedEntity := builder newClassNamed: #NamedEntity.
	
	author := builder newClassNamed: #'Author'.
	paper :=  builder newClassNamed: #'Paper'.
	topic := builder newClassNamed: #'Topic'.
	publicationTarget := builder newClassNamed: #PublicationTarget.
	conference := builder newClassNamed: #Conference.
	journal := builder newClassNamed: #Journal.
	workshop := builder newClassNamed: #Workshop.
	paperMetaDataSource := builder newClassNamed: #'PaperMetaDataSource'.
	paperMetaDataStringSource := builder newClassNamed: #'PaperMetaDataStringSource'.
	
	wrote := builder newClassNamed: #'Wrote'.
	citation := builder newClassNamed: #'Citation'.
	topicReference := builder newClassNamed: #'TopicReference'.
	
	author withTesting.
	paper withTesting.
	topic withTesting.
	conference withTesting.
	journal withTesting.
	workshop withTesting.
]

{ #category : #definition }
STArtMetamodelGenerator >> defineHierarchy [
	super defineHierarchy.
	entity --|> #TDependencyQueries.
	entity --|> #TEntityMetaLevelDependency.
	
	namedEntity --|> #TNamed.
	namedEntity --|> entity.
	
	author --|> namedEntity.
	paper --|> entity.
	topic --|> namedEntity.
	publicationTarget --|> namedEntity.
	conference --|> publicationTarget.
	journal --|> publicationTarget.
	workshop --|> publicationTarget.
	paperMetaDataSource --|> entity.
	paperMetaDataStringSource --|> paperMetaDataSource.
	
	topicReference --|> entity.
	wrote --|> entity.
	citation --|> entity
]

{ #category : #definition }
STArtMetamodelGenerator >> defineProperties [
	super defineProperties.
		
	paper
		property: #title type: #String;
		property: #filePath type: #String;
		property: #year type: #Number.
		
	paperMetaDataStringSource
		property: #content type: #String.
		
	topic
		property: 'description' type: #String
]

{ #category : #definition }
STArtMetamodelGenerator >> defineRelations [
	super defineRelations.
	
	(author property: #wrote)
		-* (wrote property: #author) source.
		
	(paper property: #written)
		-* (wrote property: #paper) target.
		
	(paper property: #outgoingTopicReferences)
		-* (topicReference property: #paper).
		
	(paper property: #source)
		- (paperMetaDataSource property: #relatedPaper).
		
	(topic property: #incomingReferences)
		-* (topicReference property: #topic).
		
	(paper property: #incomingCitations)
		-* (citation property: #targetPaper).
		
	(paper property: #outgoingCitations)
		-* (citation property: #sourcePaper).
		
	(paper property: #publicationTarget)
		*- (publicationTarget property: #papers)
]
