#/usr/bin/env sh

# Check if java runtime is installed
[ -z "$(command -v java)" ] && echo "Please install java runtime environment: https://openjdk.java.net/install" && exit 1

# Download FHIR validator if not exist and validate FHIR resources
[ ! -f ./validator_cli.jar ] && wget -q https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar

java -jar ./validator_cli.jar Examples/*Patient*.* \
     -ig DerivedProfiles/*Patient*.* \
     -ig basisprofil-de-r4/extensions \
     -ig basisprofil-de-r4/datentypen-profile \
     -ig basisprofil-de-r4/ressourcen-profile \
     -ig basisprofil-de-r4/terminologie \
     -profile http://helict.de/fhir/StructureDefinition/BasisPatient \
     -version 4.0.1 \
     -recurse -debug

java -jar ./validator_cli.jar Examples/*Consent*.* \
     -ig DerivedProfiles/*Consent*.* \
     -ig basisprofil-de-r4/extensions \
     -ig basisprofil-de-r4/datentypen-profile \
     -ig basisprofil-de-r4/ressourcen-profile \
     -ig basisprofil-de-r4/terminologie \
     -profile http://helict.de/fhir/StructureDefinition/BasisConsent \
     -version 4.0.1 \
     -recurse -debug
