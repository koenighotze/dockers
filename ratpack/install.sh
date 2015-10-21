#!/bin/bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install lazybones

lazybones create ratpack ratpack-init-project && cd ratpack-init-project 
