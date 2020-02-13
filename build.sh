#!/bin/bash

cd $(dirname $0)

# Build

if [ ! -d venv ]; then
    virtualenv venv
fi

. venv/bin/activate

# python -m pip install --upgrade pip
pip install -q -r requirements.txt
build/make_templates.py

deactivate

