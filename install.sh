#!/bin/bash

echo 'Fetching ns2 source'
#wget -O ns-allinone-2.35.tar.gz http://sourceforge.net/projects/nsnam/files/allinone/ns-allinone-2.35/ns-allinone-2.35.tar.gz/download
curl http://sourceforge.net/projects/nsnam/files/allinone/ns-allinone-2.35/ns-allinone-2.35.tar.gz/download -o ns-allinone-2.35.tar.gz
echo 'Source downlaoded.'
tar xvzf ns-allinone-2.35.tar.gz
cd ns-allinone-2.35
echo 'Downloading patch files.'
#wget https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/install64
curl https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/install64
chmod +x install64

#wget https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/ns_common_tclAppInit.cc.patch
curl https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/ns_common_tclAppInit.cc.patch

#wget https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/ns_common_tkAppInit.cc.patch
curl https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/ns_common_tkAppInit.cc.patch

#wget https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/ns_linkstate_ls.h.patch
curl https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/ns_linkstate_ls.h.patch

#wget https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/ns_makefile.patch
curl https://raw.githubusercontent.com/dhruvvyas90/ns-allinone-2.35-Mac-OS-10.9-install-patch/master/ns_makefile.patch

echo "Patch downloaded"
echo "Installing..."

./install64

echo "Installation complete"
echo "Installing paths"
echo "export PATH=$PATH:`pwd`/ns-2.35:`pwd`/nam-1.15" >> ~/.bash_profile
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`/otcl-1.14:`pwd`/lib" >> ~/.bash_profile
echo "export TCL_LIBRARY=$TCL_LIBRARY:`pwd`/tcl8.5.10/" >> ~/.bash_profile

source ~/.bash_profile

echo 'Path installation complete. Run ns or nam'
echo 'cleaning up...'

cd ..

rm ns-allinone-2.35.tar.gz

echo 'Installation complete'
