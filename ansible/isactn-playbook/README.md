## Installation
Ansible  
```sudo python -m pip install ansible```

Paramiko (For Ansible)  
```sudo python -m pip install paramiko```

Molecule  
```sudo python -m pip install "molecule[docker,lint]"```

Shell Completion
python -m pip install argcomplete

sudo activate-global-python-argcomplete


## Using Molecule 
### Creating a new Role
From inside the roles directory

```
molecule init role certificate-authority --driver-name docker
```

Then copy an existing config  

## Molecule Cheat Sheet
https://molecule.readthedocs.io
- molecule create
- molecule converge
- molecule login
- molecule destroy
## Misc
Default Password is password


Terraform commands to know  
- terraform init (need to do this 1st)
- terraform plan (dry run - verify)
- terraform apply (run)
- terraform destroy



## Playbooks
Running  
```ansible-playbook -i inventories/low/hosts.yml code-repo-playbook.yml```

Running if you don't have automatic vault password setup
```ansible-playbook -i inventories/low/hosts.yml code-repo-playbook.yml --ask-vault-pass```


### Setup auto vault passwd
1. Create file ~/.ansible-pass (Should be a single line with the password)
2. Export an env var in .bashrc like "ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible/ansible-pass"

# TODOs
- use vault for root pass