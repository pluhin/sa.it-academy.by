#!/bin/bash

echo "##############Start all push###############";

git push -f github && git push -f gitlab && git push bitbucket && echo "########finished push#########" && exit 0


