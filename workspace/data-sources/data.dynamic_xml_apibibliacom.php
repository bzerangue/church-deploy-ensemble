<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcedynamic_xml_apibibliacom extends Datasource{

		public $dsParamROOTELEMENT = 'dynamic-xml-apibibliacom';
		public $dsParamURL = 'http://api.biblia.com/v1/bible/content/kjv.xml?key=75a4b16582635a69f1194f670abfa9f0&passage={$ds-verses-entries-by-tag:encoded}';
		public $dsParamXPATH = '/response/text';
		public $dsParamCACHE = '1';
		public $dsParamTIMEOUT = '6';

		

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-verses-entries-by-tag');
		}

		public function about(){
			return array(
				'name' => 'Dynamic XML: api.biblia.com',
				'author' => array(
					'name' => 'Admin Admin',
					'website' => 'http://churchdeploy',
					'email' => 'noreply@churchdeploy.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2011-11-29T03:14:41+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.dynamic_xml.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
