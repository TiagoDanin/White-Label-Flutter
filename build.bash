#!/bin/bash

echo "🚀 Starting parallel builds..."

# Capture the start time
start_time=$(date +%s)

# Start the three builds simultaneously and capture the PIDs correctly
echo "📱 Starting build for appA..."
flutter build apk -t "./lib/configs/apps/variant_a/loaded.dart" --flavor appA 2>&1 | tee logs/log_appA.txt &
pid1=$!

echo "📱 Starting build for appB..."
flutter build apk -t "./lib/configs/apps/variant_b/loaded.dart" --flavor appB 2>&1 | tee logs/log_appB.txt &
pid2=$!

echo "📱 Starting build for appC..."
flutter build apk -t "./lib/configs/apps/variant_c/loaded.dart" --flavor appC 2>&1 | tee logs/log_appC.txt &
pid3=$!

echo "⏳ Waiting for builds to complete..."
echo "Running PIDs: $pid1 $pid2 $pid3"

# Wait for all processes to finish
wait $pid1 $pid2 $pid3

# Capture the end time
end_time=$(date +%s)

# Calculate the duration
duration=$((end_time - start_time))
minutes=$((duration / 60))
seconds=$((duration % 60))

# Check the status of each build
for flavor in "appA" "appB" "appC"; do
    if grep -q "✓ Built" "logs/log_$flavor.txt"; then
        echo "✅ Build for $flavor completed successfully!"
    else
        echo "❌ Build for $flavor failed. Check logs/log_$flavor.txt for details."
    fi
done

echo "🏁 Process completed in ${minutes}m:${seconds}s!"

# Clean up temporary log files
read -p "Do you want to keep the log files? (y/N): " keep_logs
if [[ $keep_logs != "y" && $keep_logs != "Y" ]]; then
    rm -f logs/log_app*.txt
    echo "🗑️ Logs removed"
fi