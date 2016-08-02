#!/bin/bash

# Return package version, release or epoch based on git tags and commits
# Based on https://datasift.github.io/gitflow/Versioning.html AND
# https://datasift.github.io/gitflow/Versioning.html
# RPM name follows https://fedoraproject.org/wiki/Packaging:NamingGuidelines
# Git tags should always be X.Y.Z (major.minor.patch)
# Builds from master should end up being X.Y.Z-B where B is build number
# Builds from any other branch end up being X.Y.Z-SNAPSHOT-B-GH-GB where
#       GH is git commit hash (like g88e2ebb)
#       GB is git branch (like versioning)
# Example builds:
#       release version from master: 2.2.0-1
#       rebuild version from master: 2.2.0-5
#       dev version from feature : 2.2.0-SNAPSHOT.35.g88e2ebb.versioning

# Set this to your application name
# This can be overridden with $ semver.sh rpmname NEWNAME
NAME=gsk-user

###########################
## Do not modify below here
###########################
SEMVER_VERSION=1.3
BINARY_NAME=${2:-${NAME}}
EPOCH=$(date +%s)
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD| sed -e 's/-/./g')
VERSION=$(git describe --tags --match [0-9].[0-9].[0-9]  --always | cut -f1 -d'-')
COMMIT_DETAIL=$(git describe --long --tags --always --match [0-9].[0-9].[0-9] | cut -f2- -d'-' | sed -e 's/-/./g')
RPMARCH=x86_64
DEBARCH=amd64
DIST=el7

## Naming logic
if [[ $GIT_BRANCH == 'master' ]] ; then
  RELEASE=$(git describe --long --tags --always --match [0-9].[0-9].[0-9] | cut -f2 -d'-')
  SHORT=${VERSION}
  FULL=${VERSION}.${COMMIT_DETAIL}.${GIT_BRANCH}
else
  RELEASE="SNAPSHOT.${COMMIT_DETAIL}.${GIT_BRANCH}"
  SHORT=${VERSION}-SNAPSHOT
  FULL=${VERSION}-SNAPSHOT.${COMMIT_DETAIL}.${GIT_BRANCH}
fi

RPM_NAME=${BINARY_NAME}-${VERSION}-${RELEASE}.${DIST}.${RPMARCH}.rpm
DEB_NAME=${BINARY_NAME}_${VERSION}-${RELEASE}_${DEBARCH}.deb

# Evaluate arguments
case $1 in
  full)
    echo "$FULL"
    ;;
  short)
    echo "$SHORT"
    ;;
  version)
    echo $VERSION
    ;;
  release)
    echo $RELEASE
    ;;
  epoch)
    echo $EPOCH
    ;;
  rpmname)
    echo $RPM_NAME
    ;;
  debname)
    echo $DEB_NAME
    ;;
  *)
    echo $"Usage: $0 {version|release|epoch|full|short|rpmname|debname} [APPNAME]"
    echo "Version $SEMVER_VERSION"
    exit 1
esac
