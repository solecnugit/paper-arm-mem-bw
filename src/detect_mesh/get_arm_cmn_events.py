import os
import pandas as pd

def get_text_files_content(directory_path) -> pd.DataFrame:
    file_names = []
    file_contents = []

    # Traverse the directory to find all text files
    for root, dirs, files in os.walk(directory_path):
        for file in files:
            file_path = os.path.join(root, file)
            with open(file_path, 'r') as f:
                content = f.read().strip()
            file_names.append(file)
            file_contents.append(content)

    # Create a DataFrame with file names and their content
    events = pd.DataFrame({
        'event_name': file_names,
        'encoding': file_contents
    })
    
    return events

# Example usage
directory_path = '/sys/devices/arm_cmn_0/events'  # Replace with the specific directory path
arm_cmn_events = get_text_files_content(directory_path).sort_values(by='event_name').reset_index(drop=True)

print(arm_cmn_events)

# Output the DataFrame as a CSV file
output_csv_path = os.path.join(os.getcwd(), 'arm_cmn_events.csv')
arm_cmn_events.to_csv(output_csv_path, index=False)

print(f'CSV file has been created at: {output_csv_path}')