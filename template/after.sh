# Wait for the SMRTLink Server server to start
echo "Waiting for SMRTLink Server server to open port ${port}..."
echo "TIMING - Starting wait at: $(date)"
if wait_until_port_used "${host}:${port}" 720; then
  echo "Discovered SMRTLink Server server listening on port ${port}!"
  echo "TIMING - Wait ended at: $(date)"
else
  echo "Timed out waiting for SMRTLink Server server to open port ${port}!"
  echo "TIMING - Wait ended at: $(date)"
  pkill -P ${SCRIPT_PID}
  clean_up 1
fi
sleep 2
