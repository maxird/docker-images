#!/bin/bash

cat > /app/_generated.sh <<EOF
$1 $2 "$3"
EOF

chmod +x /app/_generated.sh
/app/_generated.sh
