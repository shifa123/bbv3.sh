#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

AMASS_VERSION=3.8.2


echo "${RED} ######################################################### ${RESET}"
echo "${RED} #                 TOOLS FOR BUG BOUNTY                  # ${RESET}"
echo "${RED} ######################################################### ${RESET}"
logo(){
echo "${BLUE}
                ___ ___ _  _ _____     ___
               | _ ) _ ) || |_   _|_ _|_  )
               | _ \ _ \ __ | | | \ V // /
               |___/___/_||_| |_|  \_//___| ${RESET}"
}
logo
echo ""
echo "${GREEN} Tools created by the best people in the InfoSec Community ${RESET}"
echo "${GREEN}                   Thanks to everyone!                     ${RESET}"
echo ""


echo "${GREEN} [+] Updating and installing dependencies ${RESET}"
echo ""

sudo apt-get -y update
sudo apt-get -y upgrade

sudo add-apt-repository -y ppa:apt-fast/stable < /dev/null
sudo echo debconf apt-fast/maxdownloads string 16 | debconf-set-selections
sudo echo debconf apt-fast/dlflag boolean true | debconf-set-selections
sudo echo debconf apt-fast/aptmanager string apt-get | debconf-set-selections
sudo apt install -y apt-fast

sudo apt-fast install -y apt-transport-https
sudo apt-fast install -y libcurl4-openssl-dev
sudo apt-fast install -y libssl-dev
sudo apt-fast install -y jq
sudo apt-fast install -y ruby-full
sudo apt-fast install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-fast install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-fast install -y python-setuptools
sudo apt-fast install -y libldns-dev
sudo apt-fast install -y python3-pip
sudo apt-fast install -y python-dnspython
sudo apt-fast install -y git
sudo apt-fast install -y npm
sudo apt-fast install -y nmap phantomjs 
sudo apt-fast install -y gem
sudo apt-fast install -y perl 
sudo apt-fast install -y parallel
pip3 install jsbeautifier
echo ""
echo ""
sar 1 1 >/dev/null

#Setting shell functions/aliases
echo "${GREEN} [+] Setting bash_profile aliases ${RESET}"
curl https://raw.githubusercontent.com/unethicalnoob/aliases/master/bashprofile > ~/.bash_profile
echo "${BLUE} If it doesn't work, set it manually ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null 

echo "${GREEN} [+] Installing Golang ${RESET}"
if [ ! -f /usr/bin/go ];then
    cd ~
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
	export GOROOT=$HOME/.go
	export PATH=$GOROOT/bin:$PATH
	export GOPATH=$HOME/go
    echo 'export GOROOT=$HOME/.go' >> ~/.bash_profile
	
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile 
else 
    echo "${BLUE} Golang is already installed${RESET}"
fi
    break
echo""
echo "${BLUE} Done Install Golang ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null

#Installing tools

echo "${RED} #################### ${RESET}"
echo "${RED} # Installing tools # ${RESET}"
echo "${RED} #################### ${RESET}"


echo "${GREEN} #### Basic Tools #### ${RESET}"


#install sqlmap
echo "${BLUE} installing sqlmap${RESET}"
sudo apt-fast install sqlmap
echo "${BLUE} done${RESET}"
echo ""


#install ffuf
echo "${BLUE} installing ffuf${RESET}"
go get -u github.com/ffuf/ffuf
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing dirsearch${RESET}"
git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN}#### Installing Domain Enum Tools ####${RESET}"


#install sub.sh
echo "${BLUE} sub.sh ${RESET}"
git clone https://github.com/cihanmehmet/sub.sh.git ~/tools/subsh
cd ~/tools/subsh && chmod +x sub.sh
echo "${BLUE} done ${RESET}"
echo ""

#install subjack
echo "${BLUE} installing subjack ${RESET}"
go get -u github.com/haccer/subjack
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing Sublister ${RESET}"
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r
cd ~/tools/Sublist3r
sudo pip3 install -r requirements.txt
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing Subover ${RESET}"
go get -u github.com/Ice3man543/SubOver
echo "${BLUE} done ${RESET}"
echo ""


sar 1 1 >/dev/null


echo "${GREEN} #### Installing CORS Tools #### ${RESET}"

##cors install
echo "${BLUE} installing cors-scanner ${RESET}"
git clone https://github.com/chenjj/CORScanner.git ~/tools/corscanner
sudo pip3 install -r requirements.txt
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing another cors scanner${RESET}"
go get -u github.com/Tanmay-N/CORS-Scanner
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null



