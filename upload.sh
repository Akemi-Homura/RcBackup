#!/bin/bash

# upload
cmmsg="backup config files "
git add .
git commit -a -m "$cmmsg" > /dev/null >> /dev/null
git push > /dev/null >> /dev/null
