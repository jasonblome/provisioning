# install chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install Slack
choco install slack -y

# install Chrome browser
choco install googlechrome -y --ignore-checksums

# install FileZilla
choco install filezilla -y

# install Atom editor
choco install atom -y

# install Xming
choco install xming -y
# add the IP address of this host to the security settings for Xming
$ipaddr = (Get-NetIPAddress -AddressState Preferred  -AddressFamily IPv4 -InterfaceAlias Ethernet0).IPv4Address
Add-Content 'C:\Program Files (x86)\Xming\X0.hosts' "`n$ipaddr"

# install Anaconda: this can take ~5 minutes or so
choco install anaconda3 -y --version 5.1.0 --execution-timeout 10000 --params="'/InstallationType:JustMe /AddToPath:1 /D=$Env:UserProfile\Anaconda'"

# install the Bloomberg APIs for python
iex "$Env:UserProfile\Anaconda\Scripts\conda.exe install -y -c mbonix blpapi"
iex "$Env:UserProfile\Anaconda\Scripts\pip.exe install --find-links https://s3.amazonaws.com/stoneridge-wheelhouse/index.html ds-bpipe"

# install the JetBrains toolbox
choco install jetbrainstoolbox -y

# install VSCode
choco install vscode -y

# install SQL Server Management Studio
choco install sql-server-management-studio -y

# install virtualbox: this takes a few minutes unfortunately (c:\Program Files\Oracle\VirtualBox)
choco install virtualbox -y --version 5.2.12 --params="'/NoDesktopShortcut'"

# install vagrant
choco install vagrant -y --version 2.1.1

# install vagrant plugins
C:\HashiCorp\Vagrant\bin\vagrant plugin install --plugin-version 0.15.1 vagrant-vbguest
C:\HashiCorp\Vagrant\bin\vagrant plugin install --plugin-version 1.3.2 vagrant-s3auth

# install Git
choco install git -y
