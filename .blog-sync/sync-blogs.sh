#!/bin/bash
# Bidirectional blog sync script
# Syncs between Obsidian and Website repo - newer file wins

set -e

OBSIDIAN_DIR="/Users/gaurangmathur/Gaurang/Digital Garden/annotation-notes/PaperNotes/07 - Blogs"
WEBSITE_DIR="/Users/gaurangmathur/Gaurang/Code/_llm_os/mathur-exe.github.io/src/content/blog"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/logs/blog-sync.log"

# Ensure directories exist
mkdir -p "$OBSIDIAN_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "=== Starting blog sync ==="

# Sync Obsidian → Website (only newer files)
log "Syncing Obsidian → Website..."
rsync -av --update --itemize-changes "$OBSIDIAN_DIR/" "$WEBSITE_DIR/" 2>&1 | tee -a "$LOG_FILE"

# Sync Website → Obsidian (only newer files)
log "Syncing Website → Obsidian..."
rsync -av --update --itemize-changes "$WEBSITE_DIR/" "$OBSIDIAN_DIR/" 2>&1 | tee -a "$LOG_FILE"

# Stage changes in website repo if we're not already in it
if [[ "$(pwd)" != *"mathur-exe.github.io"* ]]; then
    log "Staging changes in website repo..."
    cd "$WEBSITE_DIR" && git add . 2>/dev/null || true
fi

# Stage changes in obsidian repo if we're not already in it
if [[ "$(pwd)" != *"annotation-notes"* ]]; then
    log "Staging changes in obsidian repo..."
    cd "$OBSIDIAN_DIR" && git add . 2>/dev/null || true
fi

log "=== Sync complete ==="
