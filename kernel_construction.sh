virtualenv -p python3 kaggleVenv
source kaggleVenv/bin/activate
pip3 install -r pip_requirements
python3 -m ipykernel install --user --name=kaggleVenv
