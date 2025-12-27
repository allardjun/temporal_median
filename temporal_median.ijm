// Temporal Median Filter (window size 5: current frame ± 2)
// Reduces sparkle/hot pixel noise in time-lapse data

original = getTitle();
n = nSlices;
w = getWidth();
h = getHeight();
bits = bitDepth();

// Create output stack
newImage("Filtered_" + original, bits + "-bit black", w, h, n);
filtered = getTitle();

for (t = 1; t <= n; t++) {
    showProgress(t, n);
    
    // Determine window bounds (handles edges)
    start = maxOf(1, t - 2);
    end = minOf(n, t + 2);
    
    // Extract temporal window as a substack
    selectWindow(original);
    run("Make Substack...", "slices=" + start + "-" + end);
    tempStack = getTitle();
    
    // Project using median
    run("Z Project...", "projection=Median");
    medianImage = getTitle();
    
    // Copy result to output stack
    run("Select All");
    run("Copy");
    close();  // close median image
    selectWindow(tempStack);
    close();  // close temp substack
    
    selectWindow(filtered);
    setSlice(t);
    run("Paste");
}

run("Select None");
showStatus("Temporal median filtering complete!");