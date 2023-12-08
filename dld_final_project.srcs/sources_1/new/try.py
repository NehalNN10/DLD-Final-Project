# Open the file in read mode
with open('coll.txt', 'r') as file:
    lines = file.readlines()

# Initialize a list to store the extracted information
extracted_data = []

# Flag to check for the starting of the block
block_started = False

# Iterate through the lines of the file
for line in lines:
    # Check for the start of a block
    if line.startswith('//'):
        block_started = True
        continue

    # Check if block has started
    if block_started:
        # Extract information every 3 lines (skip single line comments)
        if not line.startswith('//'):
            extracted_data.append(line.strip())
            # Extract every 3rd line
            if len(extracted_data) % 3 == 0:
                print(
                    extracted_data
                )  # Modify this line to process or store the extracted data
                print('******************************************')
                r_data = []
                for e in extracted_data:
                    if e != '':
                        r_data.append(e)
                extracted_data = []  # Reset for next set of 3 lines
                print(r_data)
