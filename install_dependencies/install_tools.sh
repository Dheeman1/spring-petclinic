Conversation opened. 2 messages. 1 message unread.


Skip to content
Using Gmail with screen readers
1 of 2,941
(no subject)
Inbox

Dheeman Das
11:46 AM (30 minutes ago)
https://github.com/DHEEMAN2912/spring-petclinic/tree/test

Dheeman Das <dheeman2912@gmail.com>
Attachments
12:14 PM (2 minutes ago)
to me

install_dependenciesbuild

On Wed, Oct 30, 2024 at 6:16 AM Dheeman Das <dheeman2912@gmail.com> wrote:
https://github.com/DHEEMAN2912/spring-petclinic/tree/test
 4 Attachments
  •  Scanned by Gmail
#!/bin/bash

# Update package list and install essential tools
echo "Updating package list and installing essential tools..."
apt-get update && apt-get install -y curl gnupg2 lsb-release

# Install wget
echo "Installing wget..."
apt-get install -y wget

# Install Syft
echo "Installing Syft..."
curl -sSL https://github.com/anchore/syft/releases/download/v0.66.0/syft_0.66.0_linux_amd64.tar.gz | tar xz -C /usr/local/bin syft

# Install Trivy
echo "Installing Trivy..."
apt-get install -y wget
wget https://github.com/aquasecurity/trivy/releases/download/v0.19.2/trivy_0.19.2_Linux-64bit.deb
dpkg -i trivy_0.19.2_Linux-64bit.deb
echo "Trivy installed at: $(which trivy)"
trivy --version  # Verify installation

# Install GitHub CLI and jq
echo "Installing GitHub CLI and jq..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" > /etc/apt/sources.list.d/github-cli.list
apt-get update
apt-get install -y gh jq

# Install Cosign
echo "Installing Cosign..."
curl -sSL -o /usr/local/bin/cosign https://github.com/sigstore/cosign/releases/download/v2.2.3/cosign-linux-amd64
chmod +x /usr/local/bin/cosign

# Clean up faulty Azure CLI sources
echo "Cleaning up faulty Azure CLI sources..."
rm -f /etc/apt/sources.list.d/azure-cli.list
rm -f /etc/apt/sources.list.d/azure-cli.sources

# Install Azure CLI
echo "Installing Azure CLI..."
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release unzip
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install kubectl
echo "Installing kubectl..."
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl  # Clean up after installation

echo "All tools installed successfully."
install_tools.sh
Displaying build_script.sh.
