# prospero-update-demo

Pre-requisites
========
* Build WF 28 main branch
* Build Galleon from fork jfdenise, branch export-system-paths
* Build prospero from future branch, fork jfdenise
* Update prospero-conf.yaml with paths to the demo dir for wildfly-ee-manifest.yaml. wildfly-manifest.yaml and prospero-manifest.yaml


Demo details
========

* Install a server
* Simulate changes in installation 
* Start the server. 
* Build an update in the update directory while the server is running.
* Apply an update by: 
   * killing the server by running CLI from the installation directory
   * running prospero from the update directory to apply the update to the installation 
   * restarting the server from the installation directory
   * deleting the update directory

Run demo
=======

* sh ./do-setup.sh
* [prospero project dir]/prospero install --dir=foo --definition=./provisioning.xml --provision-config=./prospero-conf.yaml
* sh ./do-changes.sh
* sh ./foo/bin/standalone.sh &
* sh ./foo/bin/prospero.sh build-update --dir=foo --target-dir=update-foo
* sh ./do-apply-update.sh $PWD/update-foo $PWD/foo

