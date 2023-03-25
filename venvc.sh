alias venvv='source .venv/bin/activate'

# Function for creating a python 3.7.0 venv
venvc () {
    if pyenv shell "${1:-3.9.12}" ; then
        # continue
        echo "Activated $1"
    else
        # try to install
        if pyenv install $1 ; then
            echo "Installed new version. Continuing..."
            pyenv shell $1
        else
            if pyenv install --list | grep $1 ; then
                echo "Something is completely broken... Failed to install, but should appear on list python install --list"
                return 1
            else
                # Install failed
                echo "Could not find requested version in pyenv install --list"
                return 1
            fi
        fi
    fi
    # Continue
    rm -rf .venv/
    python -m venv .venv
    pyenv shell --unset
}

