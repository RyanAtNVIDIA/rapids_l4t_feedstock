#!/bin/bash
source activate cudf
/rapids/utils/start_jupyter.sh > /dev/null
exec "$@"
