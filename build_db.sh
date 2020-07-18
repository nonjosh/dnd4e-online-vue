docker build -t nonjosh/dnd4e-online-db \
  --build-arg USER_ID=$(id -u) \
  --build-arg GROUP_ID=$(id -g) \
  -f db/Dockerfile \
  .