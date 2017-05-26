#!/bin/bash

echo "$#:[$@]"

cat > /app/_generated.sh <<EOF
$1 "$2" \"$3\"
EOF

chmod +x /app/_generated.sh

cat /app/_generated.sh

echo 'entering scl devtoolset-3...'
scl enable devtoolset-3 /app/_generated.sh
