#!/bin/bash

cd $(dirname $0)

# Build

pip install -q -r requirements.txt

if [ ! -d venv ]; then
    virtualenv venv
fi

. venv/bin/activate

pip install boto

python build/make_templates.py

deactivate

