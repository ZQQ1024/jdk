#! /bin/bash

JAVA_URL="http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz"
# Checksum via https://www.oracle.com/webfolder/s/digest/8u144checksum.html
CHECKSUM="e8a341ce566f32c3d06f6d0f0eeea9a0f434f538d22af949ae58bc86f2eeaae4"

curl \
	-L \
	-H "Cookie: oraclelicense=accept-securebackup-cookie" \
	-o /tmp/jdk.tar.gz \
	"${JAVA_URL}"

DOWNLOADED_CHECKSUM=`sha256sum /tmp/jdk.tar.gz | grep -o -E -e "[a-f0-9]*\s" | tr -d '[[:space:]]'`

echo "Checksum from Oracle is: ${CHECKSUM}"
echo "Downloaded checksum is: ${DOWNLOADED_CHECKSUM}"

if [ "${CHECKSUM}" != "${DOWNLOADED_CHECKSUM}" ]; then
	echo "Checksum verification failed; install aborted."
	rm /tmp/jdk.tar.gz
	exit 1
fi

groupadd user_grp -g 4001 && \
useradd -u 4001 --home-dir /srv/zqq --create-home --system --no-user-group zqq && \
usermod -g user_grp zqq && \
ln -s /srv/zqq /var/lib/zqq && \
chown -R zqq:user_grp /var/lib/zqq

tar -xzf /tmp/jdk.tar.gz -C /srv/zqq
chown -R zqq:user_grp ${JAVA_HOME}

#ln -s ${JAVA_HOME} /usr/java/jdk1.8
#echo "PATH=$PATH:/usr/java/jdk1.8/jre/bin:/usr/java/jdk1.8/bin" > /etc/profile.d/java
rm /tmp/jdk.tar.gz


