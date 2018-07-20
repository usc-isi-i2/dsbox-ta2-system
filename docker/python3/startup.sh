#! /bin/bash
#execute ta1-pipeline code to generate submission product
cd /user_opt/dsbox/dsbox-ta2/python
python3 train_test_aws.py $1
