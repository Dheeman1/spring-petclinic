Conversation opened. 2 messages. 1 message unread.


Skip to content
Using Gmail with screen readers
1 of 2,941
(no subject)
Inbox

Dheeman Das
11:46 AM (29 minutes ago)
https://github.com/DHEEMAN2912/spring-petclinic/tree/test

Dheeman Das <dheeman2912@gmail.com>
Attachments
12:14 PM (1 minute ago)
to me

install_dependenciesbuild

On Wed, Oct 30, 2024 at 6:16 AM Dheeman Das <dheeman2912@gmail.com> wrote:
https://github.com/DHEEMAN2912/spring-petclinic/tree/test
 4 Attachments
  •  Scanned by Gmail
#!/bin/bash

# Step 3: Build with Maven Wrapper
echo "Building with Maven Wrapper..."
mvn clean package -DskipTests
mv target/*.jar app.jar

# Step 4: Generate artifact attestation
echo "Generating artifact attestation..."
npx actions-attest-build-provenance --subject-path ./app.jar

# Step 6: Generate SBOM with Syft
echo "Generating SBOM with Syft..."
syft dir:. -o cyclonedx-json > sbom.json

# Step 7: Upload SBOM
echo "Uploading SBOM..."
gh actions upload-artifact --name sbom --path sbom.json

# Step 10: Generate SBOM attestation
echo "Generating SBOM attestation..."
npx actions-attest-sbom --subject-path ./sbom.json --sbom-path ./sbom.json

# Step 11: Verify SBOM attestation
echo "Verifying SBOM attestation..."
gh attestation verify ./sbom.json --owner dheeman2912 --format=json

# Step 12: Build Docker Image using Maven
echo "Building Docker Image..."
./mvnw clean spring-boot:build-image -Dmaven.test.skip=true
build_script.sh
Displaying build_script.sh.
