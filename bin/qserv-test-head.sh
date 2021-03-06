#!/bin/sh

# LSST Data Management System
# Copyright 2014 LSST Corporation.
#
# This product includes software developed by the
# LSST Project (http://www.lsst.org/).
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the LSST License Statement and
# the GNU General Public License along with this program.  If not,
# see <http://www.lsstcorp.org/LegalNotices/>.


# Rebuild, configure and run integration tests against a Qserv git
# repository.

# @author  Fabrice Jammes, IN2P3/SLAC

set -e

usage() {
  cat << EOD

Usage: `basename $0` [options]

  Available options:
    -h          this message
    -r          rebuild: clean and rebuild whole Qserv code
    -C          configure: configure Qserv mono-node instance
    -c          Specify which test case number to run, all tests
                are run by default
    -R          Specify Qserv execution directory, default to
                \$HOME/qserv-run/git

    This command will build, install and configure a Qserv mono-node
    instance using a given Qserv source repository. It will then launch
    integration tests against it. The whole process is logged to standard
    ouput and the command returns 0 if successful.

  Pre-requisite:
    source loadLSST.bash
    setup qserv_distrib -t qserv
    setup -k -r \${QSERV_SRC_DIR}

  Can be used with 'git bisect' :
    cd \${QSERV_SRC_DIR}
    git bisect start
    git bisect bad
    git bisect good previous-git-commit-id-which-pass-tests
    git bisect run `basename $0`


EOD
}

CONFIGURE=false
REBUILD_ALL=false
TEST_CASE=''
QSERV_RUN_DIR="$HOME"/qserv-run/git

# get the options
while getopts "hrCc:R:" c ; do
    case $c in
            h) usage ; exit 0 ;;
            r) REBUILD_ALL=true ;;
            C) CONFIGURE=true ;;
            c) TEST_CASE="${OPTARG}" ;;
            R) QSERV_RUN_DIR="${OPTARG}";;
            \?) usage ; exit 2 ;;
    esac
done
shift `expr $OPTIND - 1`

if [ $# -gt 0 ] ; then
    usage
    exit 2
fi

# load eups "setup" function
if [ -f "${EUPS_DIR}/bin/setups.sh" ]; then
    . "${EUPS_DIR}/bin/setups.sh"
else
    printf "ERROR: ${EUPS_DIR}/bin/setups.sh must be a file\n"
    exit 1
fi

if [ ! -f "${QSERV_DIR}/SConstruct" ]; then
    printf "ERROR: ${QSERV_DIR}/SConstruct must be a file\n"
    exit 1
fi

# cleaning, if source directory
cd ${QSERV_DIR}

if [ "${REBUILD_ALL}" = true ]; then
    rm -rf build lib proxy bin cfg
fi

scons install -j $(nproc)

if [ "${CONFIGURE}" = true ]; then
    qserv-configure.py --all --force -R "${QSERV_RUN_DIR}"
fi

# record Qserv version
GIT_HASH=$(git log -n 1 --pretty=format:"%H")
printf "%s\n" "${GIT_HASH}" > "${QSERV_RUN_DIR}"/GIT-HASH

# integration tests
PASS=0
{
    "${QSERV_RUN_DIR}"/bin/qserv-start.sh
    if [ "${TEST_CASE}" ]; then
        qserv-check-integration.py --case=${TEST_CASE} --load || PASS=1
    else
        qserv-test-integration.py || PASS=1
    fi
}
"${QSERV_RUN_DIR}"/bin/qserv-stop.sh

exit $PASS