echo "${GREEN} #### Installing XSS Tools#### ${RESET}"

echo "${BLUE} installing dalfox${RESET}"
git clone https://github.com/hahwul/dalfox ~/tools/dalfox
cd ~/tools/dalfox/ && go build dalfox.go
sudo cp dalfox /usr/bin/
echo "${BLUE} done${RESET}"
echo ""


sar 1 1 >/dev/null


#install lazys3
echo "${BLUE} lazys3${RESET}"
git clone https://github.com/nahamsec/lazys3.git ~/tools/lazys3
echo "${BLUE} done${RESET}"
echo ""


#install S3Scanner
echo "${BLUE} installing S3Scanner${RESET}"
git clone https://github.com/sa7mon/S3Scanner.git ~/tools/S3Scanner 
cd ~/tools/S3Scanner
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""


sar 1 1 >/dev/null


echo "${GREEN} #### Installing CMS Tools #### ${RESET}" 
#install Joomscan
echo "${BLUE} installing Joomscan${RESET}"
git clone https://github.com/rezasp/joomscan.git ~/tools/CMS/Joomscan
echo "${BLUE} done${RESET}"
echo ""

#install wpscan
echo "${BLUE} installing wpscan${RESET}"
sudo gem install wpscan
echo "${BLUE} done${RESET}"
echo ""

#install droopescan
echo "${BLUE} installing droopescan${RESET}"
sudo pip3 install droopescan
echo "${BLUE} done${RESET}"
echo ""

#install drupwn
echo "${BLUE} installing drupwn${RESET}"
git clone https://github.com/immunIT/drupwn.git ~/tools/CMS/drupwn
cd ~/tools/CMS/drupwn
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} Adobe scanner${RESET}"
git clone https://github.com/0ang3el/aem-hacker.git ~/tools/CMS/aem-hacker
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN}#### Downloading Git tools ####${RESET}"

echo "${BLUE} git-scanner${RESET}"
git clone https://github.com/HightechSec/git-scanner ~/tools/GIT/git-scanner
cd ~/tools/GIT/git-scanner && chmod +x gitscanner.sh
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} gitgraber${RESET}"
git clone https://github.com/hisxo/gitGraber.git ~/tools/GIT/gitGraber
cd ~/tools/GIT/gitGraber && chmod +x gitGraber.py
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE}  GitHound${RESET}"
git clone https://github.com/tillson/git-hound.git ~/tools/GIT/git-hound
cd ~/tools/GIT/git-hound
sudo go build main.go && mv main githound
echo "${BLUE} Create a ./config.yml or ~/.githound/config.yml${RESET}"
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} gitsearch${RESET}"
git clone https://github.com/gwen001/github-search.git ~/tools/GIT/github-search
cd ~/tools/GIT/github-search 
sudo pip3 install -r  requirements3.txt
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null






echo "${GREEN}#### Downloading Frameworks ####${RESET}"
#install Sn1per
echo "${BLUE} Sn1per${RESET}"
git clone https://github.com/1N3/Sn1per.git ~/tools/Frameworks/Sn1per
echo "${BLUE} done${RESET}"
echo ""

#install Osmedeus
echo "${BLUE} Osmedeus${RESET}"
git clone https://github.com/j3ssie/Osmedeus.git ~/tools/Frameworks/osmedeus
echo "${BLUE} done${RESET}"
echo ""



echo "${BLUE} installing Sudomy${RESET}"
git clone --recursive https://github.com/screetsec/Sudomy.git ~/tools/Frameworks/Sudomy
cd ~/tools/Frameworks/Sudomy
sudo pip3 install -r requirements.txt
sudo npm i -g wappalyzer
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing findomain${RESET}"
cd ~/tools/Frameworks
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
sudo chmod +x findomain-linux
sudo cp findomain-linux /usr/bin/findomain
echo "${BLUE} Add your keys in the config file"
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN}#### Other Tools ####${RESET}"

echo "${BLUE} installing SSRFMap ${RESET}"
git clone https://github.com/swisskyrepo/SSRFmap ~/tools/SSRFMap
cd ~/tools/SSRFMap/
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing XSRFProbe${RESET}"
sudo pip3 install xsrfprobe
echo "${BLUE} done${RESET}"
echo ""


#install JSParser
echo "${BLUE} installing JSParser${RESET}"
git clone https://github.com/nahamsec/JSParser.git ~/tools/JSParser
cd ~/tools/JSParser
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

