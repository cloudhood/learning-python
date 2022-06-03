#!/bin/bash

function init_venv {
    conda deactivate    # activated by default in Sagemaker Studio Lab
    python3 -m venv $1
    # echo "Appending path to venv to .bashrc..."
    # echo "source $1/bin/activate" >> $HOME/.bashrc
    
    echo "Appending to .gitignore..."
    echo "source $1/bin/activate" >> .gitignore
    
    echo "Activating venv..."
    source $1/bin/activate
}

function init_conda {
    conda create --name $1 --file requirements.txt
    conda activate $1
    # conda update -n base conda
    # Edit $HOME/.bashrc as appropriate
}

function install_pip {
    pip install --upgrade pip
    pip install -r requirements.txt
}

function install_kernel {
    # python3 -m ipykernel install --user  --name $1
    ipython kernel install --user --name=$1
}

function add_ll {
    echo "Appending ll to .bashrc..."
    echo "#Alias for listing directory" >> $HOME/.bashrc
    echo "alias ll='ls -alF --color=auto'" >> $HOME/.bashrc
    echo "" >> $HOME/.bashrc
    source $HOME/.bashrc
}
