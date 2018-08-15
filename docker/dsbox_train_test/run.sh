#!/bin/bash
python3 --version
ds_dir="${1}"
is_search="${2}"
timeout="${3}"

echo $ds_dir $is_search $timeout

export D3MINPUTDIR=${ds_dir}
export D3MOUTPUTDIR=${ds_dir}
export D3MCPU=4
export D3MRAM=5Gi

if [ "$is_search" == "search" ]; then
  export D3MRUN=search
  export D3MTIMEOUT=${timeout}

  python3 /user_opt/dsbox/dsbox-ta2/python/ta2_evaluation.py

else

  export D3MRUN=test

  python3 /user_opt/dsbox/dsbox-ta2/python/ta2_evaluation.py

fi