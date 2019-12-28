#!/bin/bash

echo"Start all push"
git push -f github && git push -f gitlab && git push bitbucket && exit 0


