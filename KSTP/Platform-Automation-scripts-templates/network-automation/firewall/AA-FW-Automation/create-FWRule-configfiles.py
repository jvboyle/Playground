# Takes a file CSV file called "data.csv" and outputs each row as a numbered YAML file.
# Data in the first row of the CSV is assumed to be the column heading.

# Import the python library for parsing CSV files.
import csv
import os
import sys
import openpyxl
import csv

if len(sys.argv) <= 1:
	print "USAGE: create-segment-configfiles.py <Excel spreadsheet path and filename> <DRES Number>"
	sys.exit()

#
wb = openpyxl.load_workbook(sys.argv[1])
sh = wb.get_sheet_by_name('FWRules')
with open('temporary.csv', 'wb') as f:  # open('test.csv', 'w', newline="") for python 3
    c = csv.writer(f,delimiter='\t')
    for r in sh.rows:
        c.writerow([cell.value.encode('utf-8') for cell in r])

dres_number = sys.argv[2]

# Open our data file in read-mode.
csvfile = open('temporary.csv', 'r')

# Save a CSV Reader object.
datareader = csv.reader(csvfile, delimiter='\t', quotechar='"')

# Empty array for data headings, which we will fill with the first row from our CSV.
data_headings = []

path="../../network-config/VM-FW-Rules/DRES"
try:
    os.mkdir(path+str(dres_number))
except OSError:
    print ("Creation of the directory %s failed." % path)
else:
    print ("Successfully created the directory %s " % path)

# Loop through each row...
for row_index, row in enumerate(datareader):

	## Skip the first 9 rows... it's descriptive text
	#if row_index < 9:
	#	continue

	# If this is the first row, populate our data_headings variable.
	if row_index == 0:
		data_headings = row

	# Othrwise, create a YAML file from the data in this row...
	else:

		# Empty string that we will fill with YAML formatted text based on data extracted from our CSV.
		yaml_text = ""

		# Loop through each cell in this row...
		for cell_index, cell in enumerate(row):

			# Compile a line of YAML text from our headings list and the text of the current cell, followed by a linebreak.
			# Heading text is converted to lowercase. Spaces are converted to underscores and hyphens are removed.
			# In the cell text, line endings are replaced with commas.
			cell_heading = data_headings[cell_index].lower().replace(" ", "_").replace("-", "")
			cell_contents = cell.strip()
			cell_contents = cell.replace("\n", "")
			cell_contents = cell.replace("\t", "")
			cell_contents = cell.replace("xx", dres_number)
			cell_text = cell_heading + ": " + cell_contents + "\n"
			# cell_text = cell_heading + ": " + cell.replace("\n", ", ") + "\n"

			# Add this line of text to the current YAML string.
			yaml_text += cell_text

		# Write our YAML string to the new text file and close it.
		# Open a new file with filename based on index number of our current row.
		filename = "../../network-config/VM-FW-Rules/DRES"+str(dres_number)+"/"+"DRES"+str(dres_number)+"-"+str(row_index) + '-fwrules.yml'
		new_yaml = open(filename, 'w')
		new_yaml.write(yaml_text)
		new_yaml.close()

# We're done! Close the CSV file.
csvfile.close()
