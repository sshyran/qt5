#!/bin/bash

#############################################################################
##
## Copyright (C) 2017 The Qt Company Ltd.
## Contact: http://www.qt.io/licensing/
##
## This file is part of the provisioning scripts of the Qt Toolkit.
##
## $QT_BEGIN_LICENSE:LGPL21$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see http://www.qt.io/terms-conditions. For further
## information use the contact form at http://www.qt.io/contact-us.
##
## GNU Lesser General Public License Usage
## Alternatively, this file may be used under the terms of the GNU Lesser
## General Public License version 2.1 or version 3 as published by the Free
## Software Foundation and appearing in the file LICENSE.LGPLv21 and
## LICENSE.LGPLv3 included in the packaging of this file. Please review the
## following information to ensure the GNU Lesser General Public License
## requirements will be met: https://www.gnu.org/licenses/lgpl.html and
## http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
##
## As a special exception, The Qt Company gives you certain additional
## rights. These rights are described in The Qt Company LGPL Exception
## version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
##
## $QT_END_LICENSE$
##
#############################################################################

# This script installs PostgreSQL

# PostgreSQL is needed for Qt to be able to support PostgreSQL

set -ex

# shellcheck source=../common/InstallAppFromCompressedFileFromURL.sh
source "${BASH_SOURCE%/*}/../common/InstallAppFromCompressedFileFromURL.sh"

PrimaryUrl="http://ci-files01-hki.intra.qt.io/input/mac/osx_10.11_el_capitan/Postgres-9.6.0.zip"
AltUrl="https://github.com/PostgresApp/PostgresApp/releases/download/9.6.0/Postgres-9.6.0.zip"
SHA1="5078e44663787006ca55fa3b5e2be598bed82eb5"
appPrefix=""

InstallAppFromCompressedFileFromURL "$PrimaryUrl" "$AltUrl" "$SHA1" "$appPrefix"

echo "export POSTGRESQLBINPATH=/Applications/Postgres.app/Contents/Versions/9.6/bin" >> ~/.bashrc
echo "PostgreSQL = 9.6.0" >> ~/versions.txt
