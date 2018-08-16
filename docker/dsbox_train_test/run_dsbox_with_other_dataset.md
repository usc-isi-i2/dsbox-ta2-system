### Clone this repo

```
docker pull uscisii2/dsbox
```

### Build docker
```
docker build -t dsbox .
```

### Prepare a dataset similar to dsbox_rltk
#### Need to have TRAIN and TEST DIR, search_config.json and test_config.json
#### TRAIN and TEST have the same structure
```
./TRAIN
    ./dataset_TRAIN
        datasetDoc.json
        ./tables
            learningData.csv
    ./problem_TRAIN
        problemDoc.json
```

### Run search
```
docker run -v {local_disk}/{docker_disk} \
{docker image name} {path to dataset} {search} {timeout}
```
eg.
```
docker run -v /Users:/Users uscisii2/dsbox \
/Users/runqishao/Downloads/datasets_dsbox/seed_datasets_current/38_sick search 5
```
####
After search, there will be pipelines folder generated, which contains all valid pipelines.

### Run test
It will pick the best pipeline from the results in {path to dataset}/pipelines.
```
docker run -v {local_disk}/{docker_disk} \
{docker image name} {path to dataset} {test}
```

eg.
```
docker run -v /Users:/Users uscisii2/dsbox \
/Users/runqishao/Downloads/datasets_dsbox/seed_datasets_current/38_sick test
```
Prediction result is in /predictions folder.
