#!/bin/sh
cp wildfly-ee-galleon-pack-updated-manifest.yaml wildfly-ee-manifest.yaml
rm foo/README.txt
cp provisioning-update.xml foo/.galleon/provisioning.xml
touch foo/foo.txt
echo "foo" >> foo/copyright.txt
mkdir -p foo/toto
touch foo/toto/titi.txt
echo "<!-- FOO -->" >> foo/modules/system/layers/base/org/aesh/main/module.xml
echo "<!-- FOO -->" >> foo/standalone/configuration/standalone.xml
