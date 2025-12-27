# Temporal Median Filter

An ImageJ/Fiji macro that reduces sparkle and hot pixel noise in time-lapse image stacks using a sliding temporal median filter.

## Description

This macro processes each frame of a time-lapse stack by computing the pixel-wise median across a 5-frame temporal window (current frame ± 2 frames). This effectively removes transient noise artifacts while preserving real signal that persists across multiple frames.

### Use Cases

- Removing cosmic ray hits from detector images
- Eliminating hot/dead pixel artifacts
- Reducing random speckle noise in fluorescence microscopy
- Cleaning up time-lapse data with intermittent noise

## Installation

### Fiji

1. Download `temporal_median.ijm`
2. Place it in your Fiji plugins folder:
   - **macOS**: `Fiji.app/plugins/`
   - **Windows**: `Fiji.app\plugins\`
   - **Linux**: `Fiji.app/plugins/`
3. Restart Fiji
4. The macro will appear under **Plugins** menu

### ImageJ

1. Download `temporal_median.ijm`
2. Place it in your ImageJ plugins folder:
   - **macOS**: `ImageJ/plugins/`
   - **Windows**: `ImageJ\plugins\`
   - **Linux**: `ImageJ/plugins/`
3. Restart ImageJ
4. The macro will appear under **Plugins** menu

### Running Without Installation

1. Open ImageJ/Fiji
2. Go to **Plugins > Macros > Run...**
3. Select `temporal_median.ijm`

## Usage

1. Open your time-lapse stack in ImageJ/Fiji
2. Run the macro
3. A new stack named `Filtered_<original name>` will be created with the filtered result

## Notes

- The macro automatically handles edge frames by using smaller windows at the beginning and end of the stack
- The original stack is preserved; filtering is applied to a new copy
- Processing time scales linearly with the number of frames
