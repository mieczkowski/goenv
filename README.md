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

# Usage

# TODO

- Checking for new version
- Support for other types of languages
- Dynamic support of multiple workspaces
