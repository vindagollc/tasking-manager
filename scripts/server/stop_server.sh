echo "Stopping Frontend"

# Run the `sudo lsof -i :3000` command and capture the output
frontend_output=$(sudo lsof -i :3000)

# Get all pids
frontend_pids=($(echo "$frontend_output" | awk 'NR>1{print $2}'))

#Kill all pids of port 3000
for pid in "${frontend_pids[@]}"; do
  kill -9 $pid
done

echo "Stopping Backend"

# Run the `sudo lsof -i :5000` command and capture the output
backend_output=$(sudo lsof -i :5000)

# Get the first item from the output and extract the PID using awk
backend_pids=($(echo "$backend_output" | awk 'NR>1{print $2}'))

#Kill all pids of port 3000
for pid in "${backend_pids[@]}"; do
  kill -9 $pid
done                     