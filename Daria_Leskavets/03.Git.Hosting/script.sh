#!/bin/bash

 for i in $(git remote) ; do git push $i $(git branch --show-current) ; done
