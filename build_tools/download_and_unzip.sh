#!/bin/bash

GRADLE_URL="https://services.gradle.org/distributions/gradle-6.9.2-bin.zip"
curl -JOL "$GRADLE_URL"

GRADLE_CHECKSUM_URL="https://services.gradle.org/distributions/gradle-6.9.2-bin.zip.sha256"
curl -JOL "$GRADLE_CHECKSUM_URL"

diff -Z <(sha256sum gradle-6.9.2-bin.zip | awk '{print $1}') <(cat gradle-6.9.2-bin.zip.sha256)
mv ./gradle-6.9.2-bin.zip /opt

MAVEN_URL="https://mirrors.ocf.berkeley.edu/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip"
curl -JOL "$MAVEN_URL"

MAVEN_CHECKSUM_URL="https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip.sha512"
curl -JOL "$MAVEN_CHECKSUM_URL"

diff -Z <(sha512sum apache-maven-3.6.3-bin.zip | awk '{print $1}') <(cat apache-maven-3.6.3-bin.zip.sha512)
mv ./apache-maven-3.6.3-bin.zip /opt

cd /opt || exit
unzip gradle-6.9.2-bin.zip
unzip apache-maven-3.6.3-bin.zip

rm -f gradle-6.9.2-bin.zip apache-maven-3.6.3-bin.zip

cd / || exit

# EOF