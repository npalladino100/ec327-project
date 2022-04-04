%%writefile make_conda_env.sh
#!/usr/bin/env bash
# reproducibly create conda env

echo "# BASH: conda env create
# source activate phd
name: "elpy"
dependencies:
- python=3 
- jupyter 
- notebook 
- numpy 
- rpy2
- pandas 
- scipy 
- numpy 
- scikit-learn 
- seaborn 
- pip:
  - plotly">environment.yml    
    
  #list name of packages
  conda env create
    else
        echo "installing base packages"
        conda create --name "elpy"\
        python=3 jupyter notebook numpy rpy2\
        pandas scipy numpy scikit-learn seaborn 
    fi
  echo "to exit: source deactivate"
fi
