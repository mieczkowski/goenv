# Introduction
Goenv is project (directory) manager, with Golang and Python support. It is a combination of features from tools like: direnv, gvm, pyenv, etc.

Example usage:
```bash
$ goenv create my_project
Directory /home/mieczkowski/projects/my_project created
```

```bash
(my_project) $ pwd
/home/mieczkowski/projects/my_project
```

```bash
(my_project) $ goenv init --golang
Downloading golang (1.10) ...
--2018-02-20 15:46:15--  https://golang.org/dl/go1.10.linux-amd64.tar.gz
Resolving golang.org (golang.org)... 216.58.215.113, 2a00:1450:401b:807::2011
Connecting to golang.org (golang.org)|216.58.215.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://dl.google.com/go/go1.10.linux-amd64.tar.gz [following]
--2018-02-20 15:46:15--  https://dl.google.com/go/go1.10.linux-amd64.tar.gz
Resolving dl.google.com (dl.google.com)... 216.58.215.78, 2a00:1450:401b:806::200e
Connecting to dl.google.com (dl.google.com)|216.58.215.78|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 119905205 (114M) [application/octet-stream]
Saving to: ‘/tmp/go-1.10.tar.gz’

/tmp/go-1.10.tar.gz                                                  100%[===================================================================================================================================================================>] 114,35M  28,9MB/s    in 4,2s    

2018-02-20 15:46:20 (27,3 MB/s) - ‘/tmp/go-1.10.tar.gz’ saved [119905205/119905205]

Unpacking archive to /home/mieczkowski/.goenv/go/1.10 ...
```

```bash
(my_project Go:1.10) $ echo $GOPATH
/home/mieczkowski/projects/my_project
```

```bash
(my_project Go:1.10) $ goenv golang init mieczkowski/goenv
git clone https://github.com/mieczkowski/goenv.git src/github.com/mieczkowski/goenv
Cloning into '/home/mieczkowski/projects/my_project/src/github.com/mieczkowski/goenv'...
remote: Counting objects: 49, done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 49 (delta 5), reused 10 (delta 3), pack-reused 35
Receiving objects: 100% (49/49), 42.08 KiB | 0 bytes/s, done.
Resolving deltas: 100% (19/19), done.
Checking connectivity... done.
```

```bash
(my_project Go:1.10) $ pwd
/home/mieczkowski/projects/my_project/src/github.com/mieczkowski/goenv
```

```bash
(my_project Go:1.10) $ goenv ls
Project list:
    my_project                      (Go: 1.10 Dir: github.com/mieczkowski/goenv)
    prometheus_client               (Go: 1.9.4 Dir: github.com/prometheus/client_golang)
    python                          (Python: 3.5.2)

(my_project Go:1.10) $ goenv use prometheus_client
(prometheus_client Go:1.9.4) $ pwd
/home/mieczkowski/projects/prometheus_client/src/github.com/prometheus/client_golang
```


# Installation

## Installation and configuration

1. Clone repository to some directory:

```bash
git clone git@github.com:mieczkowski/goenv.git ~/goenv
```

2. Add alias to `~/.bashrc` - script must have access to your shell, so '.' dot as prefix is important!

```bash
echo "alias goenv=\". /home/YOU/goenv/goenv\"" >> ~/.bashrc
```

3. Configure workspace directory (for example: in `~/.bashrc`):

```bash
echo "export GOENV_WORKSPACE=/home/YOU/my_projects" >> ~/.bashrc
```

4. Add autocomplete:

```bash
echo "source /home/YOU/goenv/goenv_autocomplete.sh" >> ~/.bashrc
```

## Custom PS1 prompt

Goenv by default try to add prefix with project name and optional: go version & python version.

You can disable this feature by setting environment variable:

```bash
echo "export GOENV_DISABLE_PS1=\"1\"" >> ~/.bashrc
```

You can use following environment variables to build your own goenv prompt:

```bash
$GOENV_PROJECT         project name
$GOENV_GO_VERSION      golang version (if used in project)
$GOENV_PYTHON_VERSION  python version (if used in project)
```

Example part of `PROMPT_COMMAND` usage (more advanced example in file: `.bashrc_prompt`)

```bash
set_prompt(){
    PS1=""
    if [[ ! -z "$GOENV_PROJECT" ]]; then
        PS1+="($GOENV_PROJECT"
        if [[ ! -z "$GOENV_GO_VERSION" ]]; then
            PS1+=" Go:$GOENV_GO_VERSION"
        fi
        if [[ ! -z "$GOENV_PYTHON_VERSION" ]]; then
            PS1+=" Py:$GOENV_PYTHON_VERSION"
        fi
        PS1+=") "
    fi
    PS1+="(\d \t) (\u@\h:\w) "
}
PROMPT_COMMAND='set_prompt'
```

# Usage

```bash
create [project_name] {params} create new project and (optional) init lang support:
                                --golang[=version]  fetch/use go (default: latest stable)
                                --python[=version]  create virtualenv with specific python version (default: 3)
                                --force             for recreate existing python virtualenv

use [project_name]             activate project (activate virtualenv and/or set environment variables)

set {options}                  set various settings for project:
                                --directory[=relative/path/to/dir]  default directory to enter after activation (empty to clear) 
                                    example: --directory="src/github.com/mieczkowski/goenv")

init {init_params}             add lang support in project, or change version (params from create command)
exit                           deactivate project

ls                             list projects
rename [source] [destination]  rename project
rm [project_name]              deactivate project and remove it

golang                         tools for golang (list available Go versions, install common software)
                                list          list available golang versions (can be used with --golang in create/init command)
                                init [param]  clone/fetch repository and put it to right directory. Param can be in one of three formats:
                                    https://github.com/mieczkowski/goenv.git - git clone with http
                                    git@github.com:mieczkowski/goenv.git     - git clone with ssh
                                    mieczkowski/goenv                        - clone from github (http by default, --ssh to force ssh)
                                

version                        print the goenv version number
help                           print extended help help
```

# TODO

- Checking for new version
- Support for other types of languages
- Dynamic support of multiple workspaces
