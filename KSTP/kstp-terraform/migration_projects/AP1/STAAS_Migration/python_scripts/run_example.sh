
#values for 1st run 
#XLS="DfwToExcel-2022-03-07_21-11_V1_STaas.xlsx"  # 1st run 
#STAGE="1"

# values for 2nd run 
XLS="DfwToExcel-2022-03-07_21-11_V2_STaas.xlsx"   # 2nd run 
STAGE="2"

PWD="$PWD"
python3 parse_Dfw_exel.py -f \
"$PWD/../input_xlsx_files/$XLS" -t $STAGE -m \
"$PWD/../input_xlsx_files/Mapping_Services.json" -s staas