[QueryItem="test01"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

select distinct ?patient ?obs ?display ?code where { ?x fhir:Observation.subject ?patient .?x fhir:Observation.code ?obs . ?obs fhir:Coding.display.value ?display . 
                 FILTER ( str(?code) = '161667004' ) .  ?obs fhir:Coding.code.value ?code . ?obs fhir:Coding.system.value ?system}

[QueryItem="test02"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

SELECT DISTINCT ?patient ?gender ?birthDate
        WHERE { 
                ?obs_concept_id fhir:Coding.code.value ?obs_concept_code . 
                FILTER ( str(?obs_concept_code) = '416940007' ) . 
                ?obs_concept_id fhir:Coding.system.value ?obs_code_system .
                FILTER ( str(?obs_code_system) = 'SNOMED') .
                ?obs_concept_id fhir:Coding.display.value ?obs_code_display .
                ?x fhir:ConceptMap.sourceUri ?obs_concept_id .
                ?x fhir:ConceptMap.targetUri ?desc_obs_concept_id .
                ?x fhir:ConceptMap.group.element.target.equivalence.value "descendant"^^xsd:string .
                ?desc_obs_concept_id fhir:Coding.code.value ?desc_code .
                ?desc_obs_concept_id fhir:Coding.display.value ?desc_code_display .
                ?desc_obs_concept_id fhir:Coding.system.value ?desc_code_system . 
                ?y fhir:Observation.code ?desc_obs_concept_id .
                ?y fhir:Observation.subject ?patient .
                ?patient fhir:Patient.gender ?gender_id .
                ?gender_id fhir:Coding.code.value ?gender .
                ?patient fhir:Patient.birthDate.value ?birthDate .
                }

[QueryItem="test03"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

select distinct  ?obs ?display ?code where { ?x fhir:Observation.subject ?patient .?x fhir:Observation.code ?obs . ?obs fhir:Coding.display.value ?display . 
                 FILTER ( regex (str(?display), "heart", "i" )) .  ?obs fhir:Coding.code.value ?code . ?obs fhir:Coding.system.value ?system}

[QueryItem="test04"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

select distinct * 
where { ?patient rdf:type fhir:Patient ; 
                 fhir:Patient.gender ?gender ;
                 fhir:Patient.birthDate.value ?birthDate . 
                 ?gender fhir:Coding.code.value ?gender_value .}

[QueryItem="test05"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

SELECT DISTINCT ?obs_concept_code ?obs_code_display ?desc_code ?desc_code_display ?desc_code_system
       WHERE { 
                ?obs_concept_id fhir:Coding.code.value ?obs_concept_code . 
                FILTER ( str(?obs_concept_code) = '416940007' ) . 
                ?obs_concept_id fhir:Coding.system.value ?obs_code_system .
                FILTER ( str(?obs_code_system) = 'SNOMED') .
                ?obs_concept_id fhir:Coding.display.value ?obs_code_display .
                ?x fhir:ConceptMap.sourceUri ?obs_concept_id .
                ?x fhir:ConceptMap.targetUri ?desc_obs_concept_id .
                ?x fhir:ConceptMap.group.element.target.equivalence.value "descendant"^^xsd:string .
                ?desc_obs_concept_id fhir:Coding.code.value ?desc_code .
                ?desc_obs_concept_id fhir:Coding.display.value ?desc_code_display .
                ?desc_obs_concept_id fhir:Coding.system.value ?desc_code_system . 
              }

[QueryItem="test06"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

SELECT DISTINCT ?patient ?gender ?birthDate
        WHERE { 
                ?obs_concept_id fhir:Coding.code.value ?obs_concept_code . 
                FILTER ( str(?obs_concept_code) = '57054005' ) . 
                ?obs_concept_id fhir:Coding.system.value ?obs_code_system .
                FILTER ( str(?obs_code_system) = 'SNOMED') .
                ?obs_concept_id fhir:Coding.display.value ?obs_code_display .
                ?x fhir:ConceptMap.sourceUri ?obs_concept_id .
                ?x fhir:ConceptMap.targetUri ?desc_obs_concept_id .
                ?x fhir:ConceptMap.group.element.target.equivalence.value "descendant"^^xsd:string .
                ?desc_obs_concept_id fhir:Coding.code.value ?desc_code .
                ?desc_obs_concept_id fhir:Coding.display.value ?desc_code_display .
                ?desc_obs_concept_id fhir:Coding.system.value ?desc_code_system . 
                ?y fhir:Condition.code ?obs_concept_id .
                ?y fhir:Condition.subject ?patient .
                ?patient fhir:Patient.gender ?gender_id .
                ?gender_id fhir:Coding.code.value ?gender .
                ?patient fhir:Patient.birthDate.value ?birthDate .
                }

[QueryItem="test07"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

SELECT DISTINCT ?obs_concept_code ?obs_code_display ?desc_code ?desc_code_display ?desc_code_system
       WHERE { 
                ?obs_concept_id fhir:Coding.code.value ?obs_concept_code . 
                FILTER ( str(?obs_concept_code) = '57054005' ) . 
                ?obs_concept_id fhir:Coding.system.value ?obs_code_system .
                FILTER ( str(?obs_code_system) = 'SNOMED') .
                ?obs_concept_id fhir:Coding.display.value ?obs_code_display .
                ?x fhir:ConceptMap.sourceUri ?obs_concept_id .
                ?x fhir:ConceptMap.targetUri ?desc_obs_concept_id .
                ?x fhir:ConceptMap.group.element.target.equivalence.value "descendant"^^xsd:string .
                ?desc_obs_concept_id fhir:Coding.code.value ?desc_code .
                ?desc_obs_concept_id fhir:Coding.display.value ?desc_code_display .
                ?desc_obs_concept_id fhir:Coding.system.value ?desc_code_system . 
              }

[QueryItem="test08"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

SELECT DISTINCT ?patient ?gender ?birthDate
        WHERE { 
                ?obs_concept_id fhir:Coding.code.value ?obs_concept_code . 
                FILTER ( str(?obs_concept_code) = '57054005' ) . 
                ?obs_concept_id fhir:Coding.system.value ?obs_code_system .
                FILTER ( str(?obs_code_system) = 'SNOMED') .
                ?obs_concept_id fhir:Coding.display.value ?obs_code_display .
                ?x fhir:ConceptMap.sourceUri ?obs_concept_id .
                ?x fhir:ConceptMap.targetUri ?desc_obs_concept_id .
                ?x fhir:ConceptMap.group.element.target.equivalence.value "descendant"^^xsd:string .
                ?y fhir:Condition.code ?desc_obs_concept_id .
                ?y fhir:Condition.subject ?patient .
                ?patient fhir:Patient.gender ?gender_id .
                ?gender_id fhir:Coding.code.value ?gender .
                ?patient fhir:Patient.birthDate.value ?birthDate .
                }

[QueryItem="test09"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

SELECT DISTINCT ?obs_concept_id ?obs_concept_code ?obs_code_display ?desc_code ?desc_code_display ?desc_code_system
       WHERE { 
                ?obs_concept_id fhir:Coding.code.value ?obs_concept_code . 
                FILTER ( str(?obs_concept_code) = '11289' ) . 
                ?obs_concept_id fhir:Coding.system.value ?obs_code_system .
                FILTER ( str(?obs_code_system) = 'RxNorm') .
                ?obs_concept_id fhir:Coding.display.value ?obs_code_display .
                ?x fhir:ConceptMap.sourceUri ?obs_concept_id .
                ?x fhir:ConceptMap.targetUri ?desc_obs_concept_id .
                ?x fhir:ConceptMap.group.element.target.equivalence.value "descendant"^^xsd:string .
                ?desc_obs_concept_id fhir:Coding.code.value ?desc_code .
                ?desc_obs_concept_id fhir:Coding.display.value ?desc_code_display .
                ?desc_obs_concept_id fhir:Coding.system.value ?desc_code_system . 
              }

[QueryItem="test10"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

SELECT DISTINCT ?patient ?gender ?birthDate
       WHERE { 
                ?obs_concept_id fhir:Coding.code.value ?obs_concept_code . 
                FILTER ( str(?obs_concept_code) = '11289' ) . 
                ?obs_concept_id fhir:Coding.system.value ?obs_code_system .
                FILTER ( str(?obs_code_system) = 'RxNorm') .
                ?obs_concept_id fhir:Coding.display.value ?obs_code_display .
                ?x fhir:ConceptMap.sourceUri ?obs_concept_id .
                ?x fhir:ConceptMap.targetUri ?desc_obs_concept_id .
                ?x fhir:ConceptMap.group.element.target.equivalence.value "descendant"^^xsd:string .

                ?y fhir:MedicationAdministration.medicationReference ?obs_concept_id .
                ?y fhir:MedicationAdministration.subject ?patient .
                 ?patient fhir:Patient.gender ?gender_id .
                ?gender_id fhir:Coding.code.value ?gender .
                ?patient fhir:Patient.birthDate.value ?birthDate .
             }

[QueryItem="test11"]
PREFIX : <http://hl7.org/fhir/fhir.ttl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fhir: <http://hl7.org/fhir/>

SELECT DISTINCT ?patient ?start_date ?end_date ?dose
       WHERE { 
                ?obs_concept_id fhir:Coding.code.value ?obs_concept_code . 
                FILTER ( str(?obs_concept_code) = '11289' ) . 
                ?obs_concept_id fhir:Coding.system.value ?obs_code_system .
                FILTER ( str(?obs_code_system) = 'RxNorm') .
                ?obs_concept_id fhir:Coding.display.value ?obs_code_display .
                ?x fhir:ConceptMap.sourceUri ?obs_concept_id .
                ?x fhir:ConceptMap.targetUri ?desc_obs_concept_id .
                ?x fhir:ConceptMap.group.element.target.equivalence.value "descendant"^^xsd:string .

                ?y fhir:MedicationAdministration.medicationReference ?desc_obs_concept_id .
                ?y fhir:MedicationAdministration.subject ?patient .
                ?y fhir:MedicationAdministration.effectivePeriod.Period.start ?start_date .
                ?y fhir:MedicationAdministration.effectivePeriod.Period.end ?end_date .
                ?y fhir:MedicationAdministration.dosage.dose.value ?dose .
             }