#install subjs
echo "${BLUE} installing subjs${RESET}"
go get -u github.com/lc/subjs
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing broken-link-checker${RESET}"
sudo npm install broken-link-checker -g
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing pwncat${RESET}"
sudo pip3 install pwncat
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing Photon${RESET}"
git clone https://github.com/s0md3v/Photon.git ~/tools/Photon
cd ~/tools/Photon
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing hakrawler${RESET}"
git clone https://github.com/hakluke/hakrawler.git ~/tools/hakrawler
cd ~/tools/hakrawler
go build main.go && mv main hakrawler
sudo mv hakrawler /usr/bin/
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing waff00f${RESET}"
git clone https://github.com/EnableSecurity/wafw00f.git ~/tools/waff00f
cd ~/tools/wafw00f
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} Paramspider${RESET}"
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider
cd ~/tools/ParamSpider
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} installing gau${RESET}"
go get -u github.com/lc/gau
echo "${BLUE} done${RESET}"
echo ""



echo "${BLUE} LinkFinder${RESET}"
git clone https://github.com/GerbenJavado/LinkFinder.git ~/tools/LinkFinder
cd ~/tools/LinkFinder
sudo pip3 install -r requirements.txt
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} SecretFinder${RESET}"
git clone https://github.com/m4ll0k/SecretFinder.git ~/tools/SecretFinder
cd ~/tools/SecretFinder && chmod +x secretfinder
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN}#### ProjectDiscovery Pinned Tools ####${RESET}"


echo "${BLUE} installing nuclei${RESET}"
go get -u github.com/projectdiscovery/nuclei/v2/cmd/nuclei
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing subfinder${RESET}"
go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing httpx${RESET}"
go get -u github.com/projectdiscovery/httpx/cmd/httpx
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null


echo "${GREEN} #### Downloading wordlists #### ${RESET}"
git clone https://github.com/assetnote/commonspeak2-wordlists ~/tools/Wordlists/commonspeak2-wordlists
git clone https://github.com/fuzzdb-project/fuzzdb ~/tools/Wordlists/fuzzdb
git clone https://github.com/1N3/IntruderPayloads ~/tools/Wordlists/IntruderPayloads
git clone https://github.com/swisskyrepo/PayloadsAllTheThings ~/tools/Wordlists/PayloadsAllTheThings
git clone https://github.com/danielmiessler/SecLists ~/tools/Wordlists/SecLists
cd ~/tools/Wordlists/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
printf "${BLUE} Wordlists downloaded ${RESET}"

sar 1 1 >/dev/null



echo "${GREEN} #### Installing tomnomnom tools #### ${RESET}"
echo "${GREEN}   check out his other tools as well  ${RESET}"

echo "${BLUE} installing meg${RESET}"
go get -u github.com/tomnomnom/meg
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing assetfinder${RESET}"
go get -u github.com/tomnomnom/assetfinder
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing waybackurls${RESET}"
go get -u github.com/tomnomnom/waybackurls
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing gf${RESET}"
go get -u github.com/tomnomnom/gf
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing httprobe${RESET}"
go get -u github.com/tomnomnom/httprobe
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing concurl${RESET}"
go get -u github.com/tomnomnom/hacks/concurl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing unfurl${RESET}"
go get -u github.com/tomnomnom/unfurl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing anti-burl${RESET}"
go get -u github.com/tomnomnom/hacks/anti-burl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing filter-resolved${RESET}"
go get github.com/tomnomnom/hacks/filter-resolved
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing fff${RESET}"
go get -u github.com/tomnomnom/fff
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing qsreplace${RESET}"
go get -u github.com/tomnomnom/qsreplace
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN} #### Other other Tools #### ${RESET}"

echo "${BLUE} installing amass${RESET}"
cd ~ && echo -e "Downloading amass version ${AMASS_VERSION} ..." && wget -q https://github.com/OWASP/Amass/releases/download/v${AMASS_VERSION}/amass_linux_amd64.zip && unzip amass_linux_amd64.zip && mv amass_linux_amd64/amass /usr/bin/

cd ~ && rm -rf amass_linux_amd64* amass_linux_amd64.zip*
echo "${BLUE} done${RESET}"
echo ""
unzip -q temp.zip && 


echo "${BLUE} installing impacket${RESET}"
git clone https://github.com/SecureAuthCorp/impacket.git ~/tools/impacket
cd ~/tools/impacket
sudo pip3 install -r requirements.txt
sudo pip3 install .
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null
