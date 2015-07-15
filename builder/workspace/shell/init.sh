#!/bin/bash
#
# エントリーポイント
#

find /startup -type f  -name "*.sh" -exec bash {} \;


$*
