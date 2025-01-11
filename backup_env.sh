#!/bin/bash

pip freeze > requirements.txt
conda list --explicit > spec-file.txt
conda env export > environment.yml

