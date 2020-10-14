#/usr/bin/env sh

if [ -f ./validator_cli.jar ]; then
    java -jar ./validator_cli.jar Examples \
         -ig DerivedProfiles \
         -ig basisprofil-de-r4/extensions \
         -ig basisprofil-de-r4/datentypen-profile \
         -ig basisprofil-de-r4/ressourcen-profile \
         -profile http://helict.de/fhir/StructureDefinition/BasisPatient \
         -version 4.0.1 \
	 -recurse -debug
else
    echo "Please download the validator and run again: https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar"
fi
