"
A STArtDBLPRecordImporterTest is a test class for testing the behavior of STArtDBLPRecordImporter
"
Class {
	#name : #STArtDBLPRecordImporterTest,
	#superclass : #TestCase,
	#category : #'STArt-Importer-Tests'
}

{ #category : #tests }
STArtDBLPRecordImporterTest >> testImport [
	| dblpXml model importedPaper |
	dblpXml := '<dblp>
<inproceedings key="conf/icse/DelplanqueDPBE19" mdate="2019-08-29">
<author>Julien Delplanque</author>
<author>Stéphane Ducasse</author>
<author>Guillermo Polito</author>
<author>Andrew P. Black</author>
<author>Anne Etien</author>
<title>Rotten green tests.</title>
<pages>500-511</pages>
<year>2019</year>
<booktitle>ICSE</booktitle>
<ee>https://doi.org/10.1109/ICSE.2019.00062</ee>
<ee>https://dl.acm.org/citation.cfm?id=3339570</ee>
<crossref>conf/icse/2019</crossref>
<url>db/conf/icse/icse2019.html#DelplanqueDPBE19</url>
</inproceedings>
</dblp>'.
	model := STArtMooseModel new.
	importedPaper := STArtDBLPRecordImporter new
		model: model;
		xmlString: dblpXml;
		import.
		
	self assert: (model allWithType: STArtAuthor) size equals: 5.
	self assert: (model allWithType: STArtWrote) size equals: 5. "Each author wrote 1 paper"
	self assert: (model allWithType: STArtPaper) size equals: 1.
]
