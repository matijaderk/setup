# Define input and output file paths
input_file_path = 'input_file.txt'
output_file_path = 'output_file.txt'

# input file is generated with code --list-extensions command

def prepend_strings(input_file_path, output_file_path, prepend_text="code --install-extension"):
    # Open the input file in read mode and output file in write mode
    with open(input_file_path, 'r', encoding='utf-8') as input_file, open(output_file_path, 'w', encoding='utf-8') as output_file:
        # Iterate over each line in the input file
        for line in input_file:
            # Prepend the string and write to the output file
            output_file.write(f"{prepend_text} {line}")

# Call the function with your files
prepend_strings(input_file_path, output_file_path)
