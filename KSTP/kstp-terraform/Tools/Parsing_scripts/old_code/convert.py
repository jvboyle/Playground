from datetime import datetime

# Convert milleseconds to seconds
timestamp = 1679331746506 / 1000 
dt = datetime.fromtimestamp(timestamp)
# Format the date
converted_time = dt.strftime('%Y-%m-%d %H:%M:%S')
print(converted_time)
