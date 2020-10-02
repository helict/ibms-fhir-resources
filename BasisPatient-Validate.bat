@echo off

if exist ./validator_cli.jar (
    java -jar validator_cli.jar BasisPatient-Example.xml^
        -ig BasisPatient.StructureDefinition.xml^
        -ig basisprofil-de-r4\extensions^
        -ig basisprofil-de-r4\datentypen-profile^
        -ig basisprofil-de-r4\ressourcen-profile^
        -profile http://helict.de/fhir/StructureDefinition/BasisPatient^
        -version 4.0.1
) else (
    echo Please download the validator and run again: https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar
)