
cd /user_opt/dsbox/dsbox-ta2/python

case $D3MRUN in
  search)
    echo "executing search"
    # Each individual project should call whatever code with whatever parameter to do search(replace python example.py)
    #This section is show for search mode what directories will be archive
    mkdir -p ${D3MOUTPUTDIR}/pipelines
    mkdir -p ${D3MOUTPUTDIR}/executables
    mkdir -p ${D3MOUTPUTDIR}/supporting_files

    #touch ${D3MOUTPUTDIR}/pipelines/pipe.txt
    #touch ${D3MOUTPUTDIR}/executables/exe.txt
    #touch ${D3MOUTPUTDIR}/supporting_files/support.txt
    #
    python3 ta2_evaluation.py
    ;;
  test)
    echo "executing test"
    # Each individual project should call whatever code with whatever parameter to do test(replace python example.py)
    #This section is show for search mode what directories will be archive
    mkdir -p ${D3MOUTPUTDIR}/pipelines
    mkdir -p ${D3MOUTPUTDIR}/executables
    mkdir -p ${D3MOUTPUTDIR}/supporting_files
    mkdir -p ${D3MOUTPUTDIR}/predictions

    #not creating anything in pipelines because it was populated in search mode
    #touch ${D3MOUTPUTDIR}/predictions/predict.txt
    #touch ${D3MOUTPUTDIR}/executables/exe.txt
    #touch ${D3MOUTPUTDIR}/supporting_files/support.txt
    #
    python3 ta2_evaluation.py
    ;;
  #ta2ta3)
  #  echo "executing ta2 ta3 combine run"
    # Each individual project should call whatever code with whatever parameter to do execute with TA3(replace python example.py)
  #  python example.py
  #  ;;
  #*)
  #  echo "don\'t know what to do"
  #  python example.py
  #  ;;
esac
