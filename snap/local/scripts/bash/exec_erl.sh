#!/bin/sh
#
# %CopyrightBegin%
# 
# Copyright Mathias Green 2019. All Rights Reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# %CopyrightEnd%
#
# The script based on https://github.com/erlang/otp/blob/master/erts/etc/unix/erl.src.src
# Copyright Ericsson AB 1996-2016. All Rights Reserved.
#
# %CopyrightEnd%
OTP_ROOT=$1/usr/OTP/lib/erlang
echo $OTP_ROOT
if [ ! -d "$OTP_ROOT/erts-10.5/bin" ]
then
    echo "Install: The directory $OTP_ROOT/erts-10.5/bin does not exist" >&2
    echo "         Bad location or erts module not un-tared" >&2
    exit 1
fi

ROOTDIR="$OTP_ROOT"
BINDIR=$ROOTDIR/erts-10.5/bin
EMU=beam
PROGNAME=`echo $0 | sed 's/.*\///'`
export EMU
export ROOTDIR
export BINDIR
export PROGNAME
exec "$BINDIR/erlexec" ${1+"$@"}
