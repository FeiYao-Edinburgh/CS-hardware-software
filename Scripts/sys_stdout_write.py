import time,sys
for i in range(1,100,1):
    sys.stdout.write("\r{0}{1:.2f}%".format("|"*i,i))
    # Or simply use sys.stdout.write(f"\r{i*'|'}{i:0.2f}%") for the above.
    # '\r' will send the cursor to the beginning of the line, where it can overwrite the existing text, which also means the later text should have more characters than the former ones otherwise unwanted overlap will emerge.
    sys.stdout.flush() # For better effect.
    time.sleep(0.01)