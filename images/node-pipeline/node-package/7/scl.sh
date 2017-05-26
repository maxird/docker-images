#!/bin/bash

cat > /app/_generated.sh <<EOF
#!/bin/bash
exec "${@}"
EOF

chmod +x /app/_generated.sh

cat /app/_generated.sh

echo 'entering scl devtoolset-3...'
scl enable devtoolset-3 /app/_generated.sh
