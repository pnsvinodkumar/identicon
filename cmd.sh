#!/bin/bash

set -e

if [ "$ENV" = 'DEV' ]; then
    echo "Running Development Server"
    exec python "identicon.py"
elif [ "$ENV" = 'UNIT' ]; then
    echo "Running Unit Tests"
    exec python "tests.py"
else
    echo "Running Production Server"
    export http_proxy=
    export https_proxy=
    export ftp_proxy=
    export socks_proxy=
    export no_proxy=
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identicon.py --callable app --stats 0.0.0.0:9191
fi
