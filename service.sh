#!/system/bin/sh
# Get the directory where the script is located
MODDIR=${0%/*}
# Extract module ID from the folder name
MODID=$(basename "$MODDIR")

# Define paths
LOG_DIR="/data/adb/modules/$MODID/logs"
LOG_FILE="$LOG_DIR/service.log"
TARGET_PATH="/product/app/MSA-Global"

# Create logs directory if not exists
mkdir -p "$LOG_DIR"

# Logging function
log_info() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - [INFO] - $1" >> "$LOG_FILE"
}

log_error() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - [ERROR] - $1" >> "$LOG_FILE"
}

log_info "Service initialization started."

# Stop the MSA process to prevent background activity
am force-stop com.miui.msa.global
log_info "Command 'force-stop' sent to com.miui.msa.global"

# Apply Overlay via tmpfs mount
if [ -d "$TARGET_PATH" ]; then
  if mount -t tmpfs tmpfs "$TARGET_PATH"; then
    log_info "Success: $TARGET_PATH has been masked with tmpfs."
  else
    log_error "Failed to mount tmpfs over $TARGET_PATH."
  fi
else
  log_error "Target directory $TARGET_PATH does not exist."
fi

log_info "Service execution finished."
