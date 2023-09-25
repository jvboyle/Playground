#!/bin/sh
########################################################################
#
# HCL Remediation script for Linux ITSSCSD policy
#
# LICENSED MATERIALS / PROPERTY OF IBM
# (c) Copyright IBM 2015.  All Rights Reserved.
# The source code for this program is not published or otherwise divested of
# its trade secrets, irrespective of what has been deposited with the U.S.
# Copyright Office.
# US Government Users Restricted Rights - Use, duplication or disclosure
# restricted by GSA ADP Schedule Contract with IBM Corp.
#
########################################################################
# Last updated: Mar 27, 2019
########################################################################
#
#--------------------------------------------------------------
check_if_first_log_file_record_is_older_than_min_retention_time()
{
    file_name=$1

	# Read the file, find the first record and check its POSIX timestamp.
	while read -r line
	do
		if echo -e $line | grep "RECORD_START" 2>&1 1>/dev/null
		then
			# Found RECORD_START on this line; check the time stamp
			posix_time_stamp=`echo -e $line | awk '{print $3'}`
			if [ $posix_time_stamp -gt $LogRecordsMinTimeStampSeconds ]
			then
				# The first record (which is the oldest in the file) is younger then the minimum retention period.
				return 1
			else
			    # First record is older than retention period
			    return 0
			fi
		fi
	done < $file_name

}

#--------------------------------------------------------------
delete_first_log_file_record_if_older_than_min_retention_time()
# $1: LogFileName
# LogRecordsMinTimeStampSeconds: if log records are more recent than that, they cannot be deleted.
# Format of RECORD_START line:
#    RECORD_START <POSIX time stamp>
{

    file_name=$1

	check_if_first_log_file_record_is_older_than_min_retention_time $file_name
	result=$?
	if [ $result -eq 1 ]
	then
	    # First (oldest) record is younger than minimum retention period; cannot delete.
		return 1
	fi
	
    # Can delete the first record.
	in_record_to_delete=1
	
	# Remove any leftover temporary old file
	rm -f $file_name.old 2> /dev/null

    input_file=$file_name.old
	mv $file_name $input_file
	output_file=$file_name
	touch $output_file

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	first_line=1
	while read -r line
	do
	    if [ $in_record_to_delete -eq 1 ]
		then
		    # We are in the record to delete (the first one); just skip it (do not copy it to output file)
			# Check for end of record.
		    if echo -e $line | grep "RECORD_END" 2>&1 1>/dev/null
			then
			    # Got to the end of the first record.
				in_record_to_delete=0
			fi
		else
		    # We already skipped the first record; copy the rest of the file.
			# NOTE: -E is important to avoid losing "\" characters on the line
			if [ $first_line -eq 1 ]
			then
				echo -E $line > $output_file
				first_line=0
			else
				echo -E $line >> $output_file
			fi
		fi
	done < $input_file
	
	# Done. Keep just the new (ouput) file
	rm -f $input_file 2> /dev/null

	IFS=$old_IFS

	return 0
}

#--------------------------------------------------------------
check_log_file_num_of_entries()
# $1: LogFileName
# LogFileMaxRecords: maximum number of log records to retain in a log file
{

    LogFileName=$1
	
    # Count the number of entries in the log file
	num_of_log_entries=`grep "RECORD_START" $LogFileName | wc -l | awk '{print $1}'`
	echo "<<<<<<<<< num_of_log_entries = $num_of_log_entries >>>>>>>>>"
	if [ $num_of_log_entries -eq $LogFileMaxRecords ]
	then
	    # This log file has reached the maximum number or records. Delete the first one if it is older than
		# the minimum retention period.
	    echo "<<<<<<<<< deleting first record from $LogFileName if older than retention period >>>>>>>>>"
		delete_first_log_file_record_if_older_than_min_retention_time $LogFileName
	fi
	
	return
}

#--------------------------------------------------------------
check_log_file_max_size()
# $1: LogFileName
# LogFileMaxSize: maximum size of log file in bytes
{

    LogFileName=$1
	
	log_file_size=`ls -l $LogFileName | awk '{print $5}'`
	echo "<<<<<<<<< log_file_size = $log_file_size >>>>>>>>>"
	if [ $log_file_size -gt $LogFileMaxSize ]
	then
	    # This log file has reached the maximum number or records. Delete the first one if it is older than
		# the minimum retention period.
	    echo "<<<<<<<<< deleting first record from $LogFileName if older than retention period >>>>>>>>>"
		delete_first_log_file_record_if_older_than_min_retention_time $LogFileName
	fi
	
	return
}


#--------------------------------------------------------------
# Create the remediation log file if it does not already exist.
# $1: rule_ID ("rule_x")
create_log_file()
{
	rule_number=$1
	# If the rule number contains "itsscsd" in it, strip it. We will put the policy type in the rule number in UPPER case to
	# facilitate differentiating.
	# <<< iciici TO IMPLEMENT if no impact on HCLauncher reporting
	# rule_number=`echo $rule_number | sed s/"itsscsd_"//g`
	# if [ $IsITCS104 -eq 1 ]
	# then
	# 	rule_number="_ITCS104$rule_number"
	# else
	# 	rule_number="_ITSSCSD$rule_number"
	# fi
	
	strFolder="/var/Remediation_log"
	if [ ! -d $strFolder ]
	then
		# must create the folder
		mkdir $strFolder
	fi

	LogFileNamePrefix="$strFolder/$ScriptName"
	LogFileName="$LogFileNamePrefix$rule_number.log"

	if [ ! -e $LogFileName ]
	then
		# Log file does not exist. Create it.
		time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
		message="$time_stamp: Creating log file $LogFileName"
		echo $message > $LogFileName	
	else
	    if [ $ActivateLogFileSizeControl -eq 1 ]
		then
			# Log file exists; check if we must purge the oldest record based on retention parameters.
			check_log_file_num_of_entries $LogFileName
			check_log_file_max_size $LogFileName
		fi
	fi
	
	return
}

#-------------------------------------------------------------------------------
# Log a message in the log file
# Arguments:
# $1: message string
log_message()
{
    message=$1
    datestr=`date "+%Y-%m-%d-%Hh%Mm%S"`
    echo "$datestr: $message" >> $LogFileName

    if [ $Verbose -gt 0 ]
    then
	    echo $message
    fi
}

#-------------------------------------------------------------------------------
# Log a message in the log file putting the string in double-quotes to avoid substitution
# of characters such as '*'
# Arguments:
# $1: message string
log_message_keep_special_chars()
{
    message=$1
    datestr=`date "+%Y-%m-%d-%Hh%Mm%S"`
    echo "$datestr: $message" >> $LogFileName

    if [ $Verbose -gt 0 ]
    then
	    echo "$message"
    fi
}

#-------------------------------------------------------------------------------
# Return 0 if file is a directory
check_if_file_is_a_directory()
{
	file_name=$1
	if [ -d $file_name ]
	then
		result=0
	else
		result=1
	fi
		
	return $result
}

#-------------------------------------------------------------------------------
activate_new_file()
# $1: new file to activate
# $2: old file being replaced by new file
# $3: backup file of old file in case error occurs
{
    new_file="$1"
    old_file="$2"
    backup_file="$3"

	rm -f $old_file
	mv $new_file $old_file
	result=$?
	if [ $result -eq 0 ]
	then
		rm -f $backup_file
		return 0
	else
		log_message "Failed to activate the modified $old_file. Restoring the original file."
		mv $backup_file $old_file
		return 1
	fi

}

#-------------------------------------------------------------------------------
# Replace a line in a file based on a specified keyword
# Arguments:
# $1: file path and name
# $2: keyword to look for in the file
# $3: new value to write following the keyword
# IMPORTANT: this function assumes that the line has the following format (value to replace is the second substring):
#    "keyword value"
#   where white space could be a tab character
replace_value_in_file_based_on_keyword()
{
    file_name=$1
	keyword=$2
	new_value=$3
	
    # Backup the original file
	time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
	backup_file_name="$file_name.backup.$time_stamp"
	cp -pf $file_name $backup_file_name 2>/dev/null
	result=$?
	if [ $result -ne 0 ]
	then
	    log_message "Failed to backup the file $file_name. Error = $result."
	    return $result
	fi

	input_file=$file_name
	output_file=$file_name.tmp.$time_stamp

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	first_line=1
	number_of_lines_changed=0
	while read -r line
	do
		if echo -e $line | grep "$keyword" | grep -v "#" 2>&1 1>/dev/null
		then
			# Found the keyword on this line
			old_value=`echo "$line" | awk '{ print $2 }'`
			if [ $old_value == $new_value ]
			then
				# Old value is the same as the new one, just output the line to the file
				log_message "The current occurrence of the keyword has the same value as the requested one ($new_value). Just saving the line to the file."
				if [ $first_line -eq 1 ]
				then
					echo -E $line > $output_file
					first_line=0
				else
					echo -E $line >> $output_file
				fi
			else
				# Substitute the old value for the new value
				new_line=`echo $line | sed s,$old_value,$new_value,g`
				
				if [ $first_line -eq 1 ]
				then
					echo -e "$new_line"  > $output_file
					first_line=0
				else
					echo -e "$new_line"  >> $output_file
				fi
				number_of_lines_changed=`expr $number_of_lines_changed + 1`
			fi
		else
		    # Keyword not found on this line; write line to file
			if [ $first_line -eq 1 ]
			then
				# NOTE: -E is important to avoid losing "\" characters on the line
				echo -E $line > $output_file
				first_line=0
			else
				echo -E $line >> $output_file
			fi
		fi
	done < $input_file

	IFS=$old_IFS

    # If no line was changed, cleanup and return success
	if [ $number_of_lines_changed -eq 0 ]
	then
		rm -f $output_file
		rm -f $backup_file_name
		return 0
	fi
	
	# Check the number of lines changed. For each line changed (in case of multiple occurences),
	# the output of the diff command should give 4 lines of text per line changed, like, for instance
	# if only one line changed:
	# 25c25
	# < PASS_MAX_DAYS 99999
	# ---
	# > PASS_MAX_DAYS 88888
	expected_diff_output_lines=`expr $number_of_lines_changed \* 4`
	num_of_diff_output_lines=`diff $input_file $output_file | wc -l`
	if [ $num_of_diff_output_lines -eq $expected_diff_output_lines ]
	then
		log_message "Activating the modified $input_file."
		activate_new_file $output_file $input_file $backup_file_name
		result=$?
		return $result
	else
		log_message "Failed to replace the line with keyword $keyword in the file $file_name. Restoring the original file $file_name."
		rm -f $input_file
		mv $backup_file_name $input_file
		return 1
	fi

    return 0
}

#-------------------------------------------------------------------------------
# Replace a line in a file based on a set of 2 or 3 specified keywords
# Arguments:
# $1: file path and name
# $2: number of keywords: 2 or 3
# $3 - $3 or $4: keywords to look for in the file
# $GlobalStringArgument: new line to replace the old line
# NOTE: we replace only the first line found with a match if there is more than one match.
# NOTE 2: for the third keyword, which is expected to be a file name, we use grep for the test
#         and not absolute match, because of optional file path in the keyword in the file.
find_and_replace_stanza_line_in_file_based_on_keywords()
{
    file_name=$1
	num_of_keywords=$2
	keyword1=$3
	keyword2=$4
	if [ $num_of_keywords -gt 2 ]
	then
	    keyword3=$5
	else
	    keyword3=""
	fi
	
	new_line="$GlobalStringArgument"
	
    # Backup the original file
	time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
	backup_file_name="$file_name.backup.$time_stamp"
	cp -pf $file_name $backup_file_name 2>/dev/null
	result=$?
	if [ $result -ne 0 ]
	then
	    log_message "Failed to backup the file $file_name. Error = $result."
	    return $result
	fi

	input_file=$file_name
	output_file=$file_name.tmp.$time_stamp

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	first_line=1
	found_line=0
	while read -r line
	do
		if [ $found_line -eq 0 ]
		then
			word1=`echo "$line" | awk '{ print $1 }'`
			word2=`echo "$line" | awk '{ print $2 }'`
			if [ $num_of_keywords -gt 2 ]
			then
				word3=`echo "$line" | awk '{ print $3 }'`
				# keyword3 might not be an absolute match because of an optional path in the keyword; use grep
				if echo -e $word3 | grep "$keyword3" 2>&1 1>/dev/null
				then
					word3=$keyword3
				else
					if echo -e $keyword3 | grep "$word3" 2>&1 1>/dev/null
					then
						word3=$keyword3
					fi
				fi
			else
				word3=$keyword3
			fi
			if [ "$word1" = "$keyword1" -a "$word2" = "$keyword2" -a "$word3" = "$keyword3" ]
			then
				# Found the line to replace; write the new line to the file
	            #log_message "Found line in file $file_name matching the keywords $keyword1 $keyword2 $keyword3"
	            log_message "Line found: $line"
				log_message "Replacing this line with the following:"
				log_message "$new_line"
				found_line=1
				if [ $first_line -eq 1 ]
				then
					echo -e "$new_line"  > $output_file
					first_line=0
				else
					echo -e "$new_line"  >> $output_file
				fi
			else
				# Keywords not found on this line; write line to file
				if [ $first_line -eq 1 ]
				then
					# NOTE: -E is important to avoid losing "\" characters on the line
					echo -E $line > $output_file
					first_line=0
				else
					echo -E $line >> $output_file
				fi
			fi
		else
		    # We already found a matching line, just output the other lines to the file
			echo -E $line >> $output_file
		fi
	done < $input_file

	IFS=$old_IFS

    if [ $found_line -eq 0 ]
    then
	    log_message "No line was found in file $file_name matching the keywords $keyword1 $keyword2 $keyword3"
		rm -f $output_file
		rm -f $backup_file_name
		return 1
    fi	
	# The output of the diff command should give 4 lines of text like (unless the lines were identical), for instance:
	# 17c17
	# < password    required      pam_deny.so
	# ---
	# > password    required    pam_cracklib.so retry=3 minlen=8 dcredit=-1 ucredit=0 lcredit=-1 ocredit=0 type=reject_username
	num_of_diff_output_lines=`diff $input_file $output_file | wc -l`
	if [ $num_of_diff_output_lines -eq 4 -o $num_of_diff_output_lines -eq 0 ]
	then
		log_message "Activating the modified $input_file."
		activate_new_file $output_file $input_file $backup_file_name
		result=$?
		return $result
	else
		log_message "Failed to replace the line with keyword $keyword in the file $file_name. Restoring the original file $file_name."
		rm -f $input_file
		mv $backup_file_name $input_file
		return 1
	fi

    return 0
}

#-------------------------------------------------------------------------------
# Replace a line in a file based on a specified keyword
# Arguments:
# $1: file path and name
# $2: keyword
# $GlobalStringArgument: new line to replace the old line
# NOTE: we replace only the first line found with a match if there is more than one match.
insert_or_replace_line_in_file_based_on_one_keyword()
{

    file_name=$1
	keyword=$2
	new_line="$GlobalStringArgument"
	
    # Backup the original file
	time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
	backup_file_name="$file_name.backup.$time_stamp"
	cp -pf $file_name $backup_file_name 2>/dev/null
	result=$?
	if [ $result -ne 0 ]
	then
	    log_message "Failed to backup the file $file_name. Error = $result."
	    return $result
	fi

	input_file=$file_name
	output_file=$file_name.tmp.$time_stamp

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	first_line=1
	found_line=0
	while read -r line
	do
		if [ $found_line -eq 0 ]
		then
			word1=`echo "$line" | awk '{ print $1 }'`
			if [ "$word1" = "$keyword" ]
			then
				# Found the line to replace; write the new line to the file
	            log_message "Found line in file $file_name matching the keyword $keyword"
	            log_message "Line found: $line"
				log_message "Replacing this line with the following:"
				log_message "$new_line"
				found_line=1
				if [ $first_line -eq 1 ]
				then
					echo -e "$new_line"  > $output_file
					first_line=0
				else
					echo -e "$new_line"  >> $output_file
				fi
			else
				# Keyword not found on this line; write line to file
				if [ $first_line -eq 1 ]
				then
					# NOTE: -E is important to avoid losing "\" characters on the line
					echo -E $line > $output_file
					first_line=0
				else
					echo -E $line >> $output_file
				fi
			fi
		else
		    # We already found a matching line, just output the other lines to the file
			echo -E $line >> $output_file
		fi
	done < $input_file

	IFS=$old_IFS

    if [ $found_line -eq 0 ]
    then
	    log_message "No line was found in $file_name matching the keyword $keyword"
	    log_message "Appending the line at the end of $input_file:"
	    log_message "$new_line"
		echo -E "#" >> $input_file
		echo -E "# ITCS104-ITSSCSD Linux remediation script inserting the following line:" >> $input_file
		echo -E $new_line >> $input_file
		rm -f $output_file
		rm -f $backup_file_name
		return 0
    fi	
	# The output of the diff command should give 4 lines of text like (unless the lines were identical), for instance:
	# 17c17
	# < password    required      pam_deny.so
	# ---
	# > password    required    pam_cracklib.so retry=3 minlen=8 dcredit=-1 ucredit=0 lcredit=-1 ocredit=0 type=reject_username
	num_of_diff_output_lines=`diff $input_file $output_file | wc -l`
	if [ $num_of_diff_output_lines -eq 4 -o $num_of_diff_output_lines -eq 0 ]
	then
		log_message "Activating the modified $input_file."
		activate_new_file $output_file $input_file $backup_file_name
		result=$?
		return $result
	else
		log_message "Failed to replace the line with keyword $keyword in the file $file_name. Restoring the original file $file_name."
		rm -f $input_file
		mv $backup_file_name $input_file
		return 1
	fi

    return 0
}

#-------------------------------------------------------------------------------
# Add a line in a file in a paragraph based on a keyword
# Arguments:
# $1: file path and name
# $2: keyword to look for in the file
# $GlobalStringArgument: new line to be added
add_stanza_line_in_file_at_paragraph_based_on_keyword()
{
    file_name=$1
	keyword=$2
	new_line="$GlobalStringArgument"
	
    # Backup the original file
	time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
	backup_file_name="$file_name.backup.$time_stamp"
	cp -pf $file_name $backup_file_name 2>/dev/null
	result=$?
	if [ $result -ne 0 ]
	then
	    log_message "Failed to backup the file $file_name. Error = $result."
	    return $result
	fi

	input_file=$file_name
	output_file=$file_name.tmp.$time_stamp

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	first_line=1
	found_paragraph=0
	while read -r line
	do
		if [ $found_paragraph -eq 0 ]
		then
			word1=`echo "$line" | awk '{ print $1 }'`
			if [ "$word1" = "$keyword" ]
			then
				# Found the paragraph; add the new line to the file and output the existing line after
				log_message "Inserting line $new_line at paragraph containing keyword $keyword."
				found_paragraph=1
				if [ $first_line -eq 1 ]
				then
					echo -e "$new_line"  > $output_file
					echo -E $line >> $output_file
					first_line=0
				else
					echo -e "$new_line"  >> $output_file
					echo -E $line >> $output_file
				fi
			else
				# Keyword not found on this line; write line to file
				if [ $first_line -eq 1 ]
				then
					# NOTE: -E is important to avoid losing "\" characters on the line
					echo -E $line > $output_file
					first_line=0
				else
					echo -E $line >> $output_file
				fi
			fi
		else
		    # We already found the paragraph and inserted the line, just output the other lines to the file
			echo -E $line >> $output_file
		fi
	done < $input_file

	IFS=$old_IFS

    if [ $found_paragraph -eq 0 ]
    then
	    log_message "No line was found in file $file_name matching the keyword $keyword"
		rm -f $output_file
		rm -f $backup_file_name
		return 1
    fi	
	# The output of the diff command should give 2 lines of text like, for instance
	# 14a15
	# > password    required      pam_cracklib.so retry=3 minlen=8 dcredit=-1 ucredit=0 lcredit=-1 ocredit=0 type=reject_username
	num_of_diff_output_lines=`diff $input_file $output_file | wc -l`
	if [ $num_of_diff_output_lines -eq 2 ]
	then
		log_message "Activating the modified $input_file."
		activate_new_file $output_file $input_file $backup_file_name
		result=$?
		return $result
	else
		log_message "Failed to add the line with keyword $keyword in the file $file_name. Restoring the original file $file_name."
		rm -f $input_file
		mv $backup_file_name $input_file
		return 1
	fi

    return 0
}

#-------------------------------------------------------------------------------
# Add a line in a file inside a paragraph based on a keyword
# Arguments:
# $1: file path and name
# $2: keyword to look for in the file
# $GlobalStringArgument: new line to be added
add_line_in_file_in_paragraph_based_on_keyword()
{
    file_name=$1
	keyword=$2
	new_line="$GlobalStringArgument"
	
    # Backup the original file
	time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
	backup_file_name="$file_name.backup.$time_stamp"
	cp -pf $file_name $backup_file_name 2>/dev/null
	result=$?
	if [ $result -ne 0 ]
	then
	    log_message "Failed to backup the file $file_name. Error = $result."
	    return $result
	fi

	input_file=$file_name
	output_file=$file_name.tmp.$time_stamp

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	first_line=1
	found_paragraph=0
	while read -r line
	do
		if [ $found_paragraph -eq 0 ]
		then
			echo "$line" | grep "$keyword" 2>&1 1>/dev/null
			result=$?
			if [ $result -eq 0 ]
			then
				# Found the paragraph; add the new line to the file and output the existing line before
				log_message "Inserting line [$new_line] at paragraph containing keyword $keyword."
				found_paragraph=1
				if [ $first_line -eq 1 ]
				then
					echo -E $line >> $output_file
					echo -e "$new_line"  > $output_file
					first_line=0
				else
					echo -E $line >> $output_file
					echo -e "$new_line"  >> $output_file
				fi
			else
				# Keyword not found on this line; write line to file
				if [ $first_line -eq 1 ]
				then
					# NOTE: -E is important to avoid losing "\" characters on the line
					echo -E $line > $output_file
					first_line=0
				else
					echo -E $line >> $output_file
				fi
			fi
		else
		    # We already found the paragraph and inserted the line, just output the other lines to the file
			echo -E $line >> $output_file
		fi
	done < $input_file

	IFS=$old_IFS

    if [ $found_paragraph -eq 0 ]
    then
	    log_message "No line was found in file $file_name matching the keyword $keyword"
		rm -f $output_file
		rm -f $backup_file_name
		return 1
    fi	
	# The output of the diff command should give 2 lines of text like, for instance
	# 14a15
	# > password    required      pam_cracklib.so retry=3 minlen=8 dcredit=-1 ucredit=0 lcredit=-1 ocredit=0 type=reject_username
	num_of_diff_output_lines=`diff $input_file $output_file | wc -l`
	if [ $num_of_diff_output_lines -eq 2 ]
	then
		log_message "Activating the modified $input_file."
		activate_new_file $output_file $input_file $backup_file_name
		result=$?
		return $result
	else
		log_message "Failed to add the line with keyword $keyword in the file $file_name. Restoring the original file $file_name."
		rm -f $input_file
		mv $backup_file_name $input_file
		return 1
	fi

    return 0
}


#-------------------------------------------------------------------------------
# Check a line in a file based on a set of 2 or 3 specified keywords
# Arguments:
# $1: file path and name
# $2: number of keywords: 2 or 3
# $3 - $3 or $4: keywords to look for in the file
# NOTE 1: the keywords are expected to be consecutive on the line and be the only ones;
#         using keywords eliminates the need to account for blank spaces, etc.
# NOTE 2: for the third keyword, which is expected to be a file name, we use grep for the test
#         and not absolute match, because of optional file path in the keyword in the file.
check_if_line_in_file_based_on_keywords()
{
    file_name=$1
	num_of_keywords=$2
	keyword1=$3
	keyword2=$4
	if [ $num_of_keywords -gt 2 ]
	then
	    keyword3=$5
	else
	    keyword3=""
	fi
	
	input_file=$file_name

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	while read -r line
	do
		num_of_words=`echo "$line" | wc -w`;
		if [ $num_of_words -eq $num_of_keywords ]
		then
			word1=`echo "$line" | awk '{ print $1 }'`
			word2=`echo "$line" | awk '{ print $2 }'`
			if [ $num_of_keywords -gt 2 ]
			then
				word3=`echo "$line" | awk '{ print $3 }'`
				# keyword3 might not be an absolute match because of an optional path in the keyword; use grep
				if echo -e $word3 | grep "$keyword3" 2>&1 1>/dev/null
				then
					word3=$keyword3
				else
					if echo -e $keyword3 | grep "$word3" 2>&1 1>/dev/null
					then
						word3=$keyword3
					fi
				fi
			else
				word3=$keyword3
			fi
			if [ "$word1" = "$keyword1" -a "$word2" = "$keyword2" -a "$word3" = "$keyword3" ]
			then
				log_message "Found line in file $file_name matching the keywords $keyword1 $keyword2 $keyword3"
				log_message "Line found: $line"
				return 0
			fi
		fi
	done < $file_name

	IFS=$old_IFS

	log_message "No line was found in file $file_name matching the keywords $keyword1 $keyword2 $keyword3"
	return 1

}

#-------------------------------------------------------------------------------
# comment_out_lines_in_file_based_on_keyword
# Arguments:
# $1: file path and name
# $2: keyword to look for in the file
comment_out_lines_in_file_based_on_keyword()
{
    file_name=$1
	keyword=$2
	
    # Backup the original file
	time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
	backup_file_name="$file_name.backup.$time_stamp"
	cp -pf $file_name $backup_file_name 2>/dev/null
	result=$?
	if [ $result -ne 0 ]
	then
	    log_message "Failed to backup the file $file_name. Error = $result."
	    return $result
	fi

	input_file=$file_name
	output_file=$file_name.tmp.$time_stamp

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	first_line=1
	number_of_lines_changed=0
	while read -r line
	do
		if echo -e $line | grep "$keyword" | grep -v "#" 2>&1 1>/dev/null
		then
			# Found the keyword on this line; comment out the line in the output file
			if [ $first_line -eq 1 ]
			then
				# NOTE: -E is important to avoid losing "\" characters on the line
				echo -E "# $line"  > $output_file
				first_line=0
			else
				echo -E "# $line"  >> $output_file
			fi
			number_of_lines_changed=`expr $number_of_lines_changed + 1`
		else
		    # Keyword not found on this line; write line to file
			if [ $first_line -eq 1 ]
			then
				# NOTE: -E is important to avoid losing "\" characters on the line
				echo -E $line > $output_file
				first_line=0
			else
				echo -E $line >> $output_file
			fi
		fi
	done < $input_file

	IFS=$old_IFS
	if [ $number_of_lines_changed -eq 0 ]
	then
		log_message "Did not find any lines that needed to be commented out in file $input_file based on keyword $keyword."
		return 1
	else
		log_message "Commented out $number_of_lines_changed line(s) where the occurrence of $keyword was found."
		rm $input_file
		mv $output_file $input_file
		return 0
	fi

}


#-------------------------------------------------------------------------------
get_userids_with_GIDs_in_specified_range()
# Scan the /etc/group file and build the list of user IDs which belong to groups
# whose GIDs are between the $1 and $2 arguments
# /etc/group format:
#cdrom:x:24:vivek,student13,raj
#_____ _  _      _____
#|    |  |        |
#|    |  |        |
#1    2  3        4
#
#Where,
#
# 1:    group_name: It is the name of group. If you run ls -l command, you will see this name printed in the group field.
# 2:    Password: Generally password is not used, hence it is empty/blank. It can store encrypted password. This is useful to implement privileged groups.
# 3:    Group ID (GID): Each user must be assigned a group ID. You can see this number in your /etc/passwd file.
# 4:    Group List: It is a list of user names of users who are members of the group. The user names, must be separated by commas.
# Argument:
# $1: min_GID
# $2: max_GID
{
    min_GID=$1
    max_GID=$2
	
    file_name="/etc/group"
    GlobalUserIDstring=""
	
	found_user=0
	num_of_users_found=0
	while read -r line
	do
		work_line=$line
		current_GID=`echo -e $work_line | awk 'BEGIN { FS = ":" } ; { print $3 }'`
		if [ $current_GID -ge $min_GID -a $current_GID -le $max_GID ]
		then
			user_list=`echo -e $work_line | awk 'BEGIN { FS = ":" } ; { print $4 }'`
		    if [ "$user_list" != "" ]
			then
				update_global_list=0
				log_message "GID $current_GID has user list: $user_list."
				# Verify if some of the users in the current list were already found
				# Replace the commas by blank spaces
				user_list=`echo $user_list | sed s/,/" "/g`
				work_list=$user_list
				num_users_in_list=`echo $work_list | wc -w | awk '{print $1}'`
				num_checked=0
				while [ $num_checked -lt $num_users_in_list ]
				do
				    user_to_check=`echo $work_list | awk '{print $1}'`
					echo -e " $GlobalUserIDstring " | grep " $user_to_check " 2>&1 1>/dev/null
					result=$?
					if [ $result -eq 0 ]
					then
					    log_message "User $user_to_check is already in the global list; skipping it..."
						user_list=`echo $user_list | sed s/$user_to_check//g`
					else
					    update_global_list=1
					fi
					num_checked=`expr $num_checked + 1`
					# Take out the processed user from the current work list
					work_list=`echo $work_list | sed s/$user_to_check//g`
				done

				if [ $update_global_list -eq 1 ]
				then
					GlobalUserIDstring="$GlobalUserIDstring $user_list"
				fi
				found_user=1
			fi
		fi
	done < $file_name

	if [ $found_user -eq 1 ]
	then
		num_of_users_found=`echo $GlobalUserIDstring | wc -w | awk '{print $1}'`
	fi
		
    return $num_of_users_found

}

#-------------------------------------------------------------------------------
get_userids_with_pwd_assigned_in_etc_shadow()
# Users that don't have to be processed have one of the following values in their password field in /etc/shadow:
# Empty string - No password, the account has no password. (Reported by passwd on Solaris with "NP")
# "!" - the account is password Locked, user will be unable to log-in via password authentication but other methods (e.g. ssh key) may be still allowed)
# "*LK*" or "*" - the account is Locked, user will be unable to log-in via password authentication but other methods (e.g. ssh key) may be still allowed)
# "!!" - the password has never been set (RedHat)[8] 
{
    file_name="/etc/shadow"
    GlobalUserIDstring=''
	
	found_user=0
	num_of_users_found=0
	while read -r line
	do
		work_line=$line

		current_userid=`echo -e $work_line | awk 'BEGIN { FS = ":" } ; { print $1 }'`
		current_pwd=`echo -e $work_line | awk 'BEGIN { FS = ":" } ; { print $2 }'`
		if [ "$current_pwd" = "" -o "$current_pwd" = "!" -o "$current_pwd" = "*LK*" -o "$current_pwd" = "*" -o "$current_pwd" = "!!" ]; then
		    process_user=0
		else
		    process_user=1
		fi
		
		if [ $process_user -eq 1 ]
		then
		    GlobalUserIDstring="$GlobalUserIDstring $current_userid"
			found_user=1
			num_of_users_found=`expr $num_of_users_found + 1`
		fi
	done < $file_name
		
    return $num_of_users_found
}

#-------------------------------------------------------------------------------
# Replace the value of the password max age field in /etc/shadow based on a specified userid
# Arguments:
# $1: userid
# $2: new value of password max age
# IMPORTANT: this function assumes that the field number is field number 5
# Example of a line in the /etc/shadow file:
#   bin:*:15937:0:99999:7:::
# So there are 8 fields on each line delimited with the ':' character.
set_pwd_max_age_in_shadow_file()
{
    file_name="/etc/shadow"
	userid=$1
	new_value=$2
	
    # Backup the original file
	time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
	backup_file_name="$file_name.backup.$time_stamp"
	cp -pf $file_name $backup_file_name 2>/dev/null
	result=$?
	if [ $result -ne 0 ]
	then
	    log_message "Failed to backup the file $file_name. Error = $result."
	    return $result
	fi

	input_file=$file_name
	output_file=$file_name.tmp.$time_stamp

	first_line=1
	number_of_lines_changed=0
	found_user=0
	while read -r line
	do
		work_line=$line

		current_userid=`echo -e $work_line | awk 'BEGIN { FS = ":" } ; { print $1 }'`
		if [ $current_userid == $userid ]
		then
			# Found the userid on this line, get the current value of the password max age (field 5)
			found_user=1
			old_value=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $5 }'`
			# Check against an empty field to avoid shell error
			if [ "$old_value" == "" ]
			then
			    old_value="undefined"
			fi
			log_message "Located user $userid on line: $line"
			log_message "Current value of password max age for user $userid is $old_value"
			if [ "$old_value" = "$new_value" ]
			then
				# Old value is the same as the new one, just output the line to the file
				log_message "The current value of the $userid max password age is the same as the requested one ($new_value). Does not need to be changed."
				if [ $first_line -eq 1 ]
				then
					echo -E $line > $output_file
					first_line=0
				else
					echo -E $line >> $output_file
				fi
			else
				# Replace the old value by the new value
				log_message "Setting value of password max age for user $userid to $new_value"
				field_2=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $2 }'`
				field_3=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $3 }'`
				field_4=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $4 }'`
				field_6=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $6 }'`
				field_7=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $7 }'`
				field_8=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $8 }'`
				new_line="$userid:$field_2:$field_3:$field_4:$new_value:$field_6:$field_7:$field_8:"
				
				if [ $first_line -eq 1 ]
				then
					echo -e "$new_line"  > $output_file
					first_line=0
				else
					echo -e "$new_line"  >> $output_file
				fi
				number_of_lines_changed=`expr $number_of_lines_changed + 1`
			fi
		else
		    # userid not found on this line; write line to file
			if [ $first_line -eq 1 ]
			then
				# NOTE: -E is important to avoid losing "\" characters on the line
				echo -E $line > $output_file
				first_line=0
			else
				echo -E $line >> $output_file
			fi
		fi
	done < $input_file

    if [ $found_user -eq 0 ]
	then
	    log_message "User $userid was not found in $input_file."
		return 1
	fi

    # If the userid was found but no line was changed, cleanup and return success
	if [ $number_of_lines_changed -eq 0 ]
	then
		rm $output_file
		rm $backup_file_name
		return 0
	fi

	# The output of the diff command should give 4 lines of text, for instance
	# 15c15
	# < nobody:*:15937:0:90:7:::
	# ---
	# > nobody:*:15937:0:99999:7:::
	num_of_diff_output_lines=`diff $input_file $output_file | wc -l`
	if [ $num_of_diff_output_lines -eq 4 ]
	then
		log_message "Activating the modified $input_file."
		activate_new_file $output_file $input_file $backup_file_name
		result=$?
		return $result
	else
		log_message "Failed to replace the line with userid $userid in the file $file_name. Restoring the original file $file_name."
		rm -f $input_file
		mv $backup_file_name $input_file
		return 1
	fi

    return 0
}

#-------------------------------------------------------------------------------
# Replace the value of the password min age field in /etc/shadow based on a specified userid
# Arguments:
# $1: userid
# $2: new value of password min age
# IMPORTANT: this function assumes that the field number is field number 4
# Example of a line in the /etc/shadow file:
#   bin:*:15937:0:99999:7:::
# So there are 8 fields on each line delimited with the ':' character.
set_pwd_min_age_in_shadow_file()
{
    file_name="/etc/shadow"
	userid=$1
	new_value=$2
	
    # Backup the original file
	time_stamp=`date "+%Y-%m-%d-%Hh%Mm%S"`
	backup_file_name="$file_name.backup.$time_stamp"
	cp -pf $file_name $backup_file_name 2>/dev/null
	result=$?
	if [ $result -ne 0 ]
	then
	    log_message "Failed to backup the file $file_name. Error = $result."
	    return $result
	fi

	input_file=$file_name
	output_file=$file_name.tmp.$time_stamp

	first_line=1
	number_of_lines_changed=0
	found_user=0
	while read -r line
	do
		work_line=$line

		current_userid=`echo -e $work_line | awk 'BEGIN { FS = ":" } ; { print $1 }'`
		if [ $current_userid == $userid ]
		then
			# Found the userid on this line, get the current value of the password min age (field 4)
			found_user=1
			old_value=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $4 }'`
			# Check against an empty field to avoid shell error
			if [ "$old_value" == "" ]
			then
			    old_value="undefined"
			fi
			log_message "Located user $userid on line: $line"
			log_message "Current value of password min age for user $userid is $old_value"
			if [ "$old_value" = "$new_value" ]
			then
				# Old value is the same as the new one, just output the line to the file
				log_message "The current value of the $userid min password age is the same as the requested one ($new_value). Does not need to be changed."
				if [ $first_line -eq 1 ]
				then
					echo -E $line > $output_file
					first_line=0
				else
					echo -E $line >> $output_file
				fi
			else
				# Replace the old value by the new value
				log_message "Setting value of password min age for user $userid to $new_value"
				field_2=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $2 }'`
				field_3=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $3 }'`
				field_5=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $5 }'`
				field_6=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $6 }'`
				field_7=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $7 }'`
				field_8=`echo "$work_line" | awk 'BEGIN { FS = ":" } ; { print $8 }'`
				new_line="$userid:$field_2:$field_3:$new_value:$field_5:$field_6:$field_7:$field_8:"
				
				if [ $first_line -eq 1 ]
				then
					echo -e "$new_line"  > $output_file
					first_line=0
				else
					echo -e "$new_line"  >> $output_file
				fi
				number_of_lines_changed=`expr $number_of_lines_changed + 1`
			fi
		else
		    # userid not found on this line; write line to file
			if [ $first_line -eq 1 ]
			then
				# NOTE: -E is important to avoid losing "\" characters on the line
				echo -E $line > $output_file
				first_line=0
			else
				echo -E $line >> $output_file
			fi
		fi
	done < $input_file

    if [ $found_user -eq 0 ]
	then
	    log_message "User $userid was not found in $input_file."
		return 1
	fi

    # If the userid was found but no line was changed, cleanup and return success
	if [ $number_of_lines_changed -eq 0 ]
	then
		rm $output_file
		rm $backup_file_name
		return 0
	fi
	
	# The output of the diff command should give 4 lines of text, for instance:
	# 13c13
	# < gopher:abcdef:15937:1:99999:7:::
	# ---
	# > gopher:abcdef:15937:0:99999:7:::
	num_of_diff_output_lines=`diff $input_file $output_file | wc -l`
	if [ $num_of_diff_output_lines -eq 4 ]
	then
		log_message "Activating the modified $input_file."
		activate_new_file $output_file $input_file $backup_file_name
		result=$?
		return $result
	else
		log_message "Failed to replace the line with userid $userid in the file $file_name. Restoring the original file $file_name."
		rm -f $input_file
		mv $backup_file_name $input_file
		return 1
	fi

    return 0
}


#-------------------------------------------------------------------------------
# Check and set a file permission to the specified value
# Arguments:
# $1: file path and name
# $2: octal value of file permission
# NOTE: if the specified file does not exist, no action is taken.
check_and_set_file_permission()
{
    file_name=$1
	requested_value=$2

     # Verify if $file_name exists; if not, no action to take; just log a message.
	if [ ! -e $file_name ]
	then
	    log_message "$file_name not found on the system. No action to take."
		return 0
	fi

   # Verify the file permissions of $file_name and log the current value
    permission_value=`stat -c "%a" $file_name | awk '{print $1}'`
	permission_string=`ls -l $file_name | awk '{print $1}'`
	log_message "Current $file_name file permission: $permission_value ($permission_string)"

    if [ $permission_value -eq $requested_value ]	
	then
		log_message "This value corresponds to the requested value; does not need to be changed."
		return 0
	else
	    log_message "Setting $file_name file permission to $requested_value."
		chmod $requested_value $file_name 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to set $file_name file permission to $requested_value."
			return 1
		fi			
	fi
    permission_value=`stat -c "%a" $file_name | awk '{print $1}'`
	permission_string=`ls -l $file_name | awk '{print $1}'`
	log_message "$file_name file permission has been set to: $permission_value ($permission_string)."

	return 0
}


#-------------------------------------------------------------------------------
# Check and set a directory permission to the specified value
# Arguments:
# $1: directory path
# $2: octal value of permission
# $3: parent directory path
# $4: relative directory without parent directory path
# NOTE: if the specified directory does not exist, no action is taken.
check_and_set_directory_permission()
{
    dir_path_and_name=$1
	requested_value=$2
	parent_dir=$3
	relative_dir=$4

	# Verify if $dir_path_and_name exists; if not, no action to take; just log a message.
	if [ ! -e $dir_path_and_name ]
	then
	    log_message "$dir_path_and_name not found on the system. No action to take."
		return 0
	fi

   # Verify the permissions of $dir_path_and_name and log the current value
    permission_value=`stat -c "%a" $dir_path_and_name | awk '{print $1}'`
	permission_string=`ls -l $parent_dir | grep $relative_dir | awk '{print $1}'`
	log_message "Current $dir_path_and_name permission: $permission_value ($permission_string)"

    if [ $permission_value -eq $requested_value ]	
	then
		log_message "This value corresponds to the requested value; does not need to be changed."
		return 0
	else
	    log_message "Setting $dir_path_and_name permission to $requested_value."
		chmod $requested_value $dir_path_and_name 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to set $dir_path_and_name permission to $requested_value."
			return 1
		fi			
	fi
    permission_value=`stat -c "%a" $dir_path_and_name | awk '{print $1}'`
	permission_string=`ls -l $parent_dir | grep $relative_dir | awk '{print $1}'`
	log_message "$dir_path_and_name permission has been set to: $permission_value ($permission_string)."

	return 0
}
#-------------------------------------------------------------------------------
# Check and set the owner of a file as root
# Arguments:
# $1: file path and name
# NOTE: if the specified file does not exist, no action is taken.
check_and_set_file_root_owner()
{
    file_name=$1

     # Verify if $file_name exists; if not, no action to take; just log a message.
	if [ ! -e $file_name ]
	then
	    log_message "$file_name not found on the system. No action to take."
		return 0
	fi

	# Verify the file owner of $file_name and log the current owner
	file_owner=`ls -l $file_name | awk '{print $3}'`
	log_message "Current $file_name owner: $file_owner"

    if [ $file_owner == "root" ]	
	then
		log_message "This owner is already set as root; does not need to be changed."
		return 0
	else
	    log_message "Setting $file_name owner as root."
		chown "root" $file_name 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to set $file_name owner as root."
			return 1
		fi			
	fi
	file_owner=`ls -l $file_name | awk '{print $3}'`
	log_message "$file_name owner has been set to: $file_owner."

	return 0
}

#--------------------------------------------------------------
# Check if a file is sourced with a wild card from another file.
# The check is based on the following format (example):
#    foreach i ( /etc/profile.d/*.csh )
#            if ( -r "$i" ) then
#                            if ($?prompt) then
#                                  source "$i"
#                            else
#                                  source "$i" >& /dev/null
#                            endif
#            endif
#    end
#
check_if_file_called_with_wildcard()
{
	input_file=$1
	second_file_wildcard=$2

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	found_foreach_loop=0
	while read -r line
	do
	    # For every foreach loop, check if the second file (wildcard) is invoked with the source command
		if [ $found_foreach_loop -eq 0 ]
		then
			if echo -e $line | grep "foreach" | grep "$second_file_wildcard" | grep -v "#" 2>&1 1>/dev/null
			then
				log_message "Found the foreach loop: $line"
			    found_foreach_loop=1
				# Get the variable that will hold each file name in the loop iterations and checked if it is sourced in the loop
				file_var=`echo -e $line | awk '{ print $2 }'`
			fi
		else
		    # We are in a foreach loop; check if the wildcard-file is sourced before the end of the loop
			first_word=`echo -e $line | awk '{ print $1 }'`
			if [ "$first_word" = "end" ]
			then
				# Got to end of the foreach loop; keep reading and look for another foreach loop
				found_foreach_loop=0
			else
				if [ "$first_word" = "source" ]
				then
					source_var=`echo -e $line | awk '{ print $2 }'`
					if [ "\"\$$file_var\"" = "$source_var" ]
					then
						log_message "Found the source command on the line: $line"
						return 0  # ---> DONE, found it
					fi
				fi
			fi
		fi
	done < $input_file

	IFS=$old_IFS
	
	# Coming here means source command not found
	return 1
}

#--------------------------------------------------------------
# Check if a sh file is sourced with a wild card from another file.
# The check is based on the following format (example):
# for i in /etc/profile.d/*.sh ; do
#     if [ -r "$i" ]; then
#         if [ "${-#*i}" != "$-" ]; then
#             . "$i"
#         else
#             . "$i" >/dev/null 2>&1
#         fi
#     fi
# done
#
check_if_sh_file_called_with_wildcard()
{
	input_file=$1
	second_file_wildcard=$2

	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	found_for_loop=0
	while read -r line
	do
	    # For every fore loop, check if the second file (wildcard) is invoked with the source (.) command
		if [ $found_for_loop -eq 0 ]
		then
			if echo -e $line | grep "for " | grep "$second_file_wildcard" | grep -v "#" 2>&1 1>/dev/null
			then
				log_message "Found the for loop: $line"
			    found_for_loop=1
				# Get the variable that will hold each file name in the loop iterations and checked if it is sourced in the loop
				file_var=`echo -e $line | awk '{ print $2 }'`
			fi
		else
		    # We are in a for loop; check if the wildcard-file is sourced before the end of the loop
			first_word=`echo -e $line | awk '{ print $1 }'`
			if [ "$first_word" = "done" ]
			then
				# Got to end of the for loop; keep reading and look for another for loop
				found_for_loop=0
			else
				if [ "$first_word" = "." ]
				then
					source_var=`echo -e $line | awk '{ print $2 }'`
					if [ "\"\$$file_var\"" = "$source_var" ]
					then
						log_message "Found the source command on the line: $line"
						return 0  # ---> DONE, found it
					fi
				fi
			fi
		fi
	done < $input_file

	IFS=$old_IFS
	
	# Coming here means source command not found
	return 1
}

#-------------------------------------------------------------------------------
# check_for_exact_match_of_keyword_in_file
# Arguments:
# $1: file path and name
# $2: keyword to look for in the file
# NOTE: the keyword is expected to be the first word on a line and must not be commented out (#)
# Return: 0 if exact match found
check_for_exact_match_of_keyword_in_file()
{
    file_name=$1
	keyword=$2
	
	# Set IFS to preserve tab characters
	old_IFS=${IFS}
	IFS=''

	while read -r line
	do
		word_read=`echo $line | awk '{ print $1 }'`
		if [ "$word_read" = "$keyword" ]
		then
			IFS=$old_IFS
		    return 0  # --> found
		fi
	done < $file_name

	IFS=$old_IFS
	return 1      # --> not found
}

#--------------------------------------------------------------
containsa()
{
 echo " $1 " | grep -c "$2$3$4"
}

#--------------------------------------------------------------
loadFile_etc_passwd()
{
 file2load="/etc/passwd"
 line=""
 i=0 
 users=[]
 while read -r line; do    
	if [[ -n "$line" && "$line" != [[:blank:]*]* && "$line" != [[:blank:]+]* && "$line" != [[:blank:]#]* ]] ; then 
		if echo "$line" | grep -q ":" ; then
			u_usr="`echo $line | cut -f1 -d:`"
			#u_passwd="`echo $line | cut -f2 -d:`"
			u_UID="`echo $line | cut -f3 -d:`"
			#u_GID="`echo $line | cut -f4 -d:`"
			#u_home=="`echo $line | cut -f6 -d:`"
			#u_shell="`echo $line | cut -f7 -d:`"
			users[$i]="$u_usr $u_UID"
			i=$((i+1))
		fi 
	fi 	
 done < $file2load 
return
}

#--------------------------------------------------------------
# Find the path of a file
# If not in $PATH directories, use find in /etc and /usr recursively
get_full_path()
{
	cmd=$1
	which $cmd 1>/dev/null 2>&1
	if [ $? -eq 0 ]
	then
		GlobalTargetFileNameAndPath=`which $cmd | awk '{print $1}'`
		return 0
	fi
	# cmd not found in PATH
	# Look in /etc
	num_found=`$FindCommand /etc -name $cmd -print | wc -l | awk '{print $1}'`
	if [ $num_found -ne 0 ]
	then
		if [ $num_found -eq 1 ]
		then
			GlobalTargetFileNameAndPath=`$FindCommand /etc -name $cmd -print | awk '{print $1}'`
			return 0
		fi
		if [ $num_found -gt 1 ]
		then
			log_message "$num_found pathes to $cmd have been found under /etc. Cannot resolve path with certainty."
			return 1
		fi
	else
		# Not found in /etc; look in /usr
		num_found=`$FindCommand /usr -name $cmd -print | wc -l | awk '{print $1}'`
		if [ $num_found -ne 0 ]
		then
			if [ $num_found -eq 1 ]
			then
				GlobalTargetFileNameAndPath=`$FindCommand /usr -name $cmd -print | awk '{print $1}'`
				return 0
			fi
			if [ $num_found -gt 1 ]
			then
				log_message "$num_found pathes to $cmd have been found under /usr. Cannot resolve path with certainty."
				return 1
			fi
		else
			# Not found anywhere
			log_message "No path to $cmd has been found."
			return 1
		fi
	fi
	return 1

}

#--------------------------------------------------------------
# Rule ID 2: rule_Duplicate_GIDs_Forbidden from policy file:
#  <cdf:title>1.1 UserIds/Duplicate GIDs Forbidden</cdf:title> 
#  <cdf:description>Each GID must only be used once</cdf:description> 
#  <scm:violationMessage>Duplicate GID for GID: {2}, GID: {3}. Each GID must only be used once.</scm:violationMessage> 
rule_Duplicate_GIDs_Forbidden()
{
	arg_string=$1
	log_message "rule_Duplicate_GIDs_Forbidden: GroupIds/Duplicate GIDs Forbidden"
	log_message "Parameters received: $arg_string"
	
	error=0
	action=0  # If we remediate something, change it to 1
	
	# Display All groups and GIDs
	nb_group=`cat /etc/group | wc -l | awk '{print $1}'`
	log_message "Number of groups defined in /etc/group: $nb_group"
	log_message "Group / GID"

	all_groups=/tmp/tmp_file.$$
	tmp_data=`awk -F: '{print $3 " " $1}' /etc/group`
	log_message "$tmp_data" 

	awk -F: '{print $3}' /etc/group >> $all_groups

	tmpfile="tmp$$"
	cat /etc/group >> $tmpfile

	for group in `awk -F: '{print $3}' $tmpfile | sort | uniq -d`; do
		# Here $group contains a GID which is in conflict
		log_message "GID $group conflicts. Remediating it."
		det_conflict=`awk -F: '{print $3 " " $1}' $tmpfile | uniq -c | egrep "[ ]+[0-9]+ $group " | awk '{printf "%-12s GID: %-9s \n", $3, $1}'`
		groupGID=`awk -F: '{print $3 " " $1}' $tmpfile | uniq -c | egrep "[ ]+[0-9]+ $group " | awk '{printf "%-12s\n", $3}'`
		isFirst=0
		for nameGID in $groupGID ; do
			if [ "$nameGID" = "+" -o "$nameGID" = "root" ]; then
				log_message "Skipping $nameGID ..."
				else 
					if [ $isFirst -eq 0 ]; then
						isFirst=1 
						log_message "$nameGID will keep the original GID."
					else 
						# We will stay in a loop until we find a valid GID , with each loop we increase the GID
						nextGID=`expr $group + 1`
						canGetOut=1
						while [ $canGetOut -eq 1 ]; do
							echo "Trying to assign GID $nextGID to group $nameGID..."
							if grep "$nextGID" "$all_groups" 1> /dev/null 2>&1 
							then 
								log_message "GID $nextGID is not unique."
							else
								groupmod -g $nextGID $nameGID
								result=$?
								if [ $result -eq 0 ]; then 
									# GID not used 
									log_message "$nameGID GID successfully changed to $nextGID"
									canGetOut=0
									action=1
								else
									if [ $result -eq 8 ]; then
										groupmod -g $nextGID $nameGID 2> ./rule_2_groupmod_error_message$$
										error_message="`cat ./rule_2_groupmod_error_message$$`"
										rm -f ./rule_2_groupmod_error_message$$
										log_message "error message = $error_message"
										running_process=`echo $error_message | awk '{print $9}'`
										log_message "Cannot change the GID of group $nameGID because it is associated to process $running_process which is currently running."
										ps_output=`ps -el | grep " $running_process "`
										log_message "Running process (ps -el output):     $ps_output"
										log_message "Manual intervention is required to remediate duplicate GID for group $nameGID"
										canGetOut=0
										error=1
									fi
								fi
							fi
							nextGID=`expr $nextGID + 1`
						done 
					fi	
				fi 
		done 
	done

	if [ $action -eq 0 ]; then
		log_message "No Remediation was applied"
	else
		log_message "Remediation was successfully applied"
	fi 
	
	rm -f $all_groups
    rm -f $tmpfile 
	
	RuleResult=$error
	return
}

#--------------------------------------------------------------
# rule_Duplicate_UIDs_Forbidden from policy file:
# <cdf:title>1.1 UserIds/Duplicate UIDs Forbidden</cdf:title> 
# <cdf:description>Each UID must only be used once</cdf:description> 
# <scm:violationMessage>Duplicate UID for Account: {2}, UID: {3}. Each UID must only be used once</scm:violationMessage> 
rule_Duplicate_UIDs_Forbidden()
{
    arg_string=$1

	log_message "rule_Duplicate_UIDs_Forbidden: UserIds/Duplicate UIDs Forbidden"
	log_message "Parameters received: $arg_string"

	loadFile_etc_passwd
	
    # The following code is based on similar code from AIX remediation script.
	error=0
	nb_users=$((${#users[*]}-1))
	n=0
	log_message "Number of users defined in /etc/passwd: $nb_users"
	log_message "Username / UID"

	tfile=tmp$$
	rm -f $tfile
	touch $tfile
	
	while [[ $n -le $nb_users ]]; do
		log_message "${users[$n]}"
		echo ${users[$n]} >> $tfile
		((n+=1))
	done	

	action=0  # if we remediate something, we change it to 1 
	
	tmpfile="tmp$$"
	cat /etc/passwd | sed s/^/`hostname`:/g >> $tmpfile
	for user in `awk -F: '{print $4 " " $2}' $tmpfile | sort -n | uniq | awk '{print $1}' | uniq -d`; do
		# Here $user contains a UID which is in conflict
		log_message "UID $user conflicts"
		det_conflict=`awk -F: '{print $4 " " $2}' $tmpfile | uniq -c | egrep "[[:space:]]+[[:digit:]]+ $user " | awk '{printf "%-12s UID: %-9s \n", $3, $2}'`
		log_message "$det_conflict"
		usrUID=`awk -F: '{print $4 " " $2}' $tmpfile | uniq -c | egrep "[[:space:]]+[[:digit:]]+ $user " | awk '{printf "%-12s\n", $3}'`			
		isFirst=0
		log_message "Remediate the conflict: "
		for nameUID in $usrUID ; do
			if [ "$nameUID" = "+" ] ; then
				log_message "skipping $nameUID ..."
			else 
				if [ "$nameUID" = "root" ] ; then 
					log_message "skipping $nameUID ..."
					isFirst=1
				else 
					if [[ $isFirst -eq 0 ]] ; then
						isFirst=1 
						log_message "$nameUID will keep the original UID."
					else 
						# we will stay in a loop until we find a valid UID , with each loop we increase the UID
						nextUID=`expr $user + 1`
						canGetOut=1
						while [[ $canGetOut -eq 1 ]] ; do
							echo "Trying to assign UID $nextUID to user $nameUID..."
							usermod -u $nextUID $nameUID
							result=$?
							if [ $result -eq 0 ] ; then 
								# UID not used 
								log_message "    $nameUID UID successfully changed to $nextUID"
								canGetOut=0
								action=1
							else
							    if [ $result -eq 8 ] ; then
								    usermod -u $nextUID $nameUID 2> ./rule_2_usermod_error_message$$
								    error_message="`cat ./rule_2_usermod_error_message$$`"
									rm -f ./rule_2_usermod_error_message$$
									log_message "error message = $error_message"
									running_process=`echo $error_message | awk '{print $9}'`
								    log_message "Cannot change the UID of user $nameUID because it is associated to process $running_process which is currently running."
									ps_output=`ps -el | grep " $running_process "`
									log_message "Running process (ps -el output):     $ps_output"
									log_message "Manual intervention is required to remediate duplicate UID for user $nameUID"
									canGetOut=0
									error=1
								fi
							fi 	
							nextUID=`expr $nextUID + 1`
						done 
					fi	
				fi 
			fi	
		done 
	done

	if [[ $action -eq 0 ]] ; then
		log_message "No remediation was applied."
	else
		log_message "Remediation was successfully applied"
	fi 
	
    rm -f $tfile
    rm -f $tmpfile	
	
	RuleResult=$error
	return
} 


#--------------------------------------------------------------
# Rule rule_Password_MAX_Age_login_defs from policy file:
#  <cdf:requires idref="LoginDefsV1" /> 
#  <cdf:title>2.1 Reusable Passwords/Password MAX Age login.defs</cdf:title> 
#  <cdf:description>Maximum Password Age Requirement = 90 in /etc/login.defs</cdf:description>
# NOTE: /etc/login.defs must include this line: PASS_MAX_DAYS 90 
rule_Password_MAX_Age_login_defs()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Password_MAX_Age_login_defs: Maximum Password Age"
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as Maximum Password Age."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 90 as parameter."
		PasswordMaxAge=90
	else 
		PasswordMaxAge=`echo "$arg_string" | awk '{ print $2 }'`
	fi
 	
    login_defs_file="/etc/login.defs" 	

    # Verify if /etc/login.defs exists; if not, create it with -rw-r--r-- permissions
	if [ ! -e $login_defs_file ]
	then
	    log_message "$login_defs_file not found on the system. Creating it."
		echo "# Policy remediation script creating $login_defs_file with minimal required information for ITCS104 compliance." > $login_defs_file
		echo "# Password aging controls:" >> $login_defs_file
		echo "#" >> $login_defs_file
		chmod 0644 $login_defs_file
	fi

    # Verify if /etc/login.defs already has the PASS_MAX_DAYS keyword and, if so, log the current value
    grep "PASS_MAX_DAYS" $login_defs_file | grep -v "#" 1> /dev/null 2>&1
    keyword_found=$?
    if [ $keyword_found -eq 0 ]
    then
	    # PASS_MAX_DAYS keyword found in the file
	    current_value_in_file=`grep "PASS_MAX_DAYS" $login_defs_file | grep -v "#" | awk '{print $2}'`
        log_message "Current value of PASS_MAX_DAYS in $login_defs_file = $current_value_in_file."
		if [ $current_value_in_file -eq $PasswordMaxAge ]
		then
		    log_message "This value corresponds to the requested value; does not need to be changed. Exiting function."
			RuleResult=0
			return
		else
		    # Replace the existing definition by the new one in the file
	        log_message "Setting Password Maximum Age to $PasswordMaxAge in $login_defs_file."
		    replace_value_in_file_based_on_keyword $login_defs_file "PASS_MAX_DAYS" $PasswordMaxAge
			result=$?
            if [ $result -ne 0 ]
            then
	            log_message "An error occurred while attempting to set Password Maximum Age to $PasswordMaxAge in $login_defs_file."
				RuleResult=1
				return
            fi			
		fi
    else
		log_message "The PASS_MAX_DAYS definition was not found or is commented out in the file $login_defs_file. Appending it at the end of the file." 
	    log_message "Setting Password Maximum Age to $PasswordMaxAge."
		echo -e "#\tPASS_MAX_DAYS\tMaximum number of days a password may be used." >> $login_defs_file
		echo -e "PASS_MAX_DAYS\t$PasswordMaxAge" >> $login_defs_file
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to append PASS_MAX_DAYS $PasswordMaxAge in $login_defs_file."
			RuleResult=1
			return
		fi
    fi

	# Success
	RuleResult=0
	return
}

#--------------------------------------------------------------
# rule_Password_MAX_Age_shadow from policy file:
#  <cdf:title>2.1 Reusable Passwords/Password MAX Age shadow</cdf:title> 
#  <cdf:description>Maximum Password Age Requirement = 90 in /etc/shadow nor is it required on userids are allowed to have non-expiring passwords</cdf:description> 
#  <scm:violationMessage>User {1} has incorrect Password Max Age setting of {2}, should be set to {3} days. GECOS Description: {4}</scm:violationMessage> 
# Arguments: The value of the password max age.

# For all users with a password assigned in /etc/shadow, enforce that the password max age (field 5) should be set to the specified value (normally 90).
rule_Password_MAX_Age_shadow()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	got_error=0	

	log_message "rule_Password_MAX_Age_shadow: Maximum Password Age Requirement in /etc/shadow"
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]; then
		log_message "This rule expects as parameter the value of the password max age to apply in /etc/shadow."
		log_message "Exiting due to missing parameter(s)..."		
		return
	fi

	PasswordMaxAge=`echo "$arg_string" | awk '{ print $2 }'`
	# Validate the parameter (must be numeric decimal)
	if echo $PasswordMaxAge | grep "[^0-9"] 2>&1 > /dev/null ; then
		log_message "The password max age value is not a valid decimal number. Please verify the parameters. Exiting."		
		return
	fi

    shadow_file="/etc/shadow" 	
	
    # Verify if shadow_file exists; if not, exit
	if [ ! -e $shadow_file ]; then
	    log_message "File $shadow_file not found on the system. No action performed. Exiting."		
		return
	fi

	# userid_full_list will contains : users without non-expiring password and max age not belongs to valid range (1 to 90 days) 
	userid_full_list=`cat $shadow_file | egrep -v '^\s*$' | awk -F":" '{if ( $2!~/^$|^!|^!!|^*$|^*LK*$|^x$/)  print $0}'| awk -F":" '{if($5<1 || $5>90 || $5="") print $0}'`
	num_of_userids=`echo "$userid_full_list" | wc -w`
	
	if [ $num_of_userids -eq 0 ]; then
		log_message "Password Max age for all users from file $shadow_file already have $PasswordMaxAge or more stringent. Remediation not required"		
	else
		log_message "Found $num_of_userids user(s) with a password assigned in file $shadow_file and max age not belongs to valid range (1 to 90 days)."
	  	for user_line in $userid_full_list; do
			user=`echo $user_line | awk -F":" '{print $1}'`
			replaced_line=`echo $user_line | awk -v PasswordMaxAge="$PasswordMaxAge" -F":" 'BEGIN{OFS=":";}{$5=PasswordMaxAge;}1'`
			sed -i "s|$user_line|$replaced_line|g" $shadow_file
			if cat $shadow_file | egrep $replaced_line ; then 
				log_message "Failed to update Password Max age to $PasswordMaxAge for user \"$user\""
				got_error=1
			else
				log_message "Successfully updated Password Max age to $PasswordMaxAge for user \"$user\""
			fi			
		done 				
	fi
	if [ $got_error -eq 0 ]; then
		RuleResult=0
	fi
	
	return
}	

#--------------------------------------------------------------
# rule_Password_MIN_Age_Shadow from policy file:
#  <cdf:requires idref="UsersV3" /> 
#  <cdf:requires idref="ShadowV2" /> 
#  <cdf:title>2.1 Reusable Passwords/Password MIN Age Shadow</cdf:title> 
#  <cdf:description>Minimum Password Age Requirement = 1 in /etc/shadow</cdf:description> 
# From coverage matrix:
#    Field 4 of /etc/shadow must be 1 for all userids with a password assigned.
# Users that don't have to be processed have one of the following values in their password field in /etc/shadow:
# Empty string - No password, the account has no password. (Reported by passwd on Solaris with "NP")
# "!" - the account is password Locked, user will be unable to log-in via password authentication but other methods (e.g. ssh key) may be still allowed)
# "*LK*" or "*" - the account is Locked, user will be unable to log-in via password authentication but other methods (e.g. ssh key) may be still allowed)
# "!!" - the password has never been set (RedHat)[8] 
#
# Arguments:
# The value of the password min age.
rule_Password_MIN_Age_Shadow()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Password_MIN_Age_Shadow: Minimum Password Age Requirement in /etc/shadow"
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value of the password minimum age."
		log_message "Example: rule_Password_MIN_Age_Shadow 1"
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 1 as parameter."
		PasswordMinAge=1
	else
	    PasswordMinAge=`echo "$arg_string" | awk '{ print $2 }'`
	fi

	# Validate the parameter (must be numeric decimal)
	if echo $PasswordMinAge | grep "[^0-9"] 2>&1 > /dev/null
	then
		log_message "The password min age value is not a valid decimal number. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

    # Verify if shadow_file exists; if not, exit
    shadow_file="/etc/shadow" 	
	if [ ! -e $shadow_file ]
	then
	    log_message "$shadow_file not found on the system. No action performed. Exiting."
		RuleResult=1
		return
	fi
    GlobalUserIDstring=''
    get_userids_with_pwd_assigned_in_etc_shadow
	num_of_userids=$?
	if [ $num_of_userids -eq 0 ]
	then
		log_message "Found no user with a password assigned in /etc/shadow."
		RuleResult=1
		return
	else
		log_message "Found $num_of_userids user(s) with a password assigned in /etc/shadow."
		log_message "List of users: $GlobalUserIDstring"
	fi
	
   # Scan the shadow_file and set the password min age field (field 4) of the specified users
	processed_userids=0
	got_error=0
	while [ $processed_userids -lt $num_of_userids ]
	do
	    next_userid=`echo "$GlobalUserIDstring" | awk '{ print $1 }'`
		# Remove the processed userid from the list
		GlobalUserIDstring=`echo $GlobalUserIDstring | sed s,$next_userid,,`
		# Set the requested password min age for the current userid in the shadow file
		set_pwd_min_age_in_shadow_file $next_userid $PasswordMinAge
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "Failed to set password min age in $shadow_file for user $next_userid (error = $result)."
			got_error=1
		fi
		processed_userids=`expr $processed_userids + 1`
	done
	
	if [ $got_error -ne 0 ]
	then
		RuleResult=1
	else	
		RuleResult=0
	fi			

	return
}	

#--------------------------------------------------------------
# rule_Password_MIN_Age_login_defs from policy file:
#   <cdf:requires idref="LoginDefsV1" /> 
#   <cdf:title>2.1 Reusable Passwords/Password MIN Age login.defs</cdf:title> 
#   <cdf:description>Minimum Password Age Requirement = 1 in /etc/login.defs</cdf:description> 
# NOTE: /etc/login.defs must include this line: PASS_MIN_DAYS 1 
rule_Password_MIN_Age_login_defs()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Password_MIN_Age_login_defs: Minimum Password Age"
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as Minimum Password Age."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 1 as parameter."
		PasswordMinAge=1
	else 
		PasswordMinAge=`echo "$arg_string" | awk '{ print $2 }'`
	fi
 	
    login_defs_file="/etc/login.defs" 	

    # Verify if /etc/login.defs exists; if not, create it with -rw-r--r-- permissions
	if [ ! -e $login_defs_file ]
	then
	    log_message "$login_defs_file not found on the system. Creating it."
		echo "# Policy remediation script creating $login_defs_file with minimal required information for ITCS104 compliance." > $login_defs_file
		echo "# Password aging controls:" >> $login_defs_file
		echo "#" >> $login_defs_file
		chmod 0644 $login_defs_file
	fi

    # Verify if /etc/login.defs already has the PASS_MIN_DAYS keyword and, if so, log the current value
    grep "PASS_MIN_DAYS" $login_defs_file | grep -v "#" 1> /dev/null 2>&1
    keyword_found=$?
    if [ $keyword_found -eq 0 ]
    then
	    # PASS_MIN_DAYS keyword found in the file
	    current_value_in_file=`grep "PASS_MIN_DAYS" $login_defs_file | grep -v "#" | awk '{print $2}'`
        log_message "Current value of PASS_MIN_DAYS in $login_defs_file = $current_value_in_file."
		if [ $current_value_in_file -eq $PasswordMinAge ]
		then
		    log_message "This value corresponds to the requested value; does not need to be changed. Exiting function."
			RuleResult=0
			return
		else
		    # Replace the existing definition by the new one in the file
	        log_message "Setting Password Minimum Age to $PasswordMinAge in $login_defs_file."
		    replace_value_in_file_based_on_keyword $login_defs_file "PASS_MIN_DAYS" $PasswordMinAge
			result=$?
            if [ $result -ne 0 ]
            then
	            log_message "An error occurred while attempting to set Password Minimum Age to $PasswordMinAge in $login_defs_file."
				RuleResult=1
				return
            fi			
		fi
    else
		log_message "The PASS_MIN_DAYS definition was not found or is commented out in the file $login_defs_file. Appending it at the end of the file." 
	    log_message "Setting Password Minimum Age to $PasswordMinAge."
		echo -e "#\tPASS_MIN_DAYS\tMinimum number of days allowed between password changes." >> $login_defs_file
		echo -e "PASS_MIN_DAYS\t$PasswordMinAge" >> $login_defs_file
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to append PASS_MIN_DAYS $PasswordMinAge in $login_defs_file."
			RuleResult=1
			return
		fi
    fi

	# Success
	RuleResult=0
	return
}

#--------------------------------------------------------------
# rule_Password_MIN_Length_Setting from policy file:
#<cdf:title>Reusable Passwords/Password MIN Length and complexity</cdf:title>
#<ruleName>Password_MIN_Length_and_complexity</ruleName>
#<cdf:ruleName>Password_MIN_Length_and_complexity</cdf:ruleName>
#<cdf:description>Minimum password length and password complexity rules should be set through one of this PAM modules: pam_cracklib.so, pam_pwquality.so, pam_passwdqc.so(may not be used on SLES nor Debian) in /etc/pam.d/$PAMFILE for &quot;password $CONTROL... stanza&quot; , using mandatory set of parameters for used module. For more information see matrix coverage document. $PAMFILE will be 'commonpassword' for SLES and Debian, other distributions:'systemauth'. $CONTROL must be one of &quot;requisite&quot; or &quot;required&quot;.</cdf:description> 
rule_Password_MIN_Length_and_complexity()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
    RuleResult=0
	log_message "rule_Password_MIN_Length_Setting: Minimum Password Length / complexity."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as Minimum Password Length."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 8 as parameter."
		PasswordMinLength=8
	else 
		PasswordMinLength=`echo "$arg_string" | awk '{ print $2 }'`
	fi
 	
	# Validate the parameter (must be numeric decimal)
	if echo $PasswordMinLength | grep "[^0-9"] 2>&1 > /dev/null
	then
		log_message "The password min length value is not a valid decimal number. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

  	file_name="/etc/pam.d/system-auth"
        
    if [ $IsUbuntu -eq 1 ]
	then
	    file_name="/etc/pam.d/common-password"
	fi

	if [ "$IsSUSE" = "1" ] 
	then
		file_name="/etc/pam.d/common-password"
	fi

	# Check that the file exists
	if [ ! -e $file_name ]
	then
	    log_message "File $file_name not found. Exiting."
		RuleResult=1
		return
	fi
	# Check if the file name is a redirection; if so, use the real physical file name
	ls -l $file_name | grep "\->" 1> /dev/null
	result=$?
	if [ $result -eq 0 ]
	then
	    link_name=$file_name
	    file_name=`$ReadLinkCommand $link_name`
		echo $file_name | grep "/etc/" 1> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
		    # Path is missing in file name; add it
			file_name="/etc/pam.d/$file_name"
		fi
		log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
	fi
	
	var=`egrep "password\s*(required|requisite)\s*(pam_cracklib.so|pam_passwdqc.so|pam_pwquality.so)" $file_name`	
	##Changes for defect 283497 
	if echo $var | grep "required" ; then	   
	   control="required"		   
	else	   
	   control="requisite"	   
	fi
	
	new_line1="password    $control      pam_cracklib.so retry=3 minlen=$PasswordMinLength dcredit=-1 ucredit=0 lcredit=-1 ocredit=0 type=reject_username"		
	
	minlen=`cat $file_name  | grep minlen="$PasswordMinLength"`
	str=`egrep "password\s*(required|requisite)\s*(pam_cracklib.so|pam_passwdqc.so|pam_pwquality.so)\s*retry=3\s*minlen=$PasswordMinLength\s*dcredit=-1\s*ucredit=0\s*lcredit=-1\s*ocredit=0\s*type=reject_username" $file_name`
    
	tmpfile=/tmp/test1
	
	if [ -z "$var" ] ; then 	   	    
	    log_message "Required password minimum length does not exists in file $file_name. Remediation Required."		
		echo  $new_line1 >> $file_name
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to append the stanza to the file."
			RuleResult=1
		else
		    log_message "Required password minimum length value set successfully in file $file_name"		
		fi		
	elif [ ! -z "$var" ] ; then	     	    
         if [ -z "$minlen" -o -z "$str" ] ; then				     
			log_message "Required password minimum length does not exists in file $file_name. Remediation Required."						
			sed "s/$var/$new_line1/" $file_name >> $tmpfile			
			mv -f  $tmpfile $file_name
			if [ $? -ne 0 ] ; then
			   log_message "An error occurred while transferring temporary file to file $file_name."
			   RuleResult=1
			else
			   log_message "Required password minimum length value set successfully in file $file_name"
			fi		
		else	
		    log_message "Required password minimum length already exists in file $file_name. Remediation Not Required."			
		fi		
	else	    
		log_message "Required password minimum length already exists in file $file_name. Remediation Not Required."				
    fi
	
	return
}

#--------------------------------------------------------------
# rule_Privileged_Accounts_with_Non_Expiring_Passwords from policy file:
#  <cdf:title>2.1 Reusable Passwords/Privileged Accounts with Non-Expiring Passwords</cdf:title> 
#  <cdf:description>Privileged users can not have a non-expiring passwords. Users with access to the 'root' user account and Userids in groups with gid <= 99</cdf:description> 
#  <scm:violationMessage>Account {1} has invalid Password Max Age setting of: {2}, and is member of group name: {3}, GID: {4}, should be set to {5}</scm:violationMessage>
# And from coverage matrix:
#    Userids in groups with GID <= 99 
#    RHEL 6 and Debian 6, additionally userids in groups with GID >=101 and GID <= 199
# Arguments:
# The value of the password max age.
rule_Privileged_Accounts_with_Non_Expiring_Passwords()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Privileged_Accounts_with_Non_Expiring_Passwords: Privileged users can not have non-expiring passwords."
	log_message "Parameters received: $arg_string"

	if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as parameters the value of the password max age to apply in /etc/shadow."
		log_message "Exiting due to missing parameter(s)..."
		RuleResult=1
		return
	fi

	PasswordMaxAge=`echo "$arg_string" | awk '{ print $2 }'`
	# Validate the parameter (must be numeric decimal)
	if echo $PasswordMaxAge | grep "[^0-9"] 2>&1 > /dev/null
	then
		log_message "The password max age value is not a valid decimal number. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

	if [ $IsRHEL6 -eq 1 ]
	then
		max_GID=199
	else
		max_GID=99
	fi

    shadow_file="/etc/shadow" 	

    # Verify if shadow_file exists; if not, exit
	if [ ! -e $shadow_file ]
	then
	    log_message "$shadow_file not found on the system. No action performed. Exiting."
		RuleResult=1
		return
	fi

    GlobalUserIDstring=''
	log_message "Building list of users whose GIDs are between 0 and $max_GID..."
    get_userids_with_GIDs_in_specified_range 0 $max_GID
	num_of_userids=$?
	if [ $num_of_userids -eq 0 ]
	then
		log_message "Found no user with a GID within the privileged range [0-$max_GID]."
		RuleResult=1
		return
	else
		log_message "Found $num_of_userids user(s) with a GID within the privileged range [0-$max_GID]."
		log_message "List of users: $GlobalUserIDstring"
	fi
	
	userid_list="$GlobalUserIDstring"

   # Scan the shadow_file and set the password max age field (field 5) of the specified users
	processed_userids=0
	got_error=0
	while [ $processed_userids -lt $num_of_userids ]
	do
	    next_userid=`echo "$userid_list" | awk '{ print $1 }'`
		# Remove the processed userid from the list
		userid_list=`echo $userid_list | sed s,$next_userid,,`
		# Set the requested password max age for the current userid in the shadow file
		set_pwd_max_age_in_shadow_file $next_userid $PasswordMaxAge
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "Failed to set password max age in $shadow_file for user $next_userid (error = $result)."
			got_error=1
		fi
		processed_userids=`expr $processed_userids + 1`
	done
	
	if [ $got_error -ne 0 ]
	then
		RuleResult=1
	else	
		RuleResult=0
	fi			

	return
}	

#--------------------------------------------------------------
enforce_login_retries_in_file()
# This function is used by rule_Login_Retries_REDHAT_5_plus; see rule_Login_Retries_REDHAT_5_plus documentation below.
# Arguments:
# $1: file name (with complete path)
# $2: path to the file in case of file redirection (symbolic link)
# And global string variables:
# 	$GlobalLoginRetryLine1
# 	$GlobalLoginRetryLine2
# Example on RHEL66:
#		GlobalLoginRetryLine1="auth required pam_tally2.so deny=$LoginRetries"
#		GlobalLoginRetryLine2="account required pam_tally2.so"
{
	
    file_name=$1
	redirection_link=$2

    # Set the search keywords on the basis of the global string variables
	keyworda1=`echo $GlobalLoginRetryLine1 | awk '{print $1}'`
	keyworda2=`echo $GlobalLoginRetryLine1 | awk '{print $2}'`
	keyworda3=`echo $GlobalLoginRetryLine1 | awk '{print $3}'`
	keywordb1=`echo $GlobalLoginRetryLine2 | awk '{print $1}'`
	keywordb2=`echo $GlobalLoginRetryLine2 | awk '{print $2}'`
	keywordb3=`echo $GlobalLoginRetryLine2 | awk '{print $3}'`
	
    # Look in the specified file and check for the existence of any of the stanzas specified above, based on the keywords extracted from global arguments.
	# For any stanza found, replace its line the specified line
	# If none of the stanza lines is found, append the new line of the stanza to the file.
	
	# Check that the file exists
	if [ ! -e $file_name ]
	then
	    log_message "File $file_name not found. No action taken for this file."
		return 1
	fi
	# Check if the file name is a redirection; if so, use the real physical file name
	ls -l $file_name | grep "\->" 1> /dev/null
	result=$?
	if [ $result -eq 0 ]
	then
	    link_name=$file_name
	    file_name=`$ReadLinkCommand $link_name`
		echo $file_name | grep "/etc/" 1> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
		    # Path is missing in file name; add it
			file_name="$redirection_link/$file_name"
		fi
		log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
	fi

	error=0

	# 1) Look for the first stanza
	# The new line is passed in a global string variable
	GlobalStringArgument="$GlobalLoginRetryLine1"
	log_message "Checking for the presence of the keywords $keyworda1, $keyworda2 and $keyworda3 in $file_name..."
	find_and_replace_stanza_line_in_file_based_on_keywords $file_name 3 "$keyworda1" "$keyworda2" "$keyworda3"
	result1=$?
    if [ $result1 -eq 0 ]
    then
	    log_message "line with keywords $keyworda1, $keyworda2 and $keyworda3 was found and fixed in $file_name."
	else
	    log_message "keywords $keyworda1, $keyworda2 and $keyworda3 not found in $file_name."
		log_message "Adding the line [$GlobalStringArgument] to the file."
		add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "$keyworda1"
		result=$?
		if [ $result -ne 0 ]
		then
			# Paragraph not found; append the stanza line at the end of the file
			log_message "Appending the line at the end of the file..."
			echo -e "#" >> $file_name
			echo -e "# Linux remediation script adding login retry specification to $file_name:" >> $file_name
			echo -e "$GlobalStringArgument" >> $file_name
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "An error occurred while attempting to append the stanza to the file."
				error=1
			fi
		fi
	fi

	# 2) Look for the second stanza
	GlobalStringArgument="$GlobalLoginRetryLine2"
	log_message "Checking for the presence of the keywords $keywordb1, $keywordb2 and $keywordb3 in $file_name..."
	find_and_replace_stanza_line_in_file_based_on_keywords $file_name 3 "$keywordb1" "$keywordb2" "$keywordb3"
	result1=$?
    if [ $result1 -eq 0 ]
    then
	    log_message "line with keywords $keywordb1, $keywordb2 and $keywordb3 was found and fixed in $file_name."
	else
	    log_message "keywords $keywordb1, $keywordb2 and $keywordb3 not found in $file_name."
		log_message "Adding the line [$GlobalStringArgument] to the file."
		add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "$keywordb1"
		result=$?
		if [ $result -ne 0 ]
		then
			# Paragraph not found; append the stanza line at the end of the file
			log_message "Appending the line at the end of the file..."
			echo -e "#" >> $file_name
			echo -e "# Linux remediation script adding login retry specification to $file_name:" >> $file_name
			echo -e "$GlobalStringArgument" >> $file_name
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "An error occurred while attempting to append the stanza to the file."
				error=1
			fi
		fi
	fi

	return $error
}

#--------------------------------------------------------------
enforce_password_history_in_file()
# This function is used by rule_RedHat_Password_History; see rule_RedHat_Password_History documentation below.
# NOTE: the line that must be present in the file is hard coded according to the policy (except the "remember" attribute value):
#       "password required/sufficient /lib/security/pam_unix.so remember=7 use_authtok md5 shadow"
#       where we can have either "required" of "sufficient" in the string.
# The keywords we look for (in case we have to replace and existing line which does not have the correct "remember" attribute) are either:
#    password required pam_unix.so
# or
#    password sufficient pam_unix.so
# For pam_unix.so, we ignore the full path if it is present in the file.
# Arguments:
# $1: file name (with complete path)
# $2: password history value
# $3: path to the file in case of file redirection (symbolic link)
{
	
    file_name=$1
	password_history_value=$2
	redirection_link=$3
	
    # Look in the specified file and check for the existence of any of the stanzas specified above,
	# i.e. "password required pam_unix.so" stanza and, if the first one is not found, "password sufficient pam_unix.so" stanza.
	# For any stanza found, replace its line with the values specified in the policy, except that the password min history value
	# is taken from the parameter passed to this function.
	# If none of the stanza lines is found, append the new line of the stanza to the file.
	
	# Check that the file exists
	if [ ! -e $file_name ]
	then
	    log_message "File $file_name not found. No action taken for this file."
		return 1
	fi
	# Check if the file name is a redirection; if so, use the real physical file name
	ls -l $file_name | grep "\->" 1> /dev/null
	result=$?
	if [ $result -eq 0 ]
	then
	    link_name=$file_name
	    file_name=`$ReadLinkCommand $link_name`
		echo $file_name | grep "/etc/" 1> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
		    # Path is missing in file name; add it
			file_name="$redirection_link/$file_name"
		fi
		log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
	fi

	# 1) Look for the "password required pam_unix.so" stanza
	new_line1="password    required      pam_unix.so remember=$password_history_value use_authtok sha512 shadow"
	# The new line is passed in a global string variable
	GlobalStringArgument="$new_line1"
	log_message "Checking for the presence of the stanza [password required pam_unix.so] in $file_name..."
	find_and_replace_stanza_line_in_file_based_on_keywords $file_name 3 "password" "required" "pam_unix.so"
	result1=$?
    if [ $result1 -ne 0 ]
    then
	    log_message "stanza [password required pam_unix.so] was not found in $file_name."
	else
	    log_message "stanza [password required pam_unix.so] was found and fixed in $file_name."
		return 0    # ---> done
	fi

    # 2) Stanza [password required pam_unix.so] not found; look for stanza [password sufficient pam_unix.so]
	new_line2="password    sufficient      pam_unix.so remember=$password_history_value use_authtok sha512 shadow"
	# The new line is passed in a global string variable
	GlobalStringArgument="$new_line2"
	log_message "Checking for the presence of the stanza [password sufficient pam_unix.so] in $file_name..."
	find_and_replace_stanza_line_in_file_based_on_keywords $file_name 3 "password" "sufficient" "pam_unix.so"
	result1=$?
    if [ $result1 -ne 0 ]
    then
	    log_message "stanza [password sufficient pam_unix.so] was not found in $file_name."
	else
	    log_message "stanza [password sufficient pam_unix.so] was found and fixed in $file_name."
		return 0    # ---> done
	fi

   # None of the stanzas found. Add to the file. 
	error=0
	log_message "None of the stanzas were found in $file_name."
	log_message "Adding the stanza [$new_line1] to the file."
	GlobalStringArgument="$new_line1"
	add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "password"
	result=$?
	if [ $result -ne 0 ]
	then
		# Paragraph not found; append the stanza line at the end of the file
		log_message "Appending the line at the end of the file..."
		echo -e "#" >> $file_name
		echo -e "# Linux remediation script adding password minimum history stanza to $file_name:" >> $file_name
		echo -e "$new_line1" >> $file_name
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to append the stanza to the file."
			error=1
		fi
	fi

	return $error
}

#--------------------------------------------------------------
enforce_SuSE_password_history_in_file()
# This function is used by rule_SUSE_SLES_Password_History; see rule_SUSE_SLES_Password_History documentation below.
# NOTE: the line that must be present in the file is hard coded according to the policy (except the "remember" attribute value):
#       "password required/sufficient pam_unix_passwd.so remember=[value received as argument] use_authtok md5 shadow"
#       where we can have either "required" of "sufficient" in the string.
# The keywords we look for (in case we have to replace and existing line which does not have the correct "remember" attribute) are either:
#    password required pam_unix_passwd.so
# or
#    password sufficient pam_unix_passwd.so
# For pam_unix_passwd.so, we ignore the full path if it is present in the file.
# Arguments:
# $1: file name (with complete path)
# $2: password history value
# $3: path to the file in case of file redirection (symbolic link)
{
    file_name=$1
	password_history_value=$2
	redirection_link=$3
	
    # Look in the specified file and check for the existence of any of the stanzas specified above,
	# i.e. "password required pam_unix_passwd.so" stanza and, if the first one is not found, "password sufficient pam_unix_passwd.so" stanza.
	# For any stanza found, replace its line with the values specified in the policy, except that the password min history value
	# is taken from the parameter passed to this function.
	# If none of the stanza lines is found, append the new line of the stanza to the file.
	
	# Check that the file exists
	if [ ! -e $file_name ]
	then
	    log_message "File $file_name not found. No action taken for this file."
		return 1
	fi
	# Check if the file name is a redirection; if so, use the real physical file name
	ls -l $file_name | grep "\->" 1> /dev/null
	result=$?
	if [ $result -eq 0 ]
	then
	    link_name=$file_name
	    file_name=`$ReadLinkCommand $link_name`
		echo $file_name | grep "/etc/" 1> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
		    # Path is missing in file name; add it
			file_name="$redirection_link/$file_name"
		fi
		log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
	fi

	# 1) Look for the "password required pam_unix_passwd.so" stanza
	new_line1="password    required      pam_unix_passwd.so remember=$password_history_value use_authtok md5 shadow"
	# The new line is passed in a global string variable
	GlobalStringArgument="$new_line1"
	log_message "Checking for the presence of the stanza [password required pam_unix_passwd.so] in $file_name..."
	find_and_replace_stanza_line_in_file_based_on_keywords $file_name 3 "password" "required" "pam_unix_passwd.so"
	result1=$?
    if [ $result1 -ne 0 ]
    then
	    log_message "stanza [password required pam_unix_passwd.so] was not found in $file_name."
	else
	    log_message "stanza [password required pam_unix_passwd.so] was found and fixed in $file_name."
		return 0    # ---> done
	fi

    # 2) Stanza [password required pam_unix_passwd.so] not found; look for stanza [password sufficient pam_unix_passwd.so]
	new_line2="password    sufficient      pam_unix_passwd.so remember=$password_history_value use_authtok md5 shadow"
	# The new line is passed in a global string variable
	GlobalStringArgument="$new_line2"
	log_message "Checking for the presence of the stanza [password sufficient pam_unix_passwd.so] in $file_name..."
	find_and_replace_stanza_line_in_file_based_on_keywords $file_name 3 "password" "sufficient" "pam_unix_passwd.so"
	result1=$?
    if [ $result1 -ne 0 ]
    then
	    log_message "stanza [password sufficient pam_unix_passwd.so] was not found in $file_name."
	else
	    log_message "stanza [password sufficient pam_unix_passwd.so] was found and fixed in $file_name."
		return 0    # ---> done
	fi

   # None of the stanzas found. Add to the file. 
	error=0
	log_message "None of the stanzas were found in $file_name."
	log_message "Adding the stanza [$new_line1] to the file."
	GlobalStringArgument="$new_line1"
	add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "password"
	result=$?
	if [ $result -ne 0 ]
	then
		# Paragraph not found; append the stanza line at the end of the file
		log_message "Appending the line at the end of the file..."
		echo -e "#" >> $file_name
		echo -e "# Linux remediation script adding password minimum history stanza to $file_name:" >> $file_name
		echo -e "$new_line1" >> $file_name
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to append the stanza to the file."
			error=1
		fi
	fi

	return $error
}

#--------------------------------------------------------------
# rule_RedHat_Password_History from policy file:
#  <cdf:requires idref="PlatformInfoV2" /> 
#  <cdf:requires idref="PamV1" /> 
#  <cdf:title>2.1 Reusable Passwords/RedHat Password History</cdf:title> 
#  <cdf:description>Prevent reuse of passwords on REDHAT - password required/sufficient /lib/security/pam_unix.so remember=7 use_authtok md5 shadow.
#      If /etc/pam.d/system-auth exists, this is the control file. Otherwise, it must appear in /etc/pam.d/passwd and /etc/pam.d/login.</cdf:description> 
#  <scm:violationMessage>PAM settings must contain either Password Required/Sufficient and remember={1} and use_authtok, md5 and shadow arguments for pam_unix.so.</scm:violationMessage> 
# AND from ITCS104 coverage requirement matrix (more detailed):
#  RedHat Enterprise Linux/RedHat Application Server (any version):
#  password $CONTROL pam_unix.so remember=7 use_authtok md5 shadow
#  1) This statement must appear in /etc/pam.d/system-auth, if the file exists. 
#  2) If /etc/pam.d/system-auth does NOT exist, this statement must appear in /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
#  Note: $CONTROL in the following examples must be one of "required", or "sufficient".
#  Note: Use of full path and/or $ISA to pam modules is optional. 
#  Note: It is acceptable to replace "md5" with "sha512" in the settings above.
#  3) Note: For Red Hat Enterprise Linux V6 and later: If the system-auth file is in use, this
#  control must ADDITIONALLY be applied to the /etc/pam.d/password-auth file.
#
# Argument: value of password minimum history.
rule_RedHat_Password_History()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_RedHat_Password_History: RedHat Linux Minimum Password History (prevent re-use of passwords before a minimum number of pwd changes)."
	log_message "Parameters received: $arg_string"

	# Check that we are running on RedHat
	if [ $IsRedHat -eq 0 ]
	then
	    log_message "This rule function can only be run on RedHat Linux. Exiting."
		RuleResult=1
		return
	fi
    
	if [ $num_of_arguments -lt 2 ]
    then
		log_message "This rule expects as second parameter the value to apply as Minimum Password History."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 7 as parameter."
		PasswordMinHistory=7
	else 
		PasswordMinHistory=`echo "$arg_string" | awk '{ print $2 }'`
	fi
 	
	# Validate the parameter (must be numeric decimal)
	if echo $PasswordMinHistory | grep "[^0-9"] 2>&1 > /dev/null
	then
		log_message "The password min history value is not a valid decimal number. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

    #  1) The statement must appear in /etc/pam.d/system-auth, if the file exists. 
	file_name="/etc/pam.d/system-auth"
	
	# Check that the file exists
	error=0
	if [ -e $file_name ]
	then
	    log_message "Processing file $file_name..."
        enforce_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to fix the stanza in the file $file_name."
			error=1
		fi
		# If on RedHat 6 or later, if the system-auth file is in use, this
		# control must ADDITIONALLY be applied to the /etc/pam.d/password-auth file.
		if [ $RHEL6_or_later -eq 1 ]
		then
		    file_name="/etc/pam.d/password-auth"
	        log_message "We are running on Red Hat 6 or later, also processing file $file_name..."
			enforce_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "An error occurred while attempting to fix the stanza in the file $file_name."
				error=1
			fi
		fi
		RuleResult=$error
		return
	else
	    log_message "File $file_name not found. Will process other files as specified in the requirements."
	fi

    # 2) If /etc/pam.d/system-auth does NOT exist, this statement must appear in /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
    error=0
	file_name="/etc/pam.d/login"
	log_message " "
	log_message "Processing file $file_name..."
	enforce_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "An error occurred while attempting to fix the stanza in the file $file_name."
		error=1
	fi
	file_name="/etc/pam.d/passwd"
	log_message " "
	log_message "Processing file $file_name..."
	enforce_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "An error occurred while attempting to fix the stanza in the file $file_name."
		error=1
	fi
	file_name="/etc/pam.d/sshd"
	log_message " "
	log_message "Processing file $file_name..."
	enforce_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "An error occurred while attempting to fix the stanza in the file $file_name."
		error=1
	fi
	file_name="/etc/pam.d/su"
	log_message " "
	log_message "Processing file $file_name..."
	enforce_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "An error occurred while attempting to fix the stanza in the file $file_name."
		error=1
	fi
	
	RuleResult=$error
	return
}

#--------------------------------------------------------------
# rule_SUSE_SLES_Password_History from policy file:
#  <cdf:title>2.1 Reusable Passwords/SUSE\SLES Password History</cdf:title> 
#  <cdf:description>Prevent reuse of passwords on SLES and SUSE
# - Option 1: password $CONTROL pam_unix2.so md5
#             password $CONTROL pam_pwcheck.so remember=8
# - Option 2: password $CONTROL pam_unix_passwd.so remember=7 use_authtok md5 shadow
# Additional requirements for SuSE SLES/SLED 10 and SuSE SLES 9:
#             md5 remember=8 must be in /etc/security/pam_pwcheck.conf
#             password: md5 shadow must be in /etc/security/pam_unix2.conf</cdf:description> 
# AND from ITCS104 coverage requirement matrix (more detailed):
# Row 19 and 20: see also row 20 in matrix (not pasted here)
# SLES: /etc/pam.d/common-password must exist and include these one of these two settings
# Option 1 (include both):
# password $CONTROL pam_unix2.so md5
# password $CONTROL pam_pwcheck.so remember=8
# Option 2:
# password $CONTROL pam_unix_passwd.so remember=7 use_authtok md5 shadow
#
# The statements from Option 1 or Option 2 must appear in /etc/pam.d/common-password, if the file exists. 
# If /etc/pam.d/common-password does NOT exist, the statements from Option 1 or Option 2 must appear in
#   /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
# 
# Additional requirements SLES:
# 
# md5 remember=8 must be in /etc/security/pam_pwcheck.conf 
# password: md5 shadow must be in /etc/security/pam_unix2.conf
# 
# Note: $CONTROL in the following examples must be one of "required", or "sufficient".
# Note: Use of full path and/or $ISA to pam modules is optional. 
# Note: It is acceptable to replace "md5" with "sha512" in the settings above.
# Argument: value of password minimum history.
# IMPORTANT: this rule is coded to implement option 2 described above.
# ALSO IMPORTANT: there appears to be some inconsistency in the requirements where in some places it is mentionned
#    a value of 7, and in other places a value of 8. We will implement the most stringent value: 8 as default value.
rule_SUSE_SLES_Password_History()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_SUSE_SLES_Password_History: SuSE/SLES Minimum Password History (prevent re-use of passwords before a minimum number of pwd changes)."
	log_message "Parameters received: $arg_string"
	
	# Check that we are running on SuSE
	if [ $IsSUSE -eq 0 ]
	then
	    log_message "This rule function can only be run on SuSE Linux. Exiting."
		RuleResult=2
		return
	fi

    if [ $num_of_arguments -lt 2 ]
    then
		log_message "This rule expects as second parameter the value to apply as Minimum Password History."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		PasswordMinHistory=8
		log_message "No 2nd parameter was received. We will use $PasswordMinHistory as parameter."
	else 
		PasswordMinHistory=`echo "$arg_string" | awk '{ print $2 }'`
	fi
 	
	# Validate the parameter (must be numeric decimal)
	if echo $PasswordMinHistory | grep "[^0-9"] 2>&1 > /dev/null
	then
		log_message "The password min history value is not a valid decimal number. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

    # IMPORTANT: THIS RULE IMPLEMENTS OPTION 2 DESCRIBED ABOVE
	# Option 2:
	# password $CONTROL pam_unix_passwd.so remember=7 use_authtok md5 shadow
	#
	# The statement must appear in /etc/pam.d/common-password, if the file exists. 
	# If /etc/pam.d/common-password does NOT exist, the statement must appear in
	#   /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
	# 
	# Additional requirements SLES:
	# md5 remember=8 must be in /etc/security/pam_pwcheck.conf 
	# password: md5 shadow must be in /etc/security/pam_unix2.conf
	# 
	# Note: $CONTROL in the following examples must be one of "required", or "sufficient".

    #  1) The statement must appear in /etc/pam.d/common-password, if the file exists. 
	file_name="/etc/pam.d/common-password"
	
	# Check that the file exists
	if [ -e $file_name ]
	then
	    log_message "Processing file $file_name..."
        enforce_SuSE_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to fix the stanza in the file $file_name."
			RuleResult=1
			return
		else
			# Additional requirements SLES:
			# md5 remember=8 must be in /etc/security/pam_pwcheck.conf 
			# password: md5 shadow must be in /etc/security/pam_unix2.conf
			grep "SUSE Linux Enterprise Server" /etc/SuSE-release 1> /dev/null 2>&1
			result=$?
			if [ $result -eq 0 ]
			then
				file_name="/etc/security/pam_pwcheck.conf"
				log_message "Additional requirement on SLES: md5 remember=8 must be in $file_name"
				log_message "Processing file $file_name..."
				if [ -e $file_name ]
				then
					grep "md5 remember=$PasswordMinHistory" $file_name | grep -v "#" 1> /dev/null 2>&1
					result=$?
					if [ $result -eq 0 ]
					then
						log_message "Line [md5 remember=$PasswordMinHistory] already in file $file_name"
					else
						log_message "Appending line [md5 remember=$PasswordMinHistory] to the file $file_name"
						echo "# Linux ITCS104 remediation script appending line [md5 remember=$PasswordMinHistory] to the file" >> $file_name
						echo "md5 remember=$PasswordMinHistory" >> $file_name
					fi
				else
					log_message "$file_name not found. Creating it and inserting the line [md5 remember=$PasswordMinHistory]"
					echo "# Linux ITCS104 remediation script creating $file_name and inserting line [md5 remember=$PasswordMinHistory] to the file" > $file_name
					echo "md5 remember=8" >> $file_name
				fi
				
				file_name="/etc/security/pam_unix2.conf"
				log_message "Additional requirement on SLES: password: md5 shadow must be in $file_name"
				log_message "Processing file $file_name..."
				if [ -e $file_name ]
				then
					grep "password: md5 shadow" $file_name | grep -v "#" 1> /dev/null 2>&1
					result=$?
					if [ $result -eq 0 ]
					then
						log_message "Line [password: md5 shadow] already in file $file_name"
					else
						log_message "Appending line [password: md5 shadow] to the file $file_name"
						echo "# Linux ITCS104 remediation script appending line [password: md5 shadow] to the file" >> $file_name
						echo "password: md5 shadow" >> $file_name
					fi
				else
					log_message "$file_name not found. Creating it and inserting the line [password: md5 shadow]"
					echo "# Linux ITCS104 remediation script creating $file_name and inserting line [password: md5 shadow] to the file" > $file_name
					echo "password: md5 shadow" >> $file_name
				fi
			fi
		fi
		RuleResult=0
		return
	fi

	# Coming here means that /etc/pam.d/common-password does not exist. Otherwise we would have exited the function already.
	log_message "File $file_name not found. Will process other files as specified in the requirements."
	log_message "List of files to process: /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su."

	# 2) If /etc/pam.d/common-password does NOT exist, the statement must appear in
	#   /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
    error=0
	file_name="/etc/pam.d/login"
	log_message " "
	log_message "Processing file $file_name..."
	enforce_SuSE_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "An error occurred while attempting to fix the stanza in the file $file_name."
		error=1
	fi
	file_name="/etc/pam.d/passwd"
	log_message " "
	log_message "Processing file $file_name..."
	enforce_SuSE_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "An error occurred while attempting to fix the stanza in the file $file_name."
		error=1
	fi
	file_name="/etc/pam.d/sshd"
	log_message " "
	log_message "Processing file $file_name..."
	enforce_SuSE_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "An error occurred while attempting to fix the stanza in the file $file_name."
		error=1
	fi
	file_name="/etc/pam.d/su"
	log_message " "
	log_message "Processing file $file_name..."
	enforce_SuSE_password_history_in_file $file_name $PasswordMinHistory "/etc/pam.d"
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "An error occurred while attempting to fix the stanza in the file $file_name."
		error=1
	fi
	
	RuleResult=$error
	return
}

#--------------------------------------------------------------
# rule_Business_Use_Notice_Required from policy file:
#  <cdf:requires idref="motd" /> 
#  <cdf:requires idref="FileSearchv1-etcissue" /> 
#  <cdf:title>3.1 Business Use Notice/Business Use Notice Required</cdf:title> 
#  <cdf:description>Business Use Notice is required: /etc/motd must exist and contain correct Business Use Notice.
#         IBMs internal systems must only be used for conducting IBMs business or for purposes authorized by IBM management.</cdf:description> 
# Arguments:
#   rule_Business_Use_Notice_Required "<Business Use Notice text in double quotes>"
rule_Business_Use_Notice_Required()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	file_name="/etc/motd"
	log_message "rule_Business_Use_Notice_Required: Business Use Notice/Business Use Notice Required in $file_name"
	log_message "Parameters received: $arg_string"

	if [ $num_of_arguments -lt 2 ]
    then
		log_message "This rule expects as parameter the Business Use Notice text in double quotes."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use the following as Business Use Notice:"
		log_message "IBM's internal systems must only be used for conducting IBM's business or for purposes authorized by IBM management."
		business_use_notice="IBM's internal systems must only be used for conducting IBM's business or for purposes authorized by IBM management."
    else
	    # Take out the rule_ID from the argument string to get the Business Use Notice text.
		arg_string=`echo $arg_string | sed s,"rule_11 ",,`
		# This rule can also be called by ITSSCSD rule_112; if it is the case, take that out also
		arg_string=`echo $arg_string | sed s,"rule_112 ",,`
		# Take out the rule name argument
		arg_string=`echo $arg_string | sed s,"rule_Business_Use_Notice_Required ",,`
		business_use_notice="$arg_string"
	fi

    # Verify if /etc/motd exists; if not, create it
	if [ ! -e $file_name ]
	then
	    log_message "$file_name not found on the system. Creating it."
		touch $file_name
		chmod 0644 $file_name
	fi

	# Insert the Business Use Notice in the file if it is not already there
	grep -i "$business_use_notice" $file_name 1>/dev/null 2>&1
	result=$?
	if [ $result -eq 0 ]
	then
	    log_message "The Business Use Notice text has been found in $file_name. No remediation needed."
	else
		log_message "Inserting the following Business Use Notice in $file_name:"
		log_message "$business_use_notice"
		echo "$business_use_notice" >> $file_name
		result=$?
	fi

	RuleResult=$result

	return
}	

#--------------------------------------------------------------
# Rule 12 from policy file:
#- <cdf:Rule id="12">
#  <cdf:requires idref="motd" /> 
#  <cdf:requires idref="FileSearchv1-etcissue" /> 
#  <cdf:title>3.1 Business Use Notice/Business Use Notice Required - USONLY</cdf:title> 
#  <cdf:description>United States Business Use Notice is required: /etc/motd must exist and contain correct Business Use Notice.
#      IBMs internal systems must only be used for conducting IBMs business or for purposes authorized by IBM management. Use is subject to audit at any time by IBM management.</cdf:description> 
# Arguments:
#   rule_12 "<Business Use Notice text in double quotes>"
rule_12()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	file_name="/etc/motd"
	log_message "rule_12: Business Use Notice/Business Use Notice Required - USONLY; in $file_name"
	log_message "Parameters received: $arg_string"

	if [ $num_of_arguments -lt 2 ]
    then
		log_message "This rule expects as parameter the Business Use Notice text in double quotes."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use the following as Business Use Notice:"
		log_message "IBM's internal systems must only be used for conducting IBM's business or for purposes authorized by IBM management. Use is subject to audit at any time by IBM management."
		business_use_notice="IBM's internal systems must only be used for conducting IBM's business or for purposes authorized by IBM management. Use is subject to audit at any time by IBM management."
    else
	    # Take out the rule_ID from the argument string to get the Business Use Notice text.
		arg_string=`echo $arg_string | sed s,"rule_12 ",,`
		business_use_notice="$arg_string"
	fi

    # Verify if /etc/motd exists; if not, create it
	if [ ! -e $file_name ]
	then
	    log_message "$file_name not found on the system. Creating it."
		touch $file_name
		chmod 0644 $file_name
	fi

	# Insert the Business Use Notice in the file if it is not already there
	grep -i "$business_use_notice" $file_name 1>/dev/null 2>&1
	result=$?
	if [ $result -eq 0 ]
	then
	    log_message "The Business Use Notice text has been found in $file_name. No remediation needed."
	else
		log_message "Inserting the following Business Use Notice in $file_name"
		log_message "$business_use_notice"
		echo "$business_use_notice" >> $file_name
		result=$?
	fi

	RuleResult=$result

	return
}	

#--------------------------------------------------------------
# rule_Default_UMASK_Restriction from policy file:
#  <cdf:requires idref="UmaskExtV1" /> 
#  <cdf:requires idref="PlatformInfoV2" /> 
#  <cdf:title>3.2 User Resources/Default UMASK Restriction</cdf:title> 
#  <cdf:description>Default UMASK must be x77</cdf:description>
#
# And from requirement coverage matrix:
#  Either does not override the UMASK for the user, or encodes:
#	  umask 077
#  as the UMASK setting.
#
#Note: The requirement is that the skeleton file complies to ensure an ID is created with a secure umask. 
#It is understood that the user may modify this file once it is copied into their $HOME.
#
#Note: There is no requirement these files exist; but if they do, they must conform to the requirement.
# Arguments:
#   as of today, Feb 10th 2016, we should receive as parameters "$(Default Umask), $(SkelFiles)"
rule_Default_UMASK_Restriction()
{
    arg_string=$*
    num_of_arguments=`echo "$arg_string" | wc -w`;
	
	log_message "num_of_arguments $num_of_arguments"
	log_message "Objective :  3.2 User Resources/Default UMASK Restriction"
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 3 ]
   then
		log_message "This rule expects as parameters (Default Umask) (SkelFiles)"
	    log_message "Exiting due to missing parameter(s)..."
		RuleResult=1
		return
	else 
		umask=`echo "$arg_string" | awk '{ print $2 }'`
		skelFiles=`echo "$arg_string" | awk '{ print $3 }'`
		# cut all strong quotes
		skelFiles=`echo $skelFiles | sed 's/'"'"'//g'`
		# replace comma with space so we can use it in for cycle
		skelFiles=`echo $skelFiles | sed 's/,/ /g'`
		
		# Validate the mask: must be an octal value
		if echo $umask | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The umask value is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
	
	for skelFile in $skelFiles ;
	do
		# Verify if $skelFile exists; 
		if [ ! -e $skelFile ]
		then
			log_message "$skelFile not found on the system."
			continue 
		fi
		
		# Verify if $skelFile already has the umask keyword and, if so, log the current value(s)
		# Note that there may be more than one occurrence in the file as assignments may be conditional.
		keyword_found=`grep "umask" $skelFile | grep -v "#" | wc -l 2> /dev/null`
		if [ $keyword_found -gt 0 ]
		then
			# umask keyword found in the file
			log_message "Found $keyword_found occurrence(s) of the keyword umask in $skelFile:"
			grep_output=`grep "umask" $skelFile | grep -v "#"`
			log_message "$grep_output"
			# Replace the existing definitions by the new one in the file
			log_message "Setting umask to $umask in $skelFile."
			replace_value_in_file_based_on_keyword $skelFile "umask" $umask
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "An error occurred while attempting to set umask to $umask in $skelFile."
				RuleResult=1
				return
			fi			
		else
			log_message "The umask definition was not found or is commented out in the file $skelFile." 
		fi
	done

	# Success
	RuleResult=0
	return
}


#--------------------------------------------------------------
# rule_Login_defs_umask_restriction from policy file:
#  <cdf:requires idref="LoginDefsV1" /> 
#  <cdf:title>3.2 User Resources/Login.defs umask restriction</cdf:title> 
#  <cdf:description>UMASK=077</cdf:description> 
# NOTE: /etc/login.defs must include this line: UMASK=077 
# Arguments:
#   this rule expects as second parameter the value to apply as UMASK.
rule_Login_defs_umask_restriction()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Login_defs_umask_restriction: /etc/login.defs UMASK"
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as UMASK."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 077 as parameter."
		UMASK="077"
	else 
		UMASK=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the mask: must be an octal value
		if echo $UMASK | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The UMASK value is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
    login_defs_file="/etc/login.defs" 	

    # Verify if /etc/login.defs exists; if not, create it with -rw-r--r-- permissions
	if [ ! -e $login_defs_file ]
	then
	    log_message "$login_defs_file not found on the system. Creating it."
		echo "# Policy remediation script creating $login_defs_file with minimal required information for ITCS104 compliance." > $login_defs_file
		echo "#" >> $login_defs_file
		chmod 0644 $login_defs_file
	fi

    # Verify if /etc/login.defs already has the UMASK keyword and, if so, log the current value
    grep "UMASK" $login_defs_file | grep -v "#" 1> /dev/null 2>&1
    keyword_found=$?
    if [ $keyword_found -eq 0 ]
    then
	    # UMASK keyword found in the file
	    current_value_in_file=`grep "UMASK" $login_defs_file | grep -v "#" | awk '{print $2}'`
        log_message "Current value of UMASK in $login_defs_file = $current_value_in_file."
		if [ $current_value_in_file == "$UMASK" ]
		then
		    log_message "This value corresponds to the requested value; does not need to be changed. Exiting function."
			RuleResult=0
			return
		else
		    # Replace the existing definition by the new one in the file
	        log_message "Setting UMASK to $UMASK in $login_defs_file."
		    replace_value_in_file_based_on_keyword $login_defs_file "UMASK" $UMASK
			result=$?
            if [ $result -ne 0 ]
            then
	            log_message "An error occurred while attempting to set UMASK to $UMASK in $login_defs_file."
				RuleResult=1
				return
            fi			
		fi
    else
		log_message "The UMASK definition was not found or is commented out in the file $login_defs_file. Appending it at the end of the file." 
	    log_message "Setting UMASK to $UMASK."
		echo -e "# The permission mask is initialized to this value. If not specified," >> $login_defs_file
		echo -e "# the permission mask will be initialized to 022." >> $login_defs_file
		echo -e "UMASK\t$UMASK" >> $login_defs_file
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to append UMASK $UMASK in $login_defs_file."
			RuleResult=1
			return
		fi
    fi

	# Success
	RuleResult=0
	return
}

#--------------------------------------------------------------
# rule_csh_login_File_Restriction from policy file:
#  <cdf:requires idref="FileSearchv1-etc\csh.login" /> 
#  <cdf:title>3.2 User Resources/\etc\csh.login File Restriction</cdf:title> 
#  <cdf:description>File must exist, and must trigger an invocation of source /etc/profile.d/IBMsinit.csh</cdf:description>
# And from the ITCS104 coverage requirement matrix:
#    File must exist, and must trigger an invocation of source /etc/profile.d/IBMsinit.csh
#    and does not set/reset umask after that invocation.
#    Note: Some systems will have /etc/csh.login invoke /etc/csh.login.local; if that is the case, it is permissible
#    for the 'call' of /etc/profile.d/IBMsinit.csh to be done from /etc/csh.login.local.
# Since this rule is being called it implies that there is a violation of the rule, and therefore the possible cases are:
# 1) /etc/csh.login does not exist;
#    action to take: create the file and insert in it the call to /etc/profile.d/IBMsinit.csh;
# 2) /etc/csh.login exists but does not invoke /etc/profile.d/IBMsinit.csh;
#    action to take: append to the file the call to /etc/profile.d/IBMsinit.csh;
# 3) /etc/csh.login exists but changes the umask definition after invoking /etc/profile.d/IBMsinit.csh;
#    action to take: comment out the line(s) that set/reset the umask after the invocation of  /etc/profile.d/IBMsinit.csh.
# NOTE: at this stage, we do not consider the case that umask can be touched by /etc/csh.login.local which could be called by /etc/csh.login.
# Arguments:
#   this rule expects no second parameter.
rule_csh_login_File_Restriction()
{
    arg_string=$1

    csh_login_file="/etc/csh.login"
    IBMsinit_file="/etc/profile.d/IBMsinit.csh" 	

	log_message "rule_csh_login_File_Restriction: $csh_login_file must exist and must trigger an invocation of source $IBMsinit_file"
	log_message "         and must not set/reset umask after that invocation."
	log_message "Parameters received: $arg_string"

    # CASE 1: verify if csh_login_file exists; if not, create it with -rw-r--r-- permissions and insert the source command in it
	#         unless we detect that the file is there but was renamed by the make-violations script.
	if [ ! -e $csh_login_file ]
	then
		violation_file_name="/etc/csh.login_renamed_by_script_scm511-itcs104v12.1-LINUX_make_violations"
		if [ -e $violation_file_name ]
		then
			log_message "$csh_login_file not found on the system but $violation_file_name was found."
			log_message "Restoring $csh_login_file from $violation_file_name"
			mv $violation_file_name $csh_login_file
		else
			log_message "$csh_login_file not found on the system. Creating it and inserting in it the invocation of source $IBMsinit_file."
			echo "# Policy remediation script creating $csh_login_file with invocation of $IBMsinit_file." > $csh_login_file
			echo "#" >> $csh_login_file
			echo "source $IBMsinit_file" >> $csh_login_file
			chmod 0644 $csh_login_file
			RuleResult=0
			return
		fi
	fi

    # Coming here means that the csh_login_file exists. Check if it invokes IBMsinit_file.
	# NOTE: there are 2 ways in which csh.login could invoke IBMsinit:
	#    1) explicit call, i.e. "source /etc/profile.d/IBMsinit.csh"
	#    2) using a wildcard such as in:
    #    foreach i ( /etc/profile.d/*.csh )
    #            if ( -r "$i" ) then
    #                            if ($?prompt) then
    #                                  source "$i"
    #                            else
    #                                  source "$i" >& /dev/null
    #                            endif
    #            endif
    #    end
	#
	# First, look for an explicit call
    grep "$IBMsinit_file" $csh_login_file | grep -v "#" 1> /dev/null 2>&1
    invocation_found=$?
    if [ $invocation_found -ne 0 ]
    then
		# Explicit call not found. Check for a call with a wildcard DEPENDING on variable flag (to address Defect 138243).
		# At the moment, the health-check collectors are not handling the case of wildcard and report a violation, so we do
		# not accept wildcard call as sufficient.
		accept_wildcard_invocation=0
		if [ $accept_wildcard_invocation -eq 1 ]
		then
			log_message "Explicit invocation of $IBMsinit_file not found in $csh_login_file. Verifying if a wildcard is used to source the file."
			check_if_file_called_with_wildcard $csh_login_file "/etc/profile.d/\*.csh"
			result=$?
			if [ $result -ne 0 ]
			then
				# CASE 2: the invocation of IBMsinit_file is not there; append it at the end of the file.
				log_message "No invocation found using a wildcard. Inserting in $csh_login_file the invocation of source $IBMsinit_file."
				echo "# Policy remediation script inserting in $csh_login_file the invocation of source $IBMsinit_file." >> $csh_login_file
				echo "#" >> $csh_login_file
				echo "source $IBMsinit_file" >> $csh_login_file
				echo "#" >> $csh_login_file
				RuleResult=0
				return
			else
				log_message "$csh_login_file seems to invoke source $IBMsinit_file through the use of wildcard."
			fi
		else
			log_message "Inserting in $csh_login_file the invocation of source $IBMsinit_file."
			echo "# Policy remediation script inserting in $csh_login_file the invocation of source $IBMsinit_file." >> $csh_login_file
			echo "#" >> $csh_login_file
			echo "source $IBMsinit_file" >> $csh_login_file
			echo "#" >> $csh_login_file
			RuleResult=0
			return
		fi
	fi

	# Coming here means that the csh_login_file exists and it does invoke IBMsinit_file. Therefore the violation
	# must be the last possible case.
	# CASE 3: /etc/csh.login exists but changes the umask definition after invoking /etc/profile.d/IBMsinit.csh;
	#    action to take: comment out the line(s) that set/reset the umask in csh_login_file. 
	log_message "The invocation of source $IBMsinit_file has been found in $csh_login_file, either explicitly or through the use of a wildcard."
	log_message "Therefore we consider that the violation is that $csh_login_file sets/resets umask."
	log_message "Verifying the presence of the umask command(s) in $csh_login_file..."

	# Note that there may be more than one occurrence in the file as assignments may be conditional.
	file_to_check="$csh_login_file"
    keyword_found=`grep "umask" $file_to_check | grep -v "#" | wc -l 2> /dev/null`
    if [ $keyword_found -gt 0 ]
    then
	    # umask keyword found in the file
		log_message "Found $keyword_found occurrence(s) of the keyword umask in $file_to_check:"
	    grep_output=`grep "umask" $file_to_check | grep -v "#"`
        log_message "$grep_output"
		# Comment out the umask lines.
		log_message "Commenting out the line(s) invoking the umask command."
		comment_out_lines_in_file_based_on_keyword $file_to_check "umask"
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to comment out umask line(s) in $file_to_check."
			RuleResult=1
			return
		fi			
    else
		log_message "The umask definition was not found or is commented out in the file $file_to_check." 
	    log_message "Remediation for this rule is not needed."
		RuleResult=0
		return
    fi

    # Success
	RuleResult=0
	return

}

#--------------------------------------------------------------
# rule_etc_profile_File_Restriction from policy file:
# <cdf:title>3.2 User Resources/\etc\profile File Restriction</cdf:title> 
#  <cdf:description>File must exist, and must trigger an invocation of . /etc/profile.d/IBMsinit.sh</cdf:description> 
# And from the ITCS104 coverage requirement matrix:
# /etc/profile.d/IBMsinit.sh
# Default UMASK value.
# File must exist, and contain at least:
# if [ $UID -gt 199 ]; then
# umask 077
# fi
# Since this rule is being called it implies that there is a violation of the rule, and therefore the possible cases are:
# 1) /etc/profile does not exist;
#    action to take: create the file and insert in it the call to /etc/profile.d/IBMsinit.sh;
# 2) /etc/profile exists but does not invoke /etc/profile.d/IBMsinit.sh;
#    action to take: append to the file the call to /etc/profile.d/IBMsinit.sh;
# 3) /etc/profile.d/IBMsinit.sh does not exist: create it and insert in it the lines:
#     if [ $UID -gt 199 ]; then
#     umask 077
#     fi
# 4) /etc/profile exists but changes the umask definition after invoking /etc/profile.d/IBMsinit.sh;
#    action to take: comment out the line(s) that set/reset the umask after the invocation of  /etc/profile.d/IBMsinit.sh.
#    NOTE: this action is inherited from rule_csh_login_File_Restriction but it is not explicitly stated in the policy; we make it dependent on a variable flag
# Arguments:
#   this rule expects no second parameter.
rule_etc_profile_File_Restriction()
{
    arg_string=$1

    sh_login_file="/etc/profile"
    IBMsinit_file="/etc/profile.d/IBMsinit.sh" 	

	log_message "rule_etc_profile_File_Restriction: $sh_login_file must exist and must trigger an invocation of source $IBMsinit_file."
	log_message "Parameters received: $arg_string"

    check_if_umask_changed_in_profile=0
    check_if_invocation_of_IBMsinit_is_in_the_file=1

    # CASE 1: verify if sh_login_file exists; if not, create it with -rw-r--r-- permissions and insert the source command in it
	#         unless we detect that the file is there but was renamed by the make-violations script.
	if [ ! -e $sh_login_file ]
	then
		violation_file_name="/etc/profile_renamed_by_script_scm511-itcs104v12.1-LINUX_make_violations"
		if [ -e $violation_file_name ]
		then
			log_message "$sh_login_file not found on the system but $violation_file_name was found."
			log_message "Restoring $sh_login_file from $violation_file_name"
			mv $violation_file_name $sh_login_file
		else
			log_message "$sh_login_file not found on the system. Creating it and inserting in it the invocation of source $IBMsinit_file."
			echo "# /etc/profile" > $sh_login_file
			echo "# ITCS104 policy remediation script creating $sh_login_file with invocation of $IBMsinit_file." >> $sh_login_file
			echo "#" >> $sh_login_file
			echo ". $IBMsinit_file" >> $sh_login_file
			chmod 0644 $sh_login_file
			check_if_invocation_of_IBMsinit_is_in_the_file=0
		fi
	fi

    # Coming here means that the sh_login_file exists, or we have restored it or created it.
    # If we have not just created it, check if it invokes IBMsinit_file.
	# NOTE: there are 2 ways in which sh_login_file could invoke IBMsinit:
	#    1) explicit call, i.e. ". /etc/profile.d/IBMsinit.sh"
	#    2) using a wildcard such as in:
	# for i in /etc/profile.d/*.sh ; do
	#     if [ -r "$i" ]; then
	#         if [ "${-#*i}" != "$-" ]; then
	#             . "$i"
	#         else
	#             . "$i" >/dev/null 2>&1
	#         fi
	#     fi
	# done
	#
	# First, look for an explicit call
    if [ $check_if_invocation_of_IBMsinit_is_in_the_file -eq 1 ]
	then
		grep "$IBMsinit_file" $sh_login_file | grep -v "#" 1> /dev/null 2>&1
		invocation_found=$?
		if [ $invocation_found -ne 0 ]
		then
			# Explicit call not found. Check for a call with a wildcard DEPENDING on variable flag (to address Defect 138246).
			# At the moment, the health-check collectors are not handling the case of wildcard and report a violation, so we do
			# not accept wildcard call as sufficient.
			accept_wildcard_invocation=0
			if [ $accept_wildcard_invocation -eq 1 ]
			then
				log_message "Explicit invocation of $IBMsinit_file not found in $sh_login_file. Verifying if a wildcard is used to source the file."
				check_if_sh_file_called_with_wildcard $sh_login_file "/etc/profile.d/\*.sh"
				result=$?
				if [ $result -ne 0 ]
				then
					# CASE 2: the invocation of IBMsinit_file is not there; append it at the end of the file.
					log_message "No invocation found using a wildcard. Inserting in $sh_login_file the invocation of . $IBMsinit_file."
					echo "# ITCS104 policy remediation script inserting in $sh_login_file the invocation of . $IBMsinit_file." >> $sh_login_file
					echo "#" >> $sh_login_file
					echo ". $IBMsinit_file" >> $sh_login_file
					echo "#" >> $sh_login_file
				else
					log_message "$sh_login_file seems to invoke source $IBMsinit_file through the use of wildcard."
				fi
			else
				log_message "Inserting in $sh_login_file the invocation of . $IBMsinit_file."
				echo "# ITCS104 policy remediation script inserting in $sh_login_file the invocation of . $IBMsinit_file." >> $sh_login_file
				echo "#" >> $sh_login_file
				echo ". $IBMsinit_file" >> $sh_login_file
				echo "#" >> $sh_login_file
			fi
		else
		    log_message "The invocation of . $IBMsinit_file was found in $sh_login_file"
		fi
	fi

# 3) Now we have taken care of the sh_login_file. Check if /etc/profile.d/IBMsinit.sh exists: if not, create it and insert in it the lines:
#     if [ $UID -gt 199 ]; then
#     umask 077
#     fi
	if [ ! -e $IBMsinit_file ]
	then
		log_message "$IBMsinit_file does not exist. Creating it and inserting umask instructions as per requirements."
		echo "#!sh" > $IBMsinit_file
		echo "# ITCS104 policy remediation script creating $IBMsinit_file." >> $IBMsinit_file
		echo "#" >> $IBMsinit_file
		echo "if [ \$UID -gt 199 ]; then" >> $IBMsinit_file
		echo "    umask 077" >> $IBMsinit_file
		echo "fi" >> $IBMsinit_file
		chmod 0755 $IBMsinit_file
	fi

	# Check the last possible case.
	# CASE 4: sh_login_file exists but changes the umask definition after invoking /etc/profile.d/IBMsinit.sh;
	#    action to take: comment out the line(s) that set/reset the umask in sh_login_file.
    #    NOTE: this action is inherited from rule_csh_login_File_Restriction but it is not explicitly stated in the policy; we make it dependent on a variable flag.
    if [ $check_if_umask_changed_in_profile	-eq 1 ]
	then
		log_message "The invocation of . $IBMsinit_file has been found in $sh_login_file, either explicitly or through the use of a wildcard."
		log_message "Therefore we consider that the violation is that $sh_login_file sets/resets umask."
		log_message "Verifying the presence of the umask command(s) in $sh_login_file..."

		# Note that there may be more than one occurrence in the file as assignments may be conditional.
		file_to_check="$sh_login_file"
		keyword_found=`grep "umask" $file_to_check | grep -v "#" | wc -l 2> /dev/null`
		if [ $keyword_found -gt 0 ]
		then
			# umask keyword found in the file
			log_message "Found $keyword_found occurrence(s) of the keyword umask in $file_to_check:"
			grep_output=`grep "umask" $file_to_check | grep -v "#"`
			log_message "$grep_output"
			# Comment out the umask lines.
			log_message "Commenting out the line(s) invoking the umask command."
			comment_out_lines_in_file_based_on_keyword $file_to_check "umask"
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "An error occurred while attempting to comment out umask line(s) in $file_to_check."
				RuleResult=1
				return
			fi			
		else
			log_message "The umask definition was not found or is commented out in the file $file_to_check." 
			log_message "Remediation for this rule is not needed."
			RuleResult=0
			return
		fi
	fi

    # Success
	RuleResult=0
	return

}

#--------------------------------------------------------------
# rule_etc_profile_d_File_Existence from policy file:
#<cdf:title>User Resources/\etc\profile.d\File Existence</cdf:title>
#<cdf:ruleName>etc_profile_d_File_Existence</cdf:ruleName>
#<cdf:description>Files /etc/profile.d/IBMsinit.csh, /etc/profile.d/IBMsinit.sh  must exist.
#Note: /etc/profile.d/IBMsinit.csh must exist only if "csh" is installed</cdf:description>

#/etc/profile.d/IBMsinit.sh 
#File must exist, and contain at least:
#if [ $UID -gt 199 ]; then
#    umask 077
#fi
#

#/etc/profile.d/IBMsinit.csh 
#File must exist, and contain at least:
#if ($uid > 199) then
#    umask 077
#endif

rule_etc_profile_d_File_Existence()
{
    arg_string=$1

	log_message "rule_etc_profile_d_File_Existence: files /etc/profile.d/IBMsinit.csh, /etc/profile.d/IBMsinit.sh must exist."
	log_message "Parameters received: $arg_string"

	IsCSH=0
	availableCshShells="$(cat /etc/shells | egrep '*csh')"
	if [ -z availableCshShells ]
	then
		IsCSH=1
	else
		log_message "Following csh shells exists : $availableCshShells"			
	fi	
	IBMsinit_files="/etc/profile.d/IBMsinit.csh /etc/profile.d/IBMsinit.sh"
	for IBMsinit_file in $IBMsinit_files ; 
	do 
		if [ $IBMsinit_file = "/etc/profile.d/IBMsinit.csh" ] 
		then 
			if [ $IsCSH = "1" ]
			then 
				log_message "No csh shells available,Remediation is not required for file '/etc/profile.d/IBMsinit.csh'"
			else				
				if [ ! -e $IBMsinit_file ]
				then
					log_message "File $IBMsinit_file not found. Creating it with minimal required instructions for policy compliance."
					echo "#!csh" > $IBMsinit_file
					echo "# Linux remediation script creating $IBMsinit_file with minimal required instructions for policy compliance." >> $IBMsinit_file
					echo "#" >> $IBMsinit_file
					echo -e "if (\$uid > 199) then" >> $IBMsinit_file
					echo -e "    umask 077" >> $IBMsinit_file
					echo -e "endif" >> $IBMsinit_file					
				else
					log_message "File $IBMsinit_file found. Checking for umask 077"
					cat $IBMsinit_file | grep "umask" | grep "077" | grep -v "#" 1>/dev/null 2>&1
					result=$?
					if [ $result -ne 0 ]
					then
						log_message "umask instructions not found or commented out. Inserting..."
						echo "# Linux remediation script adding umask instructions to $IBMsinit_file." >> $IBMsinit_file
						echo "#" >> $IBMsinit_file
						echo -e "if (\$uid > 199) then" >> $IBMsinit_file
						echo -e "    umask 077" >> $IBMsinit_file
						echo -e "endif" >> $IBMsinit_file
					else
						log_message "umask 077 already exists in file $IBMsinit_file,Remediation not required" 
					fi
				fi
			fi
		else				
			if [ ! -e $IBMsinit_file ]
			then
				log_message "File $IBMsinit_file not found. Creating it with minimal required instructions for policy compliance."
				echo "#!sh" > $IBMsinit_file
				echo "# Linux remediation script creating $IBMsinit_file with minimal required instructions for policy compliance." >> $IBMsinit_file
				echo "#" >> $IBMsinit_file
				echo -e "if [ \$UID -gt 199 ]; then" >> $IBMsinit_file
				echo -e "    umask 077" >> $IBMsinit_file
				echo -e "fi" >> $IBMsinit_file					
			else
				log_message "File $IBMsinit_file found. Checking for umask 077"
				cat $IBMsinit_file | grep "umask" | grep "077" | grep -v "#" 1>/dev/null 2>&1
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "umask instructions not found or commented out. Inserting..."
					echo "# Linux remediation script adding umask instructions to $IBMsinit_file." >> $IBMsinit_file
					echo "#" >> $IBMsinit_file
					echo -e "if [ \$UID -gt 199 ]; then" >> $IBMsinit_file
					echo -e "    umask 077" >> $IBMsinit_file
					echo -e "fi" >> $IBMsinit_file
				else
					log_message "umask 077 already exists in file $IBMsinit_file,Remediation not required" 
				fi
			fi		
		fi
		# Set permissions to rx for group and others (see rule_IBMsinit_Permission_Restriction)
		chmod 755 $IBMsinit_file 2> /dev/null
	done
	RuleResult=0	
}
	
#--------------------------------------------------------------
# rule_NETRC_Restrictions from policy file:
#  <cdf:requires idref="HomeFsV2" /> 
#  <cdf:title>5.1 Operating System Resources/.NETRC Restrictions</cdf:title> 
#  <cdf:description>~root/.netrc file - Read access only by root; write access only by root</cdf:description>
# NOTE: action is taken only if the file exists (from coverage matrix)
# Arguments:
#   this rule expects as second parameter the value to apply as ~root/.netrc file permissions (octal value). 
rule_NETRC_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	RuleResult=0

    root_netrc_file="/root/.netrc" 	
    root_netrc_file2="/.netrc" 	

	log_message "rule_NETRC_Restrictions: $root_netrc_file and $root_netrc_file2 file permissions."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as $root_netrc_file and $root_netrc_file2 file permissions (octal value)."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 0600 as parameter (Read and Write permission only for root)."
		requested_permission_value=0600
	else 
		requested_permission_value=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the permission: must be an octal value
		if echo $requested_permission_value | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The file permission value is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
   check_and_set_file_permission $root_netrc_file $requested_permission_value
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	fi			
	# Make sure the owner is root
	if [ -e $root_netrc_file ]
	then
		log_message "Ensuring that the owner of $root_netrc_file is root..."
		chown "root" $root_netrc_file 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to set $root_netrc_file owner as root."
			RuleResult 1
		fi			
	fi

	check_and_set_file_permission $root_netrc_file2 $requested_permission_value
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	fi			
	# Make sure the owner is root
	if [ -e $root_netrc_file2 ]
	then
		log_message "Ensuring that the owner of $root_netrc_file2 is root..."
		chown "root" $root_netrc_file2 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to set $root_netrc_file2 owner as root."
			RuleResult 1
		fi			
	fi

	return
}

#--------------------------------------------------------------
# rule_RHOSTS_Restrictions from policy file:
#  <cdf:requires idref="HomeFsV2" /> 
#  <cdf:title>5.1 Operating System Resources/.RHOSTS Restrictions</cdf:title> 
#  <cdf:description>~root/.rhosts file - Read access only by root; write access only by root</cdf:description> 
# NOTE: action is taken only if the file exists (from coverage matrix) 
# Arguments:
#   this rule expects as second parameter the value to apply as ~root/.rhosts file permissions (octal value).
rule_RHOSTS_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	RuleResult=0

    root_rhosts_file="/root/.rhosts" 	
    root_rhosts_file2="/.rhosts" 	

	log_message "rule_RHOSTS_Restrictions: $root_rhosts_file and $root_rhosts_file2 file permissions."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as $root_rhosts_file and $root_rhosts_file2 file permissions (octal value)."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 0600 as parameter (Read and Write permission only for root)."
		requested_permission_value=0600
	else 
		requested_permission_value=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the permission: must be an octal value
		if echo $requested_permission_value | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The file permission value is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
    check_and_set_file_permission $root_rhosts_file $requested_permission_value
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	fi
	# Make sure the owner is root
	if [ -e $root_rhosts_file ]
	then
		log_message "Ensuring that the owner of $root_rhosts_file is root..."
		chown "root" $root_rhosts_file 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to set $root_rhosts_file owner as root."
			RuleResult 1
		fi			
	fi

    check_and_set_file_permission $root_rhosts_file2 $requested_permission_value
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	fi			
	# Make sure the owner is root
	if [ -e $root_rhosts_file2 ]
	then
		log_message "Ensuring that the owner of $root_rhosts_file2 is root..."
		chown "root" $root_rhosts_file2 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to set $root_rhosts_file2 owner as root."
			RuleResult 1
		fi			
	fi

	return
}


#--------------------------------------------------------------
getACL() {
    myfile=$1
	tmpfile=getacl$$
	`perl -e'printf "%o\n",(stat shift)[2] &07777'  $myfile > $tmpfile`
	ACL=$(< $tmpfile)
	rm -f $tmpfile
	return 0
}

getOwnerGroup(){
	tmpfile=getowner$$
	$( ls -ld $1 | awk '{print $3, $4 }' > $tmpfile )
	var=$(< $tmpfile)
	rm -f $tmpfile
	return 0
}

getOwner()
{
echo $(ls -ld $1 | awk '{print $3}')
}

getGroup()
{
echo $(ls -ld $1 | awk '{print $4}')
}


#--------------------------------------------------------------
# Check if the file name is a redirection to another file
check_if_file_is_a_redirection()
{
    file_name=$1

	# Note: we grep for file_name in the ls statement in case it sould be a directory and all its files will get listed
	ls -l $file_name | grep "$file_name" | grep "\->" 1> /dev/null 2>&1
	result=$?
	if [ $result -ne 0 ]
	then
		# The file name is not a redirection
		return 1
	fi
	
	file_name_ok=0
	while [ $file_name_ok -eq 0 ]
	do
		link_name=$file_name

		file_name=`$ReadLinkCommand $link_name`
		case "$file_name" in
		/*)
			result=0
			;;
		*)
			result=1
			;;
		esac
		if [ $result -ne 0 ]
		then
			# Complete path is missing in file name; this means that the target file is in the same directory as the link file
			# Extract the path from the link
			reversed_last_item_in_path=`echo $link_name | rev | $CutCommand -d'/' -f 1 | awk '{print $1}'`
			reversed_string=`echo $link_name | rev | awk '{print $1}'`
			stripped_reversed_string=`echo $reversed_string | sed s,"$reversed_last_item_in_path/",, | awk '{print $1}'`
			file_path=`echo $stripped_reversed_string | rev | awk '{print $1}'`
			file_name="$file_path/$file_name"
		fi
		# Check if we got another redirection
		ls -l $file_name | grep "\->" 1> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			# The file name is not a redirection. We have the target name.
			file_name_ok=1
		fi
	done

	GlobalTargetFileNameAndPath=$file_name
	return 0
}


#--------------------------------------------------------------
# check_and_set_group_permission_mode
# Check and set (if applicable) the group permission mode of a file or directory
check_and_set_group_permission_mode()
{
    absolute_file_name=$1
	group_permission_mode=$2
	accepted_permission_modes_grep_expression=$3
	
	# Check the current permission mode
	stat -c "%a" $absolute_file_name | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "    Changing group permission of $absolute_file_name to $group_permission_mode"
		chmod g=$group_permission_mode $absolute_file_name 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "    Failed to set permissions for $absolute_file_name (error = $result)."
			return 1
		else
			permission_string=`stat -c "%A" $absolute_file_name | awk '{print $1}'`
			log_message "    Permissions have been set to $permission_string for $absolute_file_name."
		fi
	fi
		
    return 0
}	
 

#--------------------------------------------------------------
# file_and_path_check_and_set_group_permission_mode
# Check and set (if applicable) the group permission mode of a file and all directories in its path
file_and_path_check_and_set_group_permission_mode()
{
    absolute_file_name=$1
	group_permission_mode=$2
	accepted_permission_modes_grep_expression=$3
	error=0
	
	# Check if the file name is a redirection to another file
	check_if_file_is_a_redirection $absolute_file_name
	result=$?
	if [ $result -eq 0 ]
	then
	    log_message "    $absolute_file_name is a redirection to target file $GlobalTargetFileNameAndPath"
		log_message "    Will work on $GlobalTargetFileNameAndPath"
		absolute_file_name=$GlobalTargetFileNameAndPath
	fi
	
	while [ "$absolute_file_name" != "/" -a "$absolute_file_name" != "" ]
	do
	    # Check the current permission mode
		stat -c "%a" $absolute_file_name | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "    Changing group permission of $absolute_file_name to $group_permission_mode"
			chmod g=$group_permission_mode $absolute_file_name 2> /dev/null
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    Failed to set permissions for $absolute_file_name (error = $result)."
				return 1
			else
				permission_string=`stat -c "%A" $absolute_file_name | awk '{print $1}'`
				log_message "    Permissions have been set to $permission_string for $absolute_file_name."
			fi
		fi
		
	    # Cut the last item in the path
        reversed_last_item_in_path=`echo $absolute_file_name | rev | $CutCommand -d'/' -f 1 | awk '{print $1}'`
		reversed_string=`echo $absolute_file_name | rev | awk '{print $1}'`
	    stripped_reversed_string=`echo $reversed_string | sed s,"$reversed_last_item_in_path/",, | awk '{print $1}'`
		absolute_file_name=`echo $stripped_reversed_string | rev | awk '{print $1}'`
	done

    return $error
}

# This is a common function for all "command_groups_permissions" rules to check and set priviledged group(gid)
check_and_set_priviledged_command_groups_permissions()
{
	file=$1
	file_gid=$2
	RuleResult=0
	RemediationRequired=0
	
	# Following snippet from policy.xml sql query 
	
	# and bb.gid &gt; 99 and (
	# (bb.gid &gt; 199 and lower(f.version) like '%debian% 5%')
	# or
	# (bb.gid &gt; 499 and (
	# lower(f.version) like '%red hat%release 5%' or
	# lower(f.version) like '%red hat%release 6%' or
	# lower(f.version) like '%centos%release 5%' or
	# lower(f.version) like '%centos%release 6%'))
	# or
	# (bb.gid &gt; 499 and (
	# lower(f.version) like 'suse linux enterprise server 10%' or
	# lower(f.version) like 'suse linux enterprise server 11%' or
	# lower(f.version) like 'suse linux enterprise server 12%'))
	# or
	# (bb.gid &gt; 999 and (
	# lower(f.version) like '%red hat%release 7%' or
	# lower(f.version) like '%centos%release 7%'))
	# or
	# (bb.gid &gt; 999 and (
	# lower(f.version) like '%debian% 6%' or
	# lower(f.version) like '%debian% 7%' or
	# lower(f.version) like '%debian% 8%' or
	# lower(f.version) like '%ubuntu%'))
	# or bb.gid = 100
	# )
	
	if [ $file_gid -eq 100 ]; then 
		RemediationRequired=1
		
	elif [ $file_gid -gt 199 -a $DEBIAN_5 -eq 1 ]; then 
		RemediationRequired=1		
	
	elif [ $file_gid -gt 499 -a \( $IsRHEL5 -eq 1 -o $IsRHEL6 -eq 1 -o $SUSE_11_or_later -eq 1 \) ]; then 
		RemediationRequired=1
		
	elif [ $file_gid -gt 999 -a \( $DEBIAN_6_and_later -eq 1 -o $IsUbuntu -eq 1 \) ]; then 		
		RemediationRequired=1		
	else
		RemediationRequired=0
	fi
	
	if [ $RemediationRequired -eq 1 ]; then	
		log_message "Group of file $file is not Privileged Group. Remediation required.."
		chgrp root $file 1>/dev/null 2>&1			
		if [ $? -eq 0 ] ; then
			log_message "Successfully Changed Group of file $file to root"
		else
			log_message "Error while changing Group of file $file to root"
			RuleResult=1
		fi	
	fi		
	return 
} 

#--------------------------------------------------------------
# This function is used only by rule CRON_Command_Group_Permissions. 
sub_rule_CRON_Command_Group_Permissions()
{
    file=$1
    perm_change_not_required=0
    requested_group_permission="rx"
	function_result=0

	# Example of job definition in CRON file:
	# .---------------- minute (0 - 59)
	# |  .------------- hour (0 - 23)
	# |  |  .---------- day of month (1 - 31)
	# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
	# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
	# |  |  |  |  |
	# *  *  *  *  * user-name command to be executed
	log_message "Reading active entries from file $file ... "
	found_active_entry=0
	
	while read -r myline; do
		# Check if this line is a comment or setting a shell variable; a valid line must begin with a numerical value (minutes)
		# or "*/" for every hour at the specified minute
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		if [ "$first_word" = "#" -o "$first_word" = "" ] ; then
		    skipp_line=1		
		fi
		if [ $skipp_line -eq 0 ] ;then
			found_active_entry=1			
			cmds=$(echo "$myline"| egrep -v '^#|=' | cut -f 6- -d " ")			
			for cmd in $cmds ; do				
				skip_entry=0				
				# Check if the entry has the path in it. If not, find it.
				if [ ! -e "$cmd" ];	then					
					which $cmd 1> /dev/null 2>&1					
					if [ $? -eq 0 ]; then
						cmd=`which $cmd | awk '{print $1}'`						
					else
						skip_entry=1
					fi
				fi				
				if [ $skip_entry -eq 0 ]; then					
					own=$(getOwner $cmd)
					grp=$(getGroup $cmd)					
					if [ "$grp" = "$default_group" ]; then 
						log_message "$grp is a group considered to be default group for general users."
						accepted_permission_modes_grep_expression=".[541]."
						stat -c "%a" $cmd | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
						if [ $? -ne 0 ]; then 
							file_and_path_check_and_set_group_permission_mode $cmd $requested_group_permission $accepted_permission_modes_grep_expression
							if [ $? -ne 0 ]; then
								log_message "An error occurred while trying to set the group permissions for $cmd; manual intervention required."
								function_result=1
							fi
							perm_change_not_required=1						
						fi 
					fi				
					absoluteFilePath="$(readlink -f $cmd)"
					file_gid=`stat -c "%g" $absoluteFilePath`
					if [ $file_gid -gt 99 ]; then 
						check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
						if [ $? -ne 0 ]; then								
							function_result=1
						fi
					fi
					check_and_set_privileged_owner_group $absoluteFilePath				
				fi
			done
		fi	
	done < $file
	
	if [ $perm_change_not_required -eq 0 -a $function_result -eq 0 ]; then 
		log_message "Permission change is not required for file $file. Remediation not required."
	fi
    if [ $found_active_entry -eq 0 ]; then
	    log_message "No active entry found in file $file. Remediation not required."
		function_result=0
	fi
	
	return $function_result
}	
#--------------------------------------------------------------
#<cdf:title>Operating System Resources/CRON Command Group Permissions</cdf:title>
#<ruleName>CRON_Command_Group_Permissions</ruleName>
#<cdf:ruleName>CRON_Command_Group_Permissions</cdf:ruleName>
#<cdf:description>CRON: /var/spool/cron/root, /var/spool/cron/tabs/root, /etc/crontab, /etc/cron.d/*. Each active entry's file/command/script executed, and all existing directories in its path must have settings for &quot;group&quot;  of r-x or more stringent, if owned by groups considered to be default groups for general users. (users). Active entries must be owned an id/group as identified in section 5.1 'The following system ids and group ids must own OSRs', or id which has Security &amp; System Administrative Authority.</cdf:description>

#  Checking and setting owner and group permissions for privileged access.

rule_CRON_Command_Group_Permissions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_CRON_Command_Group_Permissions: Operating System Resources/CRON Command Group Permissions."
	log_message "Parameters received: $arg_string"
	
	# Check Supported OS list. 
	if [ $IsDebian -eq 0 -a $IsUbuntu -eq 0 -a $RHEL5_or_later -eq 0 -a $SUSE_10_or_later -eq 0 ] ; then 
		log_message "Operating System version does not match supported list.Exiting..."		
		RuleResult=2
		return 
	fi 

	RuleResult=0
	
	CRON_File_List="/var/spool/cron/root /var/spool/cron/tabs/root /etc/crontab"
    CronDFiles="$(find /etc/cron.d/* -type f 2>/dev/null)"
    if [ ! "$CronDFiles" = "" ]; then
        CRON_File_List="$CRON_File_List $CronDFiles"
    fi
	
	for CronFile in $CRON_File_List; do
		absoluteFilePath="$(readlink -f $CronFile)"
		if [ -e "$absoluteFilePath" -a ! -z "$absoluteFilePath" ]; then			
			sub_rule_CRON_Command_Group_Permissions $absoluteFilePath
			if [ $? -ne 0 ];then
				RuleResult=1				
			fi			
		else			
			log_message "File $file does not exist or empty. Remediation not required."			
		fi		
	done
	
	return 
}

#--------------------------------------------------------------
# check_and_set_other_permission_mode
# Check and set (if applicable) the OTHER permission mode of a file or directory
check_and_set_other_permission_mode()
{
    absolute_file_name=$1
	other_permission_mode=$2
	accepted_permission_modes_grep_expression=$3
	error=0
	
	# Check the current permission mode
	stat -c "%a" $absolute_file_name | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "    Changing OTHER permission of $absolute_file_name to $other_permission_mode"
		chmod o=$other_permission_mode $absolute_file_name 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "    Failed to set permissions for $absolute_file_name (error = $result)."
			return 1
		else
			permission_string=`stat -c "%A" $absolute_file_name | awk '{print $1}'`
			log_message "    Permissions have been set to $permission_string for $absolute_file_name."
		fi
	fi
		
    return $error
}	
 

#--------------------------------------------------------------
# file_and_path_check_and_set_other_permission_mode
# Check and set (if applicable) the OTHER permission mode of a file and all directories in its path
file_and_path_check_and_set_other_permission_mode()
{
    absolute_file_name=$1
	other_permission_mode=$2
	accepted_permission_modes_grep_expression=$3
	error=0
	
	# Check if the file name is a redirection to another file
	check_if_file_is_a_redirection $absolute_file_name
	result=$?
	if [ $result -eq 0 ]
	then
	    log_message "    $absolute_file_name is a redirection to target file $GlobalTargetFileNameAndPath"
		log_message "    Will work on $GlobalTargetFileNameAndPath"
		absolute_file_name=$GlobalTargetFileNameAndPath
	fi

	while [ "$absolute_file_name" != "/" -a "$absolute_file_name" != "" ]
	do
	    # Check the current permission mode
		stat -c "%a" $absolute_file_name | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "    Changing OTHER permission of $absolute_file_name to $other_permission_mode"
			chmod o=$other_permission_mode $absolute_file_name 2> /dev/null
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    Failed to set permissions for $absolute_file_name (error = $result)."
				return 1
			else
				permission_string=`stat -c "%A" $absolute_file_name | awk '{print $1}'`
				log_message "    Permissions have been set to $permission_string for $absolute_file_name."
			fi
		fi
		
	    # Cut the last item in the path
        reversed_last_item_in_path=`echo $absolute_file_name | rev | $CutCommand -d'/' -f 1 | awk '{print $1}'`
		reversed_string=`echo $absolute_file_name | rev | awk '{print $1}'`
	    stripped_reversed_string=`echo $reversed_string | sed s,"$reversed_last_item_in_path/",, | awk '{print $1}'`
		absolute_file_name=`echo $stripped_reversed_string | rev | awk '{print $1}'`
	done

    return $error
}	
 
#--------------------------------------------------------------
#      Each active entry's file/command/script to be executed, and all existing directories in its path, 
#      must have settings for "other" of r-x or more stringent.</cdf:description> 
sub_rule_CRON_Command_WW_Permissions()
{
    file=$1

    if [ ! -e $file ]
	then
	    log_message "File $file does not exist. Skipping."
		return 0
	fi

	requested_other_permission="rx"
	function_result=0

	# Example of job definition in CRON file:
	# .---------------- minute (0 - 59)
	# |  .------------- hour (0 - 23)
	# |  |  .---------- day of month (1 - 31)
	# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
	# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
	# |  |  |  |  |
	# *  *  *  *  * user-name command to be executed
	log_message "Reading active entries from $file ... "
	found_active_entry=0
	while read -r myline; do
		# Check if this line is a comment or setting a shell variable; a valid line must begin with a numerical value (minutes)
		# or "*/" for every hour at the specified minute
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		if [ "$first_word" = "#" -o "$first_word" = "" ]
		then
		    skipp_line=1
		else
			first_word=`echo $first_word | sed s,"*/",,`
			if echo $first_word | grep "[^0-9"] 2>&1 > /dev/null
			then
			    # Not a numerical value
				skipp_line=1
			fi
		fi
		if [ $skipp_line -eq 0 ]
		then
			found_active_entry=1
			skip_entry=0
			cmd=$(echo "$myline" | awk '{print $7}')
			log_message "    Active entry found. Extracted command : $cmd"
			# Check if the entry has the path in it. If not, find it.
			if [ ! -e $cmd ]
			then
			    which $cmd 1> /dev/null 2>&1
				result=$?
				if [ $result -eq 0 ]
				then
				    cmd=`which $cmd | awk '{print $1}'`
				else
				    log_message "    $cmd file not found. Skipping this entry."
					skip_entry=1
				fi
			fi
			if [ $skip_entry -eq 0 ]
			then
				log_message "    Expected ACL OTHER settings : r-x or more stringent "
				log_message "    Checking and setting requested OTHER mode for $cmd and directories in its path where applicable..."
				accepted_permission_modes_grep_expression="..[541]"
				file_and_path_check_and_set_other_permission_mode $cmd $requested_other_permission $accepted_permission_modes_grep_expression
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "    An error occurred while trying to set the OTHER permissions for $cmd; manual verification is needed."
					function_result=1
				fi
			fi
		fi	
	done < $file
    if [ $found_active_entry -eq 0 ]
	then
	    log_message "    No active entry found in file $file"
		function_result=0
	fi
	return $function_result
}	

#--------------------------------------------------------------
# rule_CRON_Command_WW_Permissions from policy file:
# <cdf:title>5.1 Operating System Resources/CRON Command WW Permissions</cdf:title> 
# <cdf:description>CRON: /var/spool/cron/root, /var/spool/cron/tabs/root, /etc/crontab, /etc/cron.d/*.
# Each active entry's file/command/script to be executed, and all existing directories in its path, 
# must have settings for "other" of r-x or more stringent.</cdf:description> 
# Arguments: none

# Remdiation by checking and setting "other" permissions to r-x or more stringent for required files.  
rule_CRON_Command_WW_Permissions()
{
    log_message "rule_CRON_Command_WW_Permissions: Operating System Resources/CRON Command WW Permissions."
	RuleResult=0
	
	CRON_File_List="/var/spool/cron/root /var/spool/cron/tabs/root /etc/crontab"
	CronDFiles="$(find /etc/cron.d/* -type f)"
	CRON_File_List="$CRON_File_List $CronDFiles"
	
	 for CronFile in $CRON_File_List
	 do
		absoluteFilePath="$(readlink -f $CronFile)"
		if [ ! -z "$absoluteFilePath" ]; then			
			sub_rule_CRON_Command_WW_Permissions $absoluteFilePath
			result=$?
			if [ $result -ne 0 ]
			then
				RuleResult=1				
			fi			
		fi
	done

	return 
}

#  Each active entry must specify full path of the file/command/script to be executed.
# sub_CRON_Full_Path_Restriction()
# {
    # file=$1

    # if [ ! -e $file ] ; then
	    # log_message "File $file does not exist. Skipping."
		# return 0
	# fi

	# function_result=0

	# tmpfile="/tmp/ITCS104_rule_30_workfile.$$"
	# if [ -f $tmpfile ] ; then 
		# rm -f $tmpfile
	# fi 
	# touch $tmpfile
	# chmod 644 $tmpfile
	# remediate=0
	
	# # Example of job definition in CRON file:
	# # .---------------- minute (0 - 59)
	# # |  .------------- hour (0 - 23)
	# # |  |  .---------- day of month (1 - 31)
	# # |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
	# # |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
	# # |  |  |  |  |
	# # *  *  *  *  * user-name command to be executed
	# log_message "Reading active entries from $file ... "
	# found_active_entry=0

	# while read -r myline; do
		# # Check if this line is a comment or setting a shell variable; a valid line must begin with a numerical value (minutes)
		# # or "*/" for every hour at the specified minute
		# skipp_line=0
		# first_word=`echo $myline | awk '{print $1}'`
		# if [ "$first_word" = "#" -o "$first_word" = "" ] ; then
		    # skipp_line=1
		# else
			# first_word=`echo $first_word | sed s,"*/",,`
			# if echo $first_word | grep "[^0-9"] 2>&1 > /dev/null
			# then
			    # # Not a numerical value
				# skipp_line=1
			# fi
		# fi

		# if [ $skipp_line -eq 0 ] ; then
			# found_active_entry=1
			# skip_entry=0
			# field1=`echo "$myline" | awk '{print $1}'`
			# field2=`echo "$myline" | awk '{print $2}'`
			# field3=`echo "$myline" | awk '{print $3}'`
			# field4=`echo "$myline" | awk '{print $4}'`
			# field5=`echo "$myline" | awk '{print $5}'`
			# field6=`echo "$myline" | awk '{print $6}'`
			
			# if [ "$file" = "/var/spool/cron/root" ];then 
				# rest_of_line=`echo "$myline" | awk '{for(i=6;i<=NF;++i)print $i}'`
			# else 
				# rest_of_line=`echo "$myline" | awk '{for(i=7;i<=NF;++i)print $i}'`
			# fi 	
			# cmd=`echo "$rest_of_line" | awk '{print $1}'`          # extract the command 
			# param_cmd=`echo "$rest_of_line" |  $CutCommand -d' ' -f2-`     # extract the params
			# if [ "$cmd" = "$param_cmd" ] ; then 
				# param_cmd=""
			# fi 

			# if [ "$cmd" = "" ] ; then 
				# echo "$myline" >> $tmpfile
			# elif echo "$cmd" | egrep '^\s*\/' 1>/dev/null 2>&1 ;then
				# echo "$myline" >> $tmpfile
			# elif echo "$cmd" | egrep '\[' 1>/dev/null 2>&1 ;then				
				# echo "$myline" >> $tmpfile
			# else 
				# log_message "    Active entry found. Extracted command : $cmd"
				# # Check if the entry has the path in it. If not, find it.
				# echo $cmd | grep "/" 1>/dev/null 2>&1
				# if [ $? -ne 0 ] ; then
					# # The path is not there
					# GlobalTargetFileNameAndPath=''
					# get_full_path $cmd
					# result=$?
					# if [ $result -eq 0 ] ; then
						# cmd_path=$GlobalTargetFileNameAndPath
						# remediate=`expr $remediate + 1`
						# timestamp=`date "+%Y-%m-%d  %Hh%Mm%S"`
						# log_message "Processing..."
						# log_message "We comment out the following line : "
						# log_message_keep_special_chars "    $myline"
						# log_message "We add a new line based on the line we commented out except that we will replace << $cmd >> with << $cmd_path >> "
						# log_message "    the new line will be :"
						# log_message_keep_special_chars "    ${field1} ${field2} ${field3} ${field4} ${field5} ${field6} ${cmd_path} ${param_cmd}"
						# echo "# ${myline}" >> $tmpfile
						# echo "# the above line was commented out by the ITCS104 Remediation Script Rule 30 @ $timestamp . It was replaced with the line below" >> $tmpfile
						# echo "${field1} ${field2} ${field3} ${field4} ${field5} ${field6} ${cmd_path} ${param_cmd}" >> $tmpfile
					# else 
						# log_message "Could not determine the full path of the command $cmd"
						# echo "$myline" >> $tmpfile
						# function_result=1 
					# fi
				# else
					# # The path is there
					# echo "$myline" >> $tmpfile
				# fi
			# fi
		# else  # skip_line was set
			# echo "$myline" >> $tmpfile
		# fi	
	# done < $file

	# if [ $remediate -gt 0 ] ; then
		# log_message "Making $remediate changes into $file  ..."		
		# log_message "will run diff $tmpfile $file"
		# result_change=`diff $tmpfile $file`
		# if [ "$result_change" != "" ] ; then 
			# log_message "Change report: "
			# log_message_keep_special_chars "$result_change"
		# fi 
		# log_message "Will run cp -f $tmpfile $file"
		# cp -f $tmpfile $file
		# if [ $? -eq 0 ] ; then 
			# log_message "The changes have been successfully applied."
		# else 
			# log_message "Failure! We could not apply the changes."
			# function_result=1 
		# fi	
	# fi 
	# rm -f $tmpfile 2>/dev/null
	
	# return $function_result
# }	


#--------------------------------------------------------------
# rule_CRON_Full_Path_Restriction from policy file:
#  <cdf:requires idref="CrontabV2" /> 
#  <cdf:title>5.1 Operating System Resources/CRON Full Path Restriction</cdf:title> 
#  <cdf:description>CRON: /var/spool/cron/root, /var/spool/cron/tabs/root, /etc/crontab, /etc/cron.d/*.
#  Each active entry must specify full path of the file/command/script to be executed.</cdf:description> 
#
# From coverage matrix:
# /var/spool/cron/root, /var/spool/cron/tabs/root, /etc/crontab, /etc/cron.d/*.
#  Each active entry must specify full path of the file/command/script to be executed.
#
# Arguments: none
# rule_CRON_Full_Path_Restriction()
# {
    # arg_string=$1
    # num_of_arguments=`echo "$arg_string" | wc -w`;

	# log_message "rule_CRON_Full_Path_Restriction: Operating System Resources/CRON Full Path Restriction."
	# log_message "Parameters received: $arg_string"

	# RuleResult=0

	# files="/var/spool/cron/root /var/spool/cron/tabs/root /etc/crontab"
	# cronDfiles=`find /etc/cron.d/* -type f`
	# file="/var/spool/cron/root"
	# files="$files $cronDfiles"
	
	# for file in $files ; do	
		# sub_CRON_Full_Path_Restriction $file
		# result=$?
		# if [ $result -ne 0 ]
		# then
			# RuleResult=1
		# fi
	# done
	# return 
# }

get_full_path_cron()
{
	cmd=$1	
	which $cmd 1>/dev/null 2>&1
	# after which command $? always returns 0 thus having below condition
	# if echo $cmd_val | egrep '^\s*\/' 1>/dev/null 2>&1 ;then
	if [ $? -eq 0 ];then 
		GlobalTargetFileNameAndPath=`which $cmd`
		return 0
	fi
	
	directories_list="/etc /usr /opt /root /var /home /tmp"
	directories_count=`echo $directories_list | wc -w`
	failed_to_find=0
	found=0
	
	for dir in $directories_list; do
		files_found=`find $dir -name $cmd -type f -print`
		num_found=`echo $files_found |wc -w`
		
		if [ $num_found -eq 0 ];then
			failed_to_find=`expr $failed_to_find + 1`			
		else
			if [ $num_found -eq 1 ];then
				GlobalTargetFileNameAndPath=$files_found				
			else 
				log_message "$num_found paths to command \"$cmd\" have been found under \"$dir\".Cannot resolve path with certainty.Remediation not possible"				
				log_message "Please verify below $num_found full paths and update correct path in respective file manually"
				count=0
				for file in $files_found;do
					count=`expr $count + 1`
					log_message "$count.$file"
				done 
				found=1							
			fi
			break  # Found one for more paths in directory $dir hence exiting from loop, no need to search in remaining directories.
		fi 
	done

	if [ $failed_to_find -eq $directories_count ];then 
		# Not found anywhere
		directories_list=`echo $directories_list | sed 's/ /,/g'`
		log_message "Failed to search full path for command \"$cmd\" in directories : \"$directories_list\". Remediation not possible"
		found=1
	fi	
	
	return $found
}

rule_CRON_Full_Path_Restriction()
{
	arg_string=$1
	log_message "rule_CRON_Full_Path_Restriction: Protecting Resources-OSRs/CRON Full Path Restriction"
	log_message "Parameters received: $arg_string"
	
	files="/var/spool/cron/root /var/spool/cron/tabs/root /etc/crontab"
	cronDfiles=`find /etc/cron.d/* -type f`	
	files="$files $cronDfiles"		
	
	failure=0
	
	for cron_file in $files ; do
		if [ ! -e $cron_file ];	then 
			log_message "File $cron_file does not exist.Skipping it."
			continue	
		fi
		tmpfile="/tmp/cron.new$$"
		
		log_message "Reading active entries from file $cron_file ... "	
		remediate=0
		fullPathNotFound=0
		
		while read line || [ -n "$line" ]; do			
			if echo "$line" | egrep '^\s*#' 1>/dev/null 2>&1 ; then 
				echo "$line" >> $tmpfile			
			else				
				if [ "$cron_file" = "/var/spool/cron/root" ];then 					
					command_field=`echo "$line" | awk '{print $6}'`			
				else
					command_field=`echo "$line" | awk '{print $7}'`
				fi 
				
				if [ "$command_field" = "" ] ;then 				
					echo "$line" >> $tmpfile					
				elif echo "$command_field" | egrep '^\s*\/' 1>/dev/null 2>&1 ;then
					 echo "$line" >> $tmpfile
				elif echo "$command_field" | egrep '\[' 1>/dev/null 2>&1 ;then				
					echo "$line" >> $tmpfile
				elif echo "$command_field" | egrep '^\s*run-parts' 1>/dev/null 2>&1 ;then				
					echo "$line" >> $tmpfile	
				else  
					# Trying to locate path. 
					GlobalTargetFileNameAndPath=''
					full_command_path=""
					# check here for existance of / in $command_field also see if / is in between
					orig_command_field=$command_field
					if echo $command_field | egrep '/$' 1>/dev/null 2>&1 ; then					
						command_field=`echo $command_field | sed 's|/$||'`					
						log_message "Command \"$orig_command_field\" contains \"/\" at the end,trying to locate full path to \"$command_field\""
					elif echo $command_field | egrep '.+/.+$' 1>/dev/null 2>&1 ; then					
						command_field=`echo $command_field | cut -d "/" -f 2`
						log_message "Command \"$orig_command_field\" contains \"/\" ,trying to locate full path to \"$command_field\""
					else
						command_field=$command_field
					fi 
					get_full_path_cron "$command_field"
					if [ $? -eq 0 ] ; then
						full_command_path=$GlobalTargetFileNameAndPath				
						echo "$line" | sed "s|$orig_command_field|$full_command_path|g" >> $tmpfile
						if [ $? -eq 0 ] ; then
							log_message "Successfully Updated full path as : $full_command_path for command $orig_command_field"
							remediate=`expr $remediate + 1`
						fi 
					else
						fullPathNotFound=`expr $fullPathNotFound + 1`
						echo "$line" >> $tmpfile
						failure=`expr $failure + 1`	
					fi				
				fi 
			fi 		
		done < $cron_file
		
		mv $tmpfile $cron_file 1>/dev/null 2>&1		
	
		if [ $fullPathNotFound -eq 0 -a $remediate -eq 0 ];then 
			log_message "Remediation not required for file $cron_file"						
			continue
		fi  		
		
		if [ "$cron_file" = "/var/spool/cron/root" ];then 			
			invalid_path_count=`cat "$cron_file" |egrep -v '^\s*#' |egrep -v '^\s*$' |awk '{print $6}' | egrep '^\s*([0-9]+\s+){5}' | egrep -v '^\s*run-parts' | egrep -c -v '\['`
		else			
			invalid_path_count=`cat "$cron_file" |egrep -v '^\s*#' |egrep -v '^\s*$' |awk '{print $7}' | egrep '^\s*([0-9]+\s+){5}' | egrep -v '^\s*run-parts' | egrep -c -v '\['`
		fi 
		
		if [ $invalid_path_count -gt 0 ];then 
			log_message "Remediation not possible for $invalid_path_count active entry as full path not found in file $cron_file"
			failure=`expr $failure + 1`
		fi 			
	done

	if [ $failure -eq 0 ]; then   #  0 indicates no failure while performing remediation.
		RuleResult=0
    fi
	
	return	
}

#--------------------------------------------------------------
# rule_Faillog_Permission_Restriction from policy file:
# <cdf:title>Operating System Resources/Faillog Permission Restriction</cdf:title>
#  <cdf:description>/var/log/faillog Must have permission 0600. Write access is allowed for group if either of the following conditions is satisfied: The associated group is used only by set-GID operating system programs to avoid a need for root only update privileges. The GID number conforms to the requirements per section 5.2. Enforcement of /var/log/faillog permissions is not required if pam_tally2.so is in use</cdf:description>
# NOTE: 
# 1. Action will be taken only if file /var/log/faillog exists.
# 2. File /var/log/faillog permissions must be set to 600 or can be set to 620 if group is from privileged GID number range.
rule_Faillog_Permission_Restriction()
{
    faillog_file="/var/log/faillog" 	

	log_message "rule_Faillog_Permission_Restriction: $faillog_file file permissions"

	# Verify if $faillog_file exists
	if [ ! -e $faillog_file ] ; then
	    log_message "File $faillog_file not found on the system. Remediation not possible"
		return 0
	fi
	
	permission_value_privileged=620
	requested_permission_value=600
	
	system_file="/etc/pam.d/system-auth"
	password_file="/etc/pam.d/password-auth"
	
	system_file_pam_tall2_count="$(egrep -v '^\s*#' $system_file | egrep -cw "pam_tally2.so")"
	password_file_pam_tall2_count="$(egrep -v '^\s*#' $password_file | egrep -cw "pam_tally2.so")"
	
	if [ $system_file_pam_tall2_count -gt 0 -o $password_file_pam_tall2_count -gt 0 ]; then 
		log_message "Enforcement of file $faillog_file permission is not required as pam_tally2.so module is used in files $system_file or $password_file. Remediation Not Required"
	else
		check_privileged_GID "$faillog_file" $permission_value_privileged $requested_permission_value
	fi
	
	return
}

#--------------------------------------------------------------
# Linux ITCS104 rule_IBMsinit_Permission_Restriction from policy file:
# <cdf:title>Operating System Resources/IBMsinit Permission Restriction</cdf:title>
# <cdf:description>/etc/profile.d/IBMsinit.sh and /etc/profile.d/IBMsinit.csh must have settings for &quot;other&quot;  of r-x. must have settings for &quot;group&quot;  of r-x. Can have &quot;write&quot; access for Group if associated group is identified as having a privileged GID number.</cdf:description>
# NOTE: 
# 1. Action will be taken only if files /etc/profile.d/IBMsinit.sh or /etc/profile.d/IBMsinit.csh exists.
# 2. For files /etc/profile.d/IBMsinit.sh or /etc/profile.d/IBMsinit.csh, group and other permissions must be set to r-x.
# 3. or group permissions can be set to rwx if group is from privileged GID number range.
rule_IBMsinit_Permission_Restriction()
{
	IBMsinitSh_file="/etc/profile.d/IBMsinit.sh"
    IBMsinitCSh_file="/etc/profile.d/IBMsinit.csh"
	
	log_message "rule_IBMsinit_Permission_Restriction: permissions for GROUP and OTHERS for both files $IBMsinitSh_file and $IBMsinitCSh_file."

	permission_value_privileged=75
	permission_value_regular=55

    if [ ! -e $IBMsinitSh_file ]
	then
	    #log_message "File $IBMsinitSh_file not found. Calling rule_etc_profile_d_File_Existence to create the file."
		rule_etc_profile_d_File_Existence "rule_etc_profile_d_File_Existence"
	fi

	if [ ! -e $IBMsinitCSh_file ]
	then
	    #log_message "File $IBMsinitCSh_file not found. Calling rule_etc_profile_d_File_Existence to create the file."
		rule_etc_profile_d_File_Existence "rule_etc_profile_d_File_Existence"
	fi
	
	check_privileged_GID "$IBMsinitSh_file" $permission_value_privileged $permission_value_regular
	check_privileged_GID "$IBMsinitCSh_file" $permission_value_privileged $permission_value_regular
	
	return
}

#--------------------------------------------------------------
sub_rule_INETD_XINETD_Command_Group_Permissions_INETD()
{
    file=$1   
	perm_change_not_required=0
	requested_group_permission="rx"
	function_result=0

	# /etc/inetd.conf file format; example:
	# Each line is of the form:
	# ServiceName  SocketType  ProtocolName Wait/NoWait  UserName ServerPath ServerArgs
	# ServerPath
	# Specifies the full path name of the server that the inetd daemon should execute to provide the service.
	# For services that the inetd daemon provides internally, this field should be internal.
	# Check also for the string internal and skip these lines.
	log_message "Reading entries from file $file ... "
	found_active_entry=0
	
	while read -r myline; do
		# Skip comment and blank lines, and lines which have ServerPath = "internal"
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		echo $first_word | grep "#" 1>/dev/null 2>&1		
		if [ $? -eq 0 ]; then
		    skipp_line=1
		fi
		if [ "$first_word" = "" ]; then
		    skipp_line=1
		fi
		if [ $skipp_line -eq 0 ]; then
			cmd=`echo $myline | awk '{print $6}'`
			found_active_entry=1
			skip_entry=0
			if [ "$cmd" = "internal" ]; then
				log_message "    [internal] found, skipping this entry."
				skip_entry=1
			else
				log_message "    Active entry found. Extracted command : $cmd"
				# Check if the entry has the path in it. If not, find it.
				if [ ! -e $cmd ]; then
					which $cmd 1> /dev/null 2>&1					
					if [ $? -eq 0 ]; then
						cmd=`which $cmd | awk '{print $1}'`
					else
						log_message "    $cmd file not found. Skipping this entry."
						skip_entry=1
					fi
				fi
			fi
			if [ $skip_entry -eq 0 ]; then
				own=$(getOwner $cmd)
				grp=$(getGroup $cmd)
				if [ "$grp" = "$default_group" ]; then 
					log_message "$grp is a group considered to be default group for general users."
					accepted_permission_modes_grep_expression=".[541]."
					stat -c "%a" $cmd | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
					if [ $? -ne 0 ]; then 
						file_and_path_check_and_set_group_permission_mode $cmd $requested_group_permission $accepted_permission_modes_grep_expression
						if [ $? -ne 0 ]; then
							log_message "An error occurred while trying to set the group permissions for $cmd; manual intervention required."
							function_result=1
						fi
						perm_change_not_required=1						
					fi 
				fi		
				absoluteFilePath="$(readlink -f $cmd)"
				file_gid=`stat -c "%g" $absoluteFilePath`
				if [ $file_gid -gt 99 ];then 
					check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
					if [ $? -ne 0 ]; then								
						function_result=1
					fi
				fi				
				check_and_set_privileged_owner_group $absoluteFilePath
			fi
		fi	
	done < $file
	
    if [ $perm_change_not_required -eq 0 -a $function_result -eq 0 ]; then 
		log_message "Permission change is not required for file $file. Remediation not required."
		function_result=0
	fi
    if [ $found_active_entry -eq 0 ]; then
	    log_message "No active entry found in file $file. Remediation not required."
		function_result=0
	fi
	
	return $function_result
}	

#--------------------------------------------------------------
sub_rule_INETD_XINETD_Command_Group_Permissions_XINETD()
{
    file=$1
	perm_change_not_required=0
 	requested_group_permission="rx"
	function_result=0

	# The config files have the following type of records (for instance for auth service):
	# service auth
	# {
	#         disable         = yes
	#         socket_type     = stream
	#         wait            = no
	#         user            = ident
	#         cps             = 4096 10
	#         instances       = UNLIMITED
	#         server          = /usr/sbin/in.authd <---- this the binary launched for the service
	#         server_args     = -t60 --xerror --os -E   <--- beware this guy if you grep for "server"
	# }
	log_message "Reading entries from file $file ... "
	found_active_entry=0
	while read -r myline; do
	
		# Skip comment and blank lines, and lines which have ServerPath = "internal"
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		echo $first_word | grep "#" 1>/dev/null 2>&1		
		if [ $? -eq 0 ]; then
		    skipp_line=1
		fi
		if [ "$first_word" = "" ]; then
		    skipp_line=1
		fi
		if [ "$first_word" != "server" ]; then
		    skipp_line=1
		fi
		if [ $skipp_line -eq 0 ]; then
			cmd=`echo $myline | awk '{print $3}'`
			found_active_entry=1
			skip_entry=0
			if [ "$cmd" = "internal" ]; then
				log_message "    [internal] found, skipping this entry."
				skip_entry=1
			else
				log_message "    Active entry found. Extracted command : $cmd"
				# Check if the entry has the path in it. If not, find it.
				if [ ! -e $cmd ]; then
					which $cmd 1> /dev/null 2>&1					
					if [ $? -eq 0 ]; then
						cmd=`which $cmd | awk '{print $1}'`
					else
						log_message "    $cmd file not found. Skipping this entry."
						skip_entry=1
					fi
				fi
			fi
			if [ $skip_entry -eq 0 ]; then
				own=$(getOwner $cmd)
				grp=$(getGroup $cmd)
				if [ "$grp" = "$default_group" ]; then 
					log_message "$grp is a group considered to be default group for general users."
					accepted_permission_modes_grep_expression=".[541]."
					stat -c "%a" $cmd | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
					if [ $? -ne 0 ]; then 
						file_and_path_check_and_set_group_permission_mode $cmd $requested_group_permission $accepted_permission_modes_grep_expression
						if [ $? -ne 0 ]; then
							log_message "An error occurred while trying to set the group permissions for $cmd; manual intervention required."
							function_result=1
						fi
						perm_change_not_required=1						
					fi 
				fi						
				absoluteFilePath="$(readlink -f $cmd)"	
				file_gid=`stat -c "%g" $absoluteFilePath`
				if [ $file_gid -gt 99 ]; then 
					check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
					if [ $? -ne 0 ]; then								
						function_result=1
					fi
				fi
				check_and_set_privileged_owner_group $absoluteFilePath				
			fi
		fi	
	done < $file
	
    if [ $perm_change_not_required -eq 0 -a $function_result -eq 0 ]; then 
		log_message "Permission change is not required for file $file. Remediation not required."
		function_result=0
	fi
    if [ $found_active_entry -eq 0 ]; then
	    log_message "No active entry found in file $file. Remediation not required."
		function_result=0
	fi
	
	return $function_result
}	

#--------------------------------------------------------------
#<cdf:title>Operating System Resources/INETD-XINETD Command Group Permissions</cdf:title>
#<ruleName>INETD_XINETD_Command_Group_Permissions</ruleName>
#<cdf:ruleName>INETD_XINETD_Command_Group_Permissions</cdf:ruleName>
#<cdf:description>/etc/inetd.conf and /etc/xinetd.conf: Each active entry's file/command/script executed, and all existing directories in its path must have settings for &quot;group&quot;  of r-x or more stringent, if owned by groups considered to be default groups for general users. (users). Active entries must be owned an id/group as identified in section 5.1 'The following system ids and group ids must own OSRs', or id which has Security &amp; System Administrative Authority.</cdf:description>

# /etc/inetd.conf has been replaced by /etc/xinetd.conf on more recent release levels but check for it anyway.
# 
# /etc/inetd.conf file format; example:
# Each line is of the form:
# ServiceName  SocketType  ProtocolName Wait/NoWait  UserName ServerPath ServerArgs
# ServerPath
# Specifies the full path name of the server that the inetd daemon should execute to provide the service.
# For services that the inetd daemon provides internally, this field should be internal.
# Check also for the string internal and skip these lines.
# 
# /etc/xinetd.conf format:
# has an includedir /etc/xinetd.d (for instance) directive giving the directory where the services config files are, example:
# includedir /etc/xinetd.d
# and these config files have the following type of records (for instance for auth service):
# service auth
# {
#         disable         = yes
#         socket_type     = stream
#         wait            = no
#         user            = ident
#         cps             = 4096 10
#         instances       = UNLIMITED
#         server          = /usr/sbin/in.authd <---- this the binary launched for the service
#         server_args     = -t60 --xerror --os -E   <--- beware this guy if you grep for "server"
# }
#
# Arguments: none

#  Checking and setting owner and group permissions for privileged access.

rule_INETD_XINETD_Command_Group_Permissions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_INETD_XINETD_Command_Group_Permissions: Operating System Resources/INETD-XINETD Command Group Permissions."
	log_message "Parameters received: $arg_string"
	
	failure=0
	
	# Check Supported OS list. 
	if [ $IsDebian -eq 0 -a $IsUbuntu -eq 0 -a $RHEL5_or_later -eq 0 -a $SUSE_10_or_later -eq 0 ] ; then 
		log_message "Operating System version does not match supported list.Exiting..."		
		RuleResult=2
		return 
	fi

	# 1) /etc/inetd.conf
	file_name="/etc/inetd.conf"
	if [ ! -e $file_name -o -z $file_name ]; then
	    log_message "File $file_name does not exist or empty. Remediation not required."
		RuleResult=0
	else 
		log_message "Processing file $file_name ..."
		sub_rule_INETD_XINETD_Command_Group_Permissions_INETD $file_name
		result=$?
		if [ $result -ne 0 ]; then
			failure=`expr $failure + 1`	    
		fi	
	fi	

	# 2) /etc/xinetd.conf
	# Find the includedir directive to get the directory path where the config files are
	file_name="/etc/xinetd.conf"
	if [ ! -e $file_name -o -z $file_name ]; then
	    log_message "File $file_name does not exist or empty. Remediation not required."
		RuleResult=0
	else 
		log_message "Processing file $file_name ..."
		sub_rule_INETD_XINETD_Command_Group_Permissions_XINETD $file_name
		result=$?
		if [ $result -ne 0 ]; then
			failure=`expr $failure + 1`		
		fi
	fi 
	
	include_dir=""
	grep "includedir" $file_name | grep -v "#" 1>/dev/null 2>&1	
	if [ $? -ne 0 ]; then
		log_message "includedir directive not found in file $file_name. Exiting."		
	else
		include_dir=`grep "includedir" /etc/xinetd.conf | grep -v "#" | awk '{print $2}'`
		if [ ! -e $include_dir ]; then
			log_message "includedir specified directory ($include_dir) not found in file $file_name. Exiting."			
		else 
			log_message "The includedir directive in $file_name specifies the path $include_dir to locate the config files."
			log_message "Processing all files in $include_dir ..."
			include_dir="$include_dir/*"
			for file_name in $include_dir ; do
				if [ ! -e $file_name -o -z $file_name ]; then
					log_message "File $file_name does not exist or empty. Remediation not required."
					RuleResult=0
				else 
					log_message "Processing file $file_name ..."
					sub_rule_INETD_XINETD_Command_Group_Permissions_XINETD $file_name				
					if [ $? -ne 0 ]; then
						failure=`expr $failure + 1`					
					fi		
				fi 	
			done
		fi 
	fi
	
	if [ $failure -gt 0 ];then
		RuleResult=1
	else
		RuleResult=0
	fi 
	
	return 
}

#--------------------------------------------------------------
sub_INETD_XINETD_Command_WW_Permissions_INETD()
{
    file=$1

    if [ ! -e $file ] ; then
	    log_message "File $file does not exist. Skipping."
		return 0
	fi

	requested_other_permission="rx"
	function_result=0

	log_message "Reading entries from $file ... "
	found_active_entry=0
	while read -r myline; do
		# Skip comment and blank lines, and lines which have ServerPath = "internal"
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		echo $first_word | grep "#" 1>/dev/null 2>&1
		result=$?
		if [ $result -eq 0 ] ; then
		    skipp_line=1
		fi
		if [ "$first_word" = "" ] ; then
		    skipp_line=1
		fi
		if [ $skipp_line -eq 0 ] ; 	then
			cmd=`echo $myline | awk '{print $6}'`
			found_active_entry=1
			skip_entry=0
			if [ "$cmd" = "internal" ] ; then
				log_message "    [internal] found, skipping this entry."
				skip_entry=1
			else
				log_message "    Active entry found. Extracted command : $cmd"
				# Check if the entry has the path in it. If not, find it.
				if [ ! -e $cmd ] ; then
					which $cmd 1> /dev/null 2>&1
					result=$?
					if [ $result -eq 0 ] ; then
						cmd=`which $cmd | awk '{print $1}'`
					else
						log_message "    $cmd file not found. Skipping this entry."
						skip_entry=1
					fi
				fi
			fi
			if [ $skip_entry -eq 0 ] ; then
				log_message "    Expected ACL OTHER settings : r-x or more stringent "
				log_message "    Checking and setting requested OTHER mode for $cmd and directories in its path where applicable..."
				accepted_permission_modes_grep_expression="..[541]"
				file_and_path_check_and_set_other_permission_mode $cmd $requested_other_permission $accepted_permission_modes_grep_expression
				result=$?
				if [ $result -ne 0 ] ; then
					log_message "    An error occurred while trying to set the OTHER permissions for $cmd; manual verification is needed."
					function_result=1
				fi
			fi
		fi	
	done < $file
    if [ $found_active_entry -eq 0 ] ; then
	    log_message "    No active entry found in file $file"
		function_result=0
	fi
	return $function_result
}	

#--------------------------------------------------------------
sub_INETD_XINETD_Command_WW_Permissions_XINETD()
{
    file=$1

    if [ ! -e $file ] ; then
	    log_message "File $file does not exist. Skipping."
		return 0
	fi

	requested_other_permission="rx"
	function_result=0

	log_message "Reading $file ... "
	found_active_entry=0
	while read -r myline; do
	
		# Skip comment and blank lines, and lines which have ServerPath = "internal"
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		echo $first_word | grep "#" 1>/dev/null 2>&1
		result=$?
		if [ $result -eq 0 ] ; then
		    skipp_line=1
		fi
		if [ "$first_word" = "" ] ; then
		    skipp_line=1
		fi
		if [ "$first_word" != "server" ] ; then
		    skipp_line=1
		fi
		if [ $skipp_line -eq 0 ] ; then
			cmd=`echo $myline | awk '{print $3}'`
			found_active_entry=1
			skip_entry=0
			if [ "$cmd" = "internal" ] ; then
				log_message "    [internal] found, skipping this entry."
				skip_entry=1
			else
				log_message "    Active entry found. Extracted command : $cmd"
				# Check if the entry has the path in it. If not, find it.
				if [ ! -e $cmd ] ; then
					which $cmd 1> /dev/null 2>&1
					result=$?
					if [ $result -eq 0 ] ; then
						cmd=`which $cmd | awk '{print $1}'`
					else
						log_message "    $cmd file not found. Skipping this entry."
						skip_entry=1
					fi
				fi
			fi 
			if [ $skip_entry -eq 0 ] ; then
				log_message "    Expected ACL OTHER settings : r-x or more stringent "
				log_message "    Checking and setting requested OTHER mode for $cmd and directories in its path where applicable..."
				accepted_permission_modes_grep_expression="..[541]"
				file_and_path_check_and_set_other_permission_mode $cmd $requested_other_permission $accepted_permission_modes_grep_expression
				result=$?
				if [ $result -ne 0 ] ; then
					log_message "    An error occurred while trying to set the OTHER permissions for $cmd; manual verification is needed."
					function_result=1
				fi
			fi
		fi	
	done < $file
    if [ $found_active_entry -eq 0 ] ; then
	    log_message "    No active entry found in file $file"
		function_result=0
	fi
	return $function_result
}	

#--------------------------------------------------------------
# rule_INETD_XINETD_Command_WW_Permissions from policy file:
# <cdf:title>5.1 Operating System Resources/INETD-XINETD Command WW Permissions</cdf:title> 
# <cdf:description>/etc/inetd.conf and /etc/xinetd.conf: Each active entry's file/command/script to be executed,
# and all existing directories in its path, must have settings for "other" of r-x or more stringent.</cdf:description> 
# /etc/inetd.conf has been replaced by /etc/xinetd.conf on more recent release levels but check for it anyway.
#
# /etc/inetd.conf file format; example:
# Each line is of the form:
# ServiceName  SocketType  ProtocolName Wait/NoWait  UserName ServerPath ServerArgs
# ServerPath
# Specifies the full path name of the server that the inetd daemon should execute to provide the service.
# For services that the inetd daemon provides internally, this field should be internal.
# Check also for the string internal and skip these lines.
#
# /etc/xinetd.conf format:
# has an includedir /etc/xinetd.d (for instance) directive giving the directory where the services config files are, example:
# includedir /etc/xinetd.d
# and these config files have the following type of records (for instance for auth service):
# service auth
# {
#         disable         = yes
#         socket_type     = stream
#         wait            = no
#         user            = ident
#         cps             = 4096 10
#         instances       = UNLIMITED
#         server          = /usr/sbin/in.authd <---- this the binary launched for the service
#         server_args     = -t60 --xerror --os -E   <--- beware this guy if you grep for "server"
# }
#
# Arguments: none
rule_INETD_XINETD_Command_WW_Permissions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_INETD_XINETD_Command_WW_Permissions: Operating System Resources/INETD-XINETD Command WW Permissions."
	log_message "Parameters received: $arg_string"

	RuleResult=0

	# 1) /etc/inetd.conf
	file_name="/etc/inetd.conf"
	log_message "Processing $file_name ..."
	# sub_rule_36_inetd_function $file_name
	sub_INETD_XINETD_Command_WW_Permissions_INETD $file_name
	result=$?
	if [ $result -ne 0 ]
	then
	    RuleResult=1
	fi

	# 2) /etc/xinetd.conf
	# Find the includedir directive to get the directory path where the config files are
	file_name="/etc/xinetd.conf"
	log_message "Processing $file_name ..."
	include_dir=""
	grep "includedir" /etc/xinetd.conf | grep -v "#" 1>/dev/null 2>&1
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "/etc/xinetd.conf includedir directive not found. Exiting."
		RuleResult=1
		return
	fi
	include_dir=`grep "includedir" /etc/xinetd.conf | grep -v "#" | awk '{print $2}'`
	if [ "$include_dir" = "" ]
	then
		log_message "/etc/xinetd.conf includedir directive not defined. Exiting."
		RuleResult=1
		return
	fi
	if [ ! -e $include_dir ]
	then
		log_message "/etc/xinetd.conf includedir specified directory ($include_dir) not found. Exiting."
		RuleResult=1
		return
	fi

    log_message "The includedir directive in $file_name specifies the path $include_dir to locate the config files."
    log_message "Processing all files in $include_dir ..."
	include_dir="$include_dir/*"
	for file_name in $include_dir ; do
		#sub_rule_36_xinetd_function $file_name
		sub_INETD_XINETD_Command_WW_Permissions_XINETD $file_name
		result=$?
		if [ $result -ne 0 ]
		then
			RuleResult=1
		fi
	done

	return 
}

#--------------------------------------------------------------
# This is a common subfunction for rule "rule_INETD_XINETD_Full_Path_Restriction()"

sub_rule_INETD_XINETD_Full_Path_Restriction()
{
	RuleResult=0
	file="$1"		# file could be /etc/inetd.conf or /etc/xinetd.conf or file from /etc/xinetd.d/ directory
	file_type="$2"  # file_type could be "inetd" or "xinetd"
	linenumber=0
	result=0
	result_fail=0
	
	if [ ! -e $file ] ;	then
	    log_message "File $file does not exist. Remediation not applicable."		
		return
	fi
	
	while read -r line; do
		
		linenumber="$(expr $linenumber + 1 )"		
		if [ "$file_type" = "xinetd" ]; then
			command="$(echo $line | egrep -v '^\s*#.*' | sed -n 's/\s*server\s*\=\s*\(.*\)/\1/p' | sed 's/\s//g')"
		elif [ "$file_type" = "inetd" ]; then
			command="$(echo $line | egrep -v '^\s*#.*' | awk '{print $6}' | sed 's/\s//g')"
		else
			log_message "Invalid second argument to sub_rule_INETD_XINETD_Full_Path_Restriction"
			RuleResult=1
			return
		fi 
		
		if [ ! -z $command ];then			
			if [ "$command" = "internal" ] ;then
				log_message "Command name as \"internal\" found at line number $linenumber."				
			else				
				if echo $command | egrep -v '^/' 1>/dev/null 2>&1 ; then 						
					GlobalTargetFileNameAndPath=''					
					if echo $command | egrep '\/' 1>/dev/null 2>&1 ; then # if / contains in-between or at end 
						orig_command=$command
						# trying to check if last field exists as command
						updatedcommand=`echo $command | rev | cut -f 1 -d "/" | rev`
						if [ ! -z $updatedcommand ] ; then  
							command=$updatedcommand
						else
							# trying to check if second last field exists as command 
							updatedcommand=`echo $command | rev | cut -f 2 -d "/" | rev`
							if [ ! -z updatedcommand ] ; then 
							command=$updatedcommand
							else
								log_message "Command $orig_command is invalid.Remediation Not Possible"
								RuleResult=1
								return 
							fi 	
						fi
						get_full_path $command
						result=$?			
						if [ $result -eq 0 ];then # mount => /usr/bin/mount
							log_message "Trying to substitute command \"$orig_command\" with full path"
							sed -i $linenumber"s:$orig_command:$GlobalTargetFileNameAndPath:g" $file
							if sed -n $linenumber'p' $file | egrep -w $GlobalTargetFileNameAndPath 1>/dev/null 2>&1
							then
								log_message "Successfully replaced \"$orig_command\" with full path \"$GlobalTargetFileNameAndPath\""
								result=1
							else
								log_message "Failed to replace \"$orig_command\" with full path \"$GlobalTargetFileNameAndPath\""
								result_fail=1
							fi
						else
							log_message "Failed to locate full path for command \"$orig_command\". Commenting it.."							
							sed -i $linenumber's/^/#/' $file						
						fi
					else
						get_full_path $command  # can look locate
						result=$?			
						if [ $result -eq 0 ];then # mount => /usr/bin/mount
							log_message "Trying to substitute command \"$command\" with full path"
							sed -i $linenumber"s:$command:$GlobalTargetFileNameAndPath:g" $file
							if sed -n $linenumber'p' $file | egrep -w $GlobalTargetFileNameAndPath 1>/dev/null 2>&1 ; then
								log_message "Successfully replaced \"$command\" with full path \"$GlobalTargetFileNameAndPath\""
								result=1
							else
								log_message "Failed to replace \"$command\" with full path \"$GlobalTargetFileNameAndPath\""		
								result_fail=1
							fi
						else
							log_message "Failed to locate full path for command \"$command\". Commenting it..."							
							sed -i $linenumber's/^/#/' $file							
						fi					
					fi 					
				fi
			fi	
		fi
	done < $file
	
	if [ $result -eq 0 ];then 
		log_message "Remediation not required for file $file"
	fi
	
	if [ $result_fail -eq 1 ];then 		
		RuleResult=1
	fi 
}

#--------------------------------------------------------------
# rule_INETD_XINETD_Full_Path_Restriction from policy file:
# <cdf:title>Operating System Resources/INETD-XINETD Full Path Restriction</cdf:title>
# <cdf:ruleName>INETD_XINETD_Full_Path_Restriction</cdf:ruleName>
# <cdf:description>/etc/inetd.conf and /etc/xinetd.conf: Each active entry must specify full path of the file/command/script to be executed. This requirement also applies for files in /etc/xinetd.d/ directory if it is set by 'includedir' attribute in main 'xinetd' configuration file.</cdf:description>
#
# 1. /etc/inetd.conf file format; example:
# Each line is of the form:
# ServiceName  SocketType  ProtocolName Wait/NoWait  UserName ServerPath ServerArgs
# ServerPath : Specifies the full path name of the server that the inetd daemon should execute to provide the service.
# For services that the inetd daemon provides internally, this field should be internal.
# Check also for the string internal and skip these lines.
# 
# 2. /etc/xinetd.conf format:
# has an includedir /etc/xinetd.d (for instance) directive giving the directory where the services config files are, example:
# includedir /etc/xinetd.d
# and these config files have the following type of records (for instance for auth service):
# service auth
# {
#         disable         = yes
#         socket_type     = stream
#         wait            = no
#         user            = ident
#         cps             = 4096 10
#         instances       = UNLIMITED
#         server          = /usr/sbin/in.authd <---- this the binary launched for the service
#         server_args     = -t60 --xerror --os -E   <--- beware this guy if you grep for "server"
# }

# Rewritten code : removed sub functions sub_rule_37_inetd_function() & sub_rule_37_xinetd_function() and created a common function sub_rule_INETD_XINETD_Full_Path_Restriction() to reduce unwanted code. 
# New ITCS104 tech spec change: added exemption for 'internal' in place of command name. 

rule_INETD_XINETD_Full_Path_Restriction()
{
    arg_string=$1
	inetd_result=0
	xinetd_result=0
	xinetd_includedir_result=0
	
	log_message "rule_INETD_XINETD_Full_Path_Restriction: Operating System Resources/INETD-XINETD Full Path Restriction."
	log_message "Parameters received: $arg_string"

	# 1) /etc/inetd.conf
	inetd_file="/etc/inetd.conf"		
	log_message "Processing file $inetd_file ..."
	sub_rule_INETD_XINETD_Full_Path_Restriction "$inetd_file" inetd	
	
	if [ $RuleResult -eq 1 ]; then
		inetd_result=1
	fi
	
	# 2) /etc/xinetd.conf
	xinetd_file="/etc/xinetd.conf"	
	log_message "Processing file $xinetd_file ..."
	sub_rule_INETD_XINETD_Full_Path_Restriction "$xinetd_file" xinetd
	if [ $RuleResult -eq 1 ]; then
		xinetd_result=1
	fi
	
	# Find the includedir directive to get the directory path where the config files are	
	include_directories=`grep "includedir" $xinetd_file | grep -v "#" | awk '{print $2}'`
	for include_dir in $include_directories ; do 	
		if [ ! -d $include_dir ];then
			log_message "Directory path \"$include_dir\" mentioned in file $xinetd_file is invalid."
			RuleResult=0
		else			
			log_message "Processing all files from directory $include_dir ..."
			include_dir="$include_dir/*"
			
			for xinetd_file in $include_dir ; do
				log_message "Processing file $xinetd_file"
				sub_rule_INETD_XINETD_Full_Path_Restriction "$xinetd_file" xinetd				
				if [ $RuleResult -eq 1 ]; then
					xinetd_includedir_result=1
				fi
			done
		fi
	done
	
	if [ $inetd_result -eq 1 -o $xinetd_result -eq 1 -o $xinetd_includedir_result -eq 1 ]; then
		RuleResult=1
	fi
}
#--------------------------------------------------------------
sub_rule_INITD_Command_Group_Permissions()
{
    file=$1
    
	requested_group_permission="rx"
	function_result=0
	check_if_file_is_a_redirection $file	
	if [ $? -eq 0 ]; then	    			
		file=$GlobalTargetFileNameAndPath
	fi

	grp=$(getGroup $file)
	
	if [ "$grp" = "$default_group" ]; then
		log_message "Checking and setting requested group mode(r-x)for file $file and directories in its path where applicable..."
		accepted_permission_modes_grep_expression=".[541]."
		file_and_path_check_and_set_group_permission_mode $file $requested_group_permission $accepted_permission_modes_grep_expression		
		if [ $? -ne 0 ]; then
			log_message "An error occurred while trying to set the group permissions for file $file; manual intervention is needed."
			function_result=1
		fi
	fi
	
	if [ -f $file ]; then
		privileged_check_file_list="$(egrep '^\s*\.\s+\/' $file | awk '{print $2}' | sed 's/\s//g')"
		for file in $privileged_check_file_list ; do
			if [ -e $file ]; then
				absoluteFilePath="$(readlink -f $file)"
				file_gid=`stat -c "%g" $absoluteFilePath`
				if [ $file_gid -gt 99 ]; then 
					check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
					if [ $? -ne 0 ]; then								
						function_result=1
					fi
				fi	
				check_and_set_privileged_owner_group $absoluteFilePath			
			else
				which $file 1>/dev/null 2>&1
				if [ $? -eq 0 ]; then
					file_path="$(which $file | awk '{print $1}')"
					absoluteFilePath="$(readlink -f $file_path)"
					file_gid=`stat -c "%g" $absoluteFilePath`
					if [ $file_gid -gt 99 ]; then 
						check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
						if [ $? -ne 0 ]; then								
							function_result=1
						fi
					fi
					check_and_set_privileged_owner_group $absoluteFilePath
				fi				
			fi
		done
	fi
	
	return $function_result
}	

#--------------------------------------------------------------
#<cdf:title>Operating System Resources/INITD Command Group Permissions</cdf:title>
#<ruleName>INITD_Command_Group_Permissions</ruleName>
#<cdf:ruleName>INITD_Command_Group_Permissions</cdf:ruleName>
#<cdf:description>/etc/init.d/ -or /etc/rc.d/ directory structure. Each active entry's file/command/script executed, and all existing directories in its path must have settings for &quot;group&quot;  of r-x or more stringent, if owned by groups considered to be default groups for general users. (users). Active entries must be owned an id/group as identified in section 5.1 'The following system ids and group ids must own OSRs', or id which has Security &amp; System Administrative Authority.</cdf:description>

# Checking and setting owner and group permissions of active entries to privileged groups.
rule_INITD_Command_Group_Permissions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_INITD_Command_Group_Permissions: Operating System Resources/INITD Command Group Permissions."
	log_message "Parameters received: $arg_string"

	RuleResult=0
	
	INITD_Directory_List="/etc/init.d /etc/rc.d"
	for directory in $INITD_Directory_List
	do
		absoluteDirPath="$(readlink -f $directory)"
		if [ -d "$absoluteDirPath" ]; then
			log_message "Processing all files from directory $absoluteDirPath ..."			
			files="$(find "$absoluteDirPath")"
			for file_name in $files ; do
				if [ -e "$file_name" -a ! -z "$file_name" ]; then	
					sub_rule_INITD_Command_Group_Permissions $file_name					
					if [ $? -ne 0 ]; then
						RuleResult=1					
					fi
					absoluteFilePath="$(readlink -f $file_name)"
					file_gid=`stat -c "%g" $absoluteFilePath`
					if [ $file_gid -gt 99 ];then 
						check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
						if [ $? -ne 0 ]; then								
							RuleResult=1
						fi
					fi	
					check_and_set_privileged_owner_group $absoluteFilePath					
				fi
			done
		fi
	done
	
	if [ $RuleResult -eq 0 ]; then 
		log_message "Group permission and ownership for all active entries have required settings."  
	fi 
	
	return 
}
#--------------------------------------------------------------
sub_INITD_Command_WW_Permissions()
{
    file=$1

    if [ ! -e $file ]
	then
	    log_message "File $file does not exist. Skipping."
		return 0
	fi

	requested_other_permission="rx"
	function_result=0
	check_if_file_is_a_redirection $file
	result=$?
	if [ $result -eq 0 ]
	then
	    log_message "    $file is a redirection to $GlobalTargetFileNameAndPath"
		log_message "    Will work on $GlobalTargetFileNameAndPath"
		file=$GlobalTargetFileNameAndPath
	fi

	accepted_permission_modes_grep_expression="..[541]"
	file_and_path_check_and_set_other_permission_mode $file $requested_other_permission $accepted_permission_modes_grep_expression
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "    An error occurred while trying to set the OTHER permissions for $file; manual verification is needed."
		function_result=1
	fi

	return $function_result
}	

#--------------------------------------------------------------
# rule_INITD_Command_WW_Permissions from policy file:
#  <cdf:title>5.1 Operating System Resources/INITD Command WW Permissions</cdf:title> 
#  <cdf:description>/etc/init.d/ -or /etc/rc.d/ directory structure. Each active entry's file/command/script to be executed,
#       and all existing directories in its path, must have settings for "other" of r-x or more stringent.</cdf:description> 
# And from coverage matrix:
#   Each file which is executed as a result of links placed in this directory and all existing directories in its path must have
#   settings for "other"  of r-x or more stringent.
#   Actual files in this directory must meet the same requirement. 
# Arguments: none
rule_INITD_Command_WW_Permissions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_INITD_Command_WW_Permissions: Operating System Resources/INITD Command WW Permissions."
	log_message "Parameters received: $arg_string"

	RuleResult=0

	# 1) /etc/init.d/
	# Check if we have a redirection
	reqDir="/etc/init.d"
	dir_name="$(readlink -f $reqDir)"
	check_if_file_is_a_redirection $dir_name
	result=$?
	if [ $result -eq 0 ]
	then
	    log_message "    $dir_name is a redirection to target directory $GlobalTargetFileNameAndPath"
		log_message "    Will work on $GlobalTargetFileNameAndPath"
		dir_name=$GlobalTargetFileNameAndPath
	fi

    log_message "Processing all files in $dir_name ..."
	dir_name="$dir_name/*"
	for file_name in $dir_name ; do
		sub_INITD_Command_WW_Permissions $file_name
		result=$?
		if [ $result -ne 0 ]
		then
			RuleResult=1
		fi
	done

	# 2) /etc/rc.d/
	# Check if we have a redirection
	reqDir="/etc/rc.d"
	dir_name="$(readlink -f $reqDir)"
	check_if_file_is_a_redirection $dir_name
	result=$?
	if [ $result -eq 0 ]
	then
	    log_message "    $dir_name is a redirection to target directory $GlobalTargetFileNameAndPath"
		log_message "    Will work on $GlobalTargetFileNameAndPath"
		dir_name=$GlobalTargetFileNameAndPath
	fi
	
    log_message "Processing all files in $dir_name ..."
	dir_name="$dir_name/*"
	for file_name in $dir_name ; do
		check_if_file_is_a_directory $file_name
		result=$?
		if [ $result -ne 0 ]
		then
			# Current file is not a directory; process it
			sub_INITD_Command_WW_Permissions $file_name
			result=$?
			if [ $result -ne 0 ]
			then
				RuleResult=1
			fi
		fi
	done

	return 
}

#--------------------------------------------------------------
#<cdf:title>Operating System Resources/INITTAB Command Group Permissions</cdf:title>
#<ruleName>INITTAB_Command_Group_Permissions</ruleName>
#<cdf:ruleName>INITTAB_Command_Group_Permissions</cdf:ruleName>
#<cdf:description>/etc/inittab: Each active entry's file/command/script executed, and all existing directories in its path must have settings for &quot;group&quot;  of r-x or more stringent, if owned by groups considered to be default groups for general users. (users). Active entries must be owned an id/group as identified in section 5.1 'The following system ids and group ids must own OSRs', or id which has Security &amp; System Administrative Authority.</cdf:description>

#Checking and setting owner and group permissions of active entries to privileged groups.

rule_INITTAB_Command_Group_Permissions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_INITTAB_Command_Group_Permissions: Operating System Resources/INITTAB Command Group Permissions."
	log_message "Parameters received: $arg_string"

	file="/etc/inittab"

    if [ ! -e $file ]; then
	    log_message "File $file does not exist. Remediation not possible."	
		return
	fi

	requested_group_permission="rx"
	function_result=0

	# Format of definition in inittab file: id:rstate:action:process where process is the command to execute
	log_message "Reading entries from file $file ... "
	found_active_entry=0
	
	while read -r myline; do
		# Check if this line is a comment or blank
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		echo $first_word | grep "#" 1>/dev/null 2>&1
		if [ $? -eq 0 ]; then
		    skipp_line=1
		else
			if [ "$first_word" = "" ]; then
				skipp_line=1
			fi
		fi
		# Extract the command from the entry
		cmd=`echo -e $myline | awk 'BEGIN { FS = ":" } ; { print $4 }' | awk '{print $1}'`
		if [ "$cmd" = "" ]; then
			skipp_line=1
		fi
		if [ $skipp_line -eq 0 ]; then
			found_active_entry=1
			skip_entry=0
			log_message "Active entry found. Extracted command : $cmd"
			# Check if the entry has the path in it. If not, find it.
			if [ ! -e $cmd ]; then
			    which $cmd 1> /dev/null 2>&1				
				if [ $? -eq 0 ]; then
				    cmd=`which $cmd | awk '{print $1}'`
				else
				    log_message "Command $cmd file not found. Skipping this entry."
					skip_entry=1
				fi
			fi
			if [ $skip_entry -eq 0 ]; then
				# Check if the file name is a redirection to another file
				check_if_file_is_a_redirection $cmd				
				if [ $? -eq 0 ]; then
					log_message "$cmd is a redirection to target file $GlobalTargetFileNameAndPath, using target file"					
					cmd=$GlobalTargetFileNameAndPath
				fi
				grp=$(getGroup $cmd)
				if [ "$grp" = "$default_group" ]; then	
					log_message "Checking and setting requested group mode for command $cmd and directories in its path where applicable..."
					accepted_permission_modes_grep_expression=".[541]."
					file_and_path_check_and_set_group_permission_mode $cmd $requested_group_permission $accepted_permission_modes_grep_expression			
					if [ $? -ne 0 ]; then
						log_message "An error occurred while trying to set the group permissions for command $cmd; manual intervention is needed."
						function_result=1
					fi
				fi
				absoluteFilePath="$(readlink -f $cmd)"	
				file_gid=`stat -c "%g" $absoluteFilePath`
				if [ $file_gid -gt 99 ];then 
					check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
					if [ $? -ne 0 ]; then								
						function_result=1
					fi
				fi
				check_and_set_privileged_owner_group $absoluteFilePath		
			fi
		fi	
	done < $file
	
    if [ $found_active_entry -eq 0 ]; then
	    log_message "No active entry found in file $file. Remediation not required"
		function_result=0
	fi
	
	if [ $function_result -eq 0 ]; then 
		log_message "Group permission and ownership for all active entries have required settings."  
	fi 
	
	RuleResult=$function_result	
}

#--------------------------------------------------------------
# rule_INITTAB_Command_WW_Permissions from policy file:
# <cdf:requires idref="InittabV2" /> 
#  <cdf:title>5.1 Operating System Resources/INITTAB Command WW Permissions</cdf:title> 
#  <cdf:description>/etc/inittab: Each active entry's file/command/script to be executed, and all existing directories in its path,
#       must have settings for "other" of r-x or more stringent.</cdf:description> 
# Arguments: none
rule_INITTAB_Command_WW_Permissions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_INITTAB_Command_WW_Permissions: Operating System Resources/INITTAB Command WW Permissions."
	log_message "Parameters received: $arg_string"

	RuleResult=0

    file="/etc/inittab"

    if [ ! -e $file ]
	then
	    log_message "File $file does not exist. Cannot run this remediation."
		RuleResult=1
		return
	fi

	requested_other_permission="rx"
	function_result=0

	# Format of definition in inittab file:
	#    id:rstate:action:process 
	#    where process = the command to execute
	log_message "Reading entries from $file ... "
	found_active_entry=0
	while read -r myline; do
		# Check if this line is a comment or blank
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		echo $first_word | grep "#" 1>/dev/null 2>&1
		if [ $? -eq 0 ]
		then
		    skipp_line=1
		else
			if [ "$first_word" = "" ]
			then
				skipp_line=1
			fi
		fi
		# Extract the command from the entry
		cmd=`echo -e $myline | awk 'BEGIN { FS = ":" } ; { print $4 }' | awk '{print $1}'`
		if [ "$cmd" = "" ]
		then
			skipp_line=1
		fi
		if [ $skipp_line -eq 0 ]
		then
			found_active_entry=1
			skip_entry=0
			log_message "    Active entry found. Extracted command : $cmd"
			# Check if the entry has the path in it. If not, find it.
			if [ ! -e $cmd ]
			then
			    which $cmd 1> /dev/null 2>&1
				result=$?
				if [ $result -eq 0 ]
				then
				    cmd=`which $cmd | awk '{print $1}'`
				else
				    log_message "    $cmd file not found. Skipping this entry."
					skip_entry=1
				fi
			fi
			if [ $skip_entry -eq 0 ]
			then
				# Check if the file name is a redirection to another file
				check_if_file_is_a_redirection $cmd
				result=$?
				if [ $result -eq 0 ]
				then
					log_message "    $cmd is a redirection to target file $GlobalTargetFileNameAndPath"
					log_message "    Will work on $GlobalTargetFileNameAndPath"
					cmd=$GlobalTargetFileNameAndPath
				fi
				log_message "    Checking and setting requested others mode for $cmd and directories in its path where applicable..."
				accepted_permission_modes_grep_expression="..[541]"
				file_and_path_check_and_set_other_permission_mode $cmd $requested_other_permission $accepted_permission_modes_grep_expression
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "    An error occurred while trying to set the others permissions for $cmd; manual verification is needed."
					function_result=1
				fi
			fi
		fi	
	done < $file
    if [ $found_active_entry -eq 0 ]
	then
	    log_message "    No active entry found in file $file"
		function_result=0
	fi

	RuleResult=$function_result
	return 
}

#--------------------------------------------------------------
# rule_INITTAB_Full_Path_Restriction from policy file:
#  <cdf:requires idref="InittabV2" /> 
#  <cdf:title>5.1 Operating System Resources/INITTAB Full Path Restriction</cdf:title> 
#  <cdf:description>/etc/inittab: Each active entry must specify full path of the file/command/script to be executed.</cdf:description> 
#FROM COVERAGE MATRIX:
#/etc/inittab:
# Each active entry must specify full path of the file/command/script to be executed.
rule_INITTAB_Full_Path_Restriction()
{
	RuleResult=0
    arg_string=$*
	numb_of_args=`echo "$arg_string" | wc -w`;

	log_message "rule_INITTAB_Full_Path_Restriction: Operating System Resources/INITTAB Full Path Restriction"
	log_message "Parameters received: $arg_string"

	file="/etc/inittab"
	
	if [ ! -e $file ]
	then 
		log_message "$file does not exist. Cannot perform remediation. Exiting."	
		RuleResult=1
		return
	fi 
	
	log_message "Reading active entries from $file ... "
	tmpfile="/tmp/inittab.new$$"
	if [ -f $tmpfile ]
	then 
		rm $tmpfile
	fi 
	touch $tmpfile
	chmod 644 $tmpfile
	remediate=0
	while read -r myline
	do    
		# Check if this line is a comment or blank
		skipp_line=0
		first_word=`echo $myline | awk '{print $1}'`
		echo $first_word | grep "#" 1>/dev/null 2>&1
		if [ $? -eq 0 ]
		then
		    skipp_line=1
		else
			if [ "$first_word" = "" ]
			then
				skipp_line=1
			fi
		fi
		if [ $skipp_line -eq 0 ]
		then
			found_active_entry=1
			skip_entry=0
			field1=`echo "$myline" | awk -F':' '{print $1}'`
			field2=`echo "$myline" | awk -F':' '{print $2}'`
			field3=`echo "$myline" | awk -F':' '{print $3}'`
			rest_of_line=`echo "$myline" | awk -F':' '{print $4}'` # contains the command + command's parameters 
			cmd=`echo "$rest_of_line" | awk '{print $1}'`          # extract the command 
			param_cmd=`echo "$rest_of_line" |  $CutCommand -d' ' -f2-`     # extract the params
			if [ "$cmd" = "$param_cmd" ]
			then 
				param_cmd=""
			fi 

			if [ "$cmd" = "" ] 
			then 
				echo "$myline" >> $tmpfile
			else 
				log_message "    Active entry found. Extracted command : $cmd"
				# Check if the entry has the path in it. If not, find it.
				echo $cmd | grep "/" 1>/dev/null 2>&1
				if [ $? -ne 0 ]
				then
					# The path is not there
					GlobalTargetFileNameAndPath=''
					get_full_path $cmd
					result=$?
					if [ $result -eq 0 ]
					then
						cmd_path=$GlobalTargetFileNameAndPath
						remediate=`expr $remediate + 1`
						timestamp=`date "+%Y-%m-%d  %Hh%Mm%S"`
						log_message "# Remediation : "
						log_message "We comment out the following line : "
						log_message "    $myline"
						log_message "We add a new line based on the line we commented out except that we will replace << $cmd >> with << $cmd_path >> "
						log_message "    the new line will be :"
						log_message "    ${field1}:${field2}:${field3}:${cmd_path} ${param_cmd}"
						echo "# ${myline}" >> $tmpfile
						echo "# the above line was commented out by the Remediation Script Rule 46 @ $timestamp . It was replaced with the line below" >> $tmpfile
						echo "${field1}:${field2}:${field3}:${cmd_path} ${param_cmd}" >> $tmpfile
					else 
						log_message "Could not determine the full path of the command $cmd"
						echo "$myline" >> $tmpfile
						RuleResult=1 
					fi
				else
					# The path is there
					echo "$myline" >> $tmpfile
				fi
			fi
		else  # skip_line was set
			echo "$myline" >> $tmpfile
		fi	
	done < $file

	if [ $remediate -gt 0 ] 
	then
		log_message "Making $remediate changes into $file  ..."
		log_message "Verifying:"
		log_message "will run diff $tmpfile $file"
		result_change=`diff $tmpfile $file`
		if [ "$result_change" != "" ]
		then 
				log_message "Change report: "
				log_message "$result_change"
		fi 
		log_message "Will run cp -f $tmpfile $file"
		cp -f $tmpfile $file
		if [ $? -eq 0 ]
		then 
			log_message "The changes have been successfully applied."
		else 
			log_message "Failure! We could not apply the changes."
			RuleResult=1 
		fi 
		
	else 
		log_message "Nothing to do."
	fi 
	rm -f $tmpfile 2>/dev/null
	
	return
}	

sub_rule_Log_File_Restrictions()
{
	file=$1
	additional_perm=$2
	regular_perm=$3
		
	if [ -e $file ] ; then	       
	   check_privileged_GID $file $additional_perm $regular_perm
	   if [ $? -ne 0 ] ; then
		   return 1
	   fi
	   check_and_set_privileged_owner_group $file
	else
		log_message "File $file does not exist. Remediation cannot be done.."
	fi
	return 0
}

#<cdf:title>Operating System Resources/Log File Restrictions</cdf:title>
#<cdf:ruleName>Log_File_Restrictions</cdf:ruleName>
#<cdf:description>File permissions must be set: /var/log/wtmp: 775 
#pam_tally2.so in use: /var/log/tallylog: 600
#pam_tally2.so NOT in use: /var/log/faillog: 600
#Debian systems: /var/log/syslog: 755, /var/log/auth.log: 750
#Non Debian systems: /var/log/messages: 755, /var/log/secure: 750
#ote: For all files permissions can be more restrictive. Write access for group is allowed if conditions are met: The associated group is identified as having a privileged GID number per section 5.2 in coverage document.</cdf:description>
#<scm:violationMessage>Invalid Permissions for log file: {1}, Permissions: {2}. For more information see rules description and coverage matrix document.</scm:violationMessage>
#
#Permissions of log files are checked else set to the required permissions
rule_Log_File_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
    RuleResult=0
	error=0
	
	log_message "rule_Log_File_Restrictions: 5.1 Operating System Resources/Log File Restrictions"
	log_message "Parameters received: $arg_string"

	syslog_file="/var/log/syslog"
    auth_file="/var/log/auth.log"
	faillog_file="/var/log/faillog"
	messages_file="/var/log/messages"
	secure_file="/var/log/secure"
	wtmp_file="/var/log/wtmp"
	tallylog_file="/var/log/tallylog"
		
	if [ -e $wtmp_file ] ; then	       
		#check_and_set_file_permission "$wtmp_file" "775"
		sub_rule_Log_File_Restrictions "$wtmp_file" "775" "775"	   
	   if [ $? -ne 0 ] ; then
		   error=`expr error + 1`
	   fi
	else
		log_message "File $wtmp_file does not exist. Remediation not required.."
	fi
	
	# Checking if pam_tally2.so is in use
	system_file_pam_tall2_count="$(egrep -R pam_tally2.so /etc/pam.d/* |cut -f 2 -d ":"|egrep -c -v '^\s*#')"
	
	if [ $system_file_pam_tall2_count -ge 1 ];then 
		sub_rule_Log_File_Restrictions "$tallylog_file" "620" "600"
		if [ $? -ne 0 ] ; then
		error=`expr error + 1`
		fi
	else 
		sub_rule_Log_File_Restrictions "$faillog_file" "620" "600"
		if [ $? -ne 0 ] ; then
			error=`expr error + 1`
		fi
	fi 	
		
	if [ "$IsDebian" = "1" -o  "$IsUbuntu" = "1" ] ; then
		# Debian systems: /var/log/syslog: 755, /var/log/auth.log: 750
		sub_rule_Log_File_Restrictions  "$syslog_file" "775" "755"
		if [ $? -ne 0 ] ; then
		   error=`expr error + 1`
		fi		
		sub_rule_Log_File_Restrictions  "$auth_file" "775" "750"		   
		if [ $? -ne 0 ] ; then
		   error=`expr error + 1`
		fi
	else
		# Non Debian systems: /var/log/messages: 755, /var/log/secure: 750
		sub_rule_Log_File_Restrictions "$messages_file" "775" "755"
		if [ $? -ne 0 ] ; then
			error=`expr error + 1`
		fi
		sub_rule_Log_File_Restrictions "$secure_file" "770" "750"						
		if [ $? -ne 0 ] ; then
			error=`expr error + 1`
		fi		
    fi
  
    if [ $error -gt 0 ] ; then	        
		RuleResult=1  	   
	else
	    RuleResult=0
	fi	
	
    return
}

#--------------------------------------------------------------
# rule_OPASSWD_restrictions from policy file:
#  <cdf:requires idref="FilePermsV2-perms" /> 
#  <cdf:title>5.1 Operating System Resources/OPASSWD Restrictions</cdf:title> 
#  <cdf:description>Prevent reuse of last four passwords - requires /etc/security/opasswd to exist. Permissions should be 0600 and owner should be root.</cdf:description> 
# Arguments:
#   This rule expects as second parameter the value to apply as /etc/security/opasswd file permissions (octal value).
rule_OPASSWD_restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

    opasswd_file="/etc/security/opasswd" 	

	log_message "rule_OPASSWD_restrictions: $opasswd_file file permissions."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as $opasswd_file file permissions (octal value)."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 0600 as parameter (Read and Write permission only for root)."
		requested_permission_value=0600
	else 
		requested_permission_value=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the permission: must be an octal value
		if echo $requested_permission_value | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The file permission value is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
    # Check that the file exists; if not, create it.
	if [ ! -e $opasswd_file ]
	then
	    log_message "$opasswd_file not found on the system. Creating it."
		touch $opasswd_file 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
		    log_message "Failed creating $opasswd_file"
			RuleResult=1
			return
		fi			
	fi
	
	
    # Make sure the owner of the file is root
    check_and_set_file_root_owner $opasswd_file
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "Failed setting root as owner of $opasswd_file"
		RuleResult=1
		return
	fi			
	
    check_and_set_file_permission $opasswd_file $requested_permission_value
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	else	
		RuleResult=0
	fi			

	return
}

#This function checks the UID and GID of the directory and sets the Privileged owner and group to directory
check_and_set_privileged_owner_group()
{
    file=$1
	login_file="/etc/login.defs"
	RuleResult=0	
	
	type=""
	if [ -d "$file" ]; then
		type="directory"
	elif [ -f "$file" ]; then
		type="file" 
	else
		log_message "$file is not a file or directory. Exiting..."
		return
	fi
		
	#get the current UID and GID of $file
	file_uid=`stat -c "%u" $file`
	file_gid=`stat -c "%g" $file`
		
	# Get the SYS_UID_MAX and SYS_GID_MAX from /etc/login.def file.
	# To work the code on SLES and RHEL in grep we used "_UID_MAX" as in SLES its SYSTEM_UID_MAX and in RHEL "SYS_UID_MAX"
	# Same for "GID_MAX"	
	#max_allowed_uid=`cat $login_file | grep -v "^#" | grep "_UID_MAX" | awk -F' ' '{print $2}'`
	#max_allowed_gid=`cat $login_file | grep -v "^#" | grep "_GID_MAX" | awk -F' ' '{print $2}'`
	
	max_allowed_uid=`cat $login_file | grep -v "^#" | grep "[SYS|SYSTEM]_UID_MAX" | awk -F' ' '{print $2}'`
	max_allowed_gid=`cat $login_file | grep -v "^#" | grep "[SYS|SYSTEM]_GID_MAX" | awk -F' ' '{print $2}'`
	
	#Use the min_allowed_uid and min_allowed_gid value if SYS_UID_MAX and SYS_GID_MAX are blank
	min_allowed_uid=`cat $login_file | egrep "^\s*UID_MIN" | awk -F' ' '{print $2}'`
	min_allowed_gid=`cat $login_file | egrep "^\s*GID_MIN" | awk -F' ' '{print $2}'`
	
	if [ "$max_allowed_uid" = "" ]; then
		if [ "$min_allowed_uid" = "" ]; then
			log_message "UID_MAX and UID_MIN parameters are not exist in $login_file for $type $file"
			log_message "Remediation cannot be done"
			RuleResult=1
			return 
		else
			max_allowed_uid=`expr $min_allowed_uid - 1` 
		fi 
	fi
		
	if [ "$max_allowed_gid" = "" ];	then
		if [ "$min_allowed_gid" = "" ]; then 
			log_message "GID_MAX and GID_MIN parameters are not exist in $login_file for $type $file"
			log_message "Remediation cannot be done"
			RuleResult=1
			return 
		else
			max_allowed_gid=`expr $min_allowed_gid - 1` 
		fi 	    
	fi	
	
	if [ $file_uid -gt $max_allowed_uid ]; then	
	   	log_message "Owner of $type $file is not Privileged owner. Remediation required.."
		`chown root $file`		
		result=$?
		if [ $result -eq 0 ] ; then
			log_message "Successfully Changed owner of $type $file to root"
		else
			log_message "Error while changing owner of $type $file to root"
			RuleResult=1
		fi	
	fi
	# gid=100 referes to users groups which is considered as non-priviledged group.Thus needs to be changed to root 
	if [ $file_gid -gt $max_allowed_gid -o $file_gid -eq 100 ]; then
	   	log_message "Group of $type $file is not Privileged group. Remediation required.."
		`chgrp root $file`		
		result=$?
		if [ $result -eq 0 ] ; then
			log_message "Successfully Changed group of $type $file to root"
		else
			log_message "Error while changing group of $type $file to root"
			RuleResult=1
		fi
	fi
}

#--------------------------------------------------------------
# rule_OSR_Directory_Restrictions from policy file:
# Parameters: single permission octal value to apply to the files followed by the list of these file's names (with complete paths).
#<cdf:title>Operating System Resources/OSR Directory Restrictions</cdf:title>
#<cdf:ruleName>OSR_Directory_Restrictions</cdf:ruleName>
#<cdf:description>UNIX OSR directory - Settings for other on this directory must be r-x or more stringent. /var, /.</cdf:description>
#<scm:violationMessage>{1} {2}, Owner: {3}, Group: {4}, Permissions: {5}, Settings for other must be r-x or more stringent. Must be owned by privileged Owner and Group</scm:violationMessage>
#Checked and set the privileged owner and group for the /var and / directories
rule_OSR_Directory_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_OSR_Directory_Restrictions: UNIX OSR directory Restrictions."
	log_message "Parameters received: $arg_string"

	if [ $num_of_arguments -lt 4 ] ; then
		log_message "This rule expects as parameters a permission string to apply to OTHERS on OSR directories followed by the list of these directories (with complete paths)."
		log_message "Example: rule_OSR_Directory_Restrictions rx /var / (for read and execute permission)."
		if [ $FailIfMissingParameters -eq 1 ] ; then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
	    folder_list="/var /"
		folder_permissions="rx"
		log_message "There are missing parameters. We will use the following defaults for OTHERS permission definition: $folder_permissions $folder_list."
		num_of_folders=2
	else 
	    # Take out the rule_OSR_Directory_Restrictions substring to get the other parameters
	    folder_list=`echo $arg_string | sed s,"rule_OSR_Directory_Restrictions",,`
		num_of_folders=`expr $num_of_arguments - 2`
		# Extract the permission value from the argument string and remove it from the string
		folder_permissions=`echo "$folder_list" | awk '{ print $1 }'`
		folder_list=`echo $folder_list | sed s,$folder_permissions,,`
	fi
 	
	# Validate the permission
	if echo $folder_permissions | grep "[^rwx"] 2>&1 > /dev/null
	then
	    log_message "The folder permission $folder_permissions is not a valid permission string. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

	got_error=0
    folders_processed=0
	while [ $folders_processed -lt $num_of_folders ]
	do
	    next_folder=`echo "$folder_list" | awk '{ print $1 }'`
		# Remove the processed folder from the list
		folder_list=`echo $folder_list | sed s,$next_folder,,`
		# Set the requested OTHERS permission for the current folder
		log_message "Setting folder permissions for OTHERS to $folder_permissions for folder $next_folder"
		chmod o=$folder_permissions $next_folder 2> /dev/null
		result=$?
		if [ $result -ne 0 ] ; then
			log_message "Failed to set OTHERS permission for folder $next_folder (error = $result)."
			got_error=1
		else	
            # Get folder permission as a readable string
			permission_string=`stat -c "%A" $next_folder | awk '{print $1}'`
			log_message "Permissions for OTHERS have been set to $folder_permissions (complete folder permissions = $permission_string) for folder $next_folder."
		fi
		folders_processed=`expr $folders_processed + 1`
	done
		
	if [ $got_error -ne 0 ] ; then
		RuleResult=1
	else	
		RuleResult=0
	fi			
 
    check_and_set_privileged_owner_group "/var"
	check_and_set_privileged_owner_group "/" 
	
	return
}

#--------------------------------------------------------------
#<cdf:title>Protecting Resources-OSRs/OSR \TMP Directory Restrictions</cdf:title>
#<cdf:ruleName>OSR_TMP_Directory_Restrictions</cdf:ruleName>
#<cdf:description>UNIX OSR /tmp, /var/tmp directorys - Settings for this directorys must be rwxrwxrwt(1777). More stringent value can be set. Must be owned by privileged Owner and Group.</cdf:description>
#<scm:violationMessage>{1} {2}, Owner: {3}, Group: {4}, Permissions: {5}, Settings for this directory must be rwxrwxrwt(1777) and Must be owned by privileged Owner and Group</scm:violationMessage>
# for remediation settings of /tmp and /var/tmp directories set to 1777
rule_OSR_TMP_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
    
    tmp_dir="/tmp/"
	var_tmp_dir="/var/tmp"
    relative_dir="tmp"
	parent_dir="/"
	var_tmp_parent_dir="/var"
	
	log_message "rule_OSR_TMP_Restrictions: $tmp_dir, $var_tmp_dir directory permissions."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ] ; then
		log_message "This rule expects as second parameter the value to apply as $tmp_dir directory permissions (octal value)."
		if [ $FailIfMissingParameters -eq 1 ] ; then
		    log_message "Exiting due to missing parameter(s)..."			
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 1777 as parameter (rwxrwxrwt)."
		requested_permission_value=1777
	else 
		requested_permission_value=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the permission: must be an octal value
		if echo $requested_permission_value | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The file permission value is not a valid octal number. Please verify the parameters. Exiting."			
			return
		fi
	fi
 	
	check_and_set_directory_permission $tmp_dir $requested_permission_value $parent_dir $relative_dir
	result1=$?
	check_and_set_directory_permission $var_tmp_dir $requested_permission_value $var_tmp_parent_dir $relative_dir
	result2=$?
	
	check_and_set_privileged_owner_group "/tmp"
	result3=$?
	check_and_set_privileged_owner_group "/var/tmp"
	result4=$?
	
	if [ $result1 -eq 0 -a $result2 -eq 0 -a $result3 -eq 0 -a $result4 -eq 0 ] ; then
		RuleResult=0	
	fi			
	
	return
}

#--------------------------------------------------------------
# rule_OSR_VAR_Restrictions from policy file:
#<cdf:title>Operating System Resources/OSR \VAR Restrictions</cdf:title>
#<ruleName>OSR_VAR_Restrictions</ruleName>
#<cdf:ruleName>OSR_VAR_Restrictions</cdf:ruleName>
#<cdf:description>/var/tmp,/var/log,/var/log/faillog,/var/log/tallylog,/var/log/messages,/var/log/syslog,/var/log/wtmp,/var/log/secure,/var/log/auth.log . Must be owned by privileged Owner and Group.</cdf:description>
#<scm:violationMessage>{1} {2}, Owner: {3}, Group: {4}. Must be owned by privileged Owner and Group</scm:violationMessage>
            
rule_OSR_VAR_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_OSR_VAR_Restrictions:"
	log_message "Parameters received: $arg_string"

	#check for the privileged owner and group else set the privileged group and owner to root 
	#Linux ITCS104 TechSpec Changes
	
	arr="/var/tmp /var/log /var/log/faillog /var/log/tallylog /var/log/messages /var/log/syslog /var/log/wtmp /var/log/secure /var/log/auth.log"
  
	for file in $arr
	do
		check_and_set_privileged_owner_group "$file"        
	done 
   
	return
}
#--------------------------------------------------------------
# recursively_prevent_directories_others_write_permission
# NOTE: subdirectories of /var may be world writable if and only if the permissions are 1777.
recursively_prevent_directories_others_write_permission()
{
    base_directory=$1

	recursive_check_got_error=0
	
	# check all the directories
	log_message "Recursively checking all directories under $base_directory..."
	
	$FindCommand $base_directory -type d -perm -o+w -a \! -perm 1777 | while read -r current_directory
	do
		directory_permissions=`stat -c "%A" $current_directory | awk '{print $1}'`
		directory_others_permissions=`echo ${directory_permissions:7:3}`
		log_message "    Current OTHERS permission of $current_directory: $directory_others_permissions"
		others_permission_mode=`echo $directory_others_permissions | sed s/'w'/''/g`
		others_permission_mode=`echo $others_permission_mode | sed s/'-'/''/g`
		log_message "    Changing OTHERS permission of $current_directory to $others_permission_mode"
		chmod o=$others_permission_mode $current_directory 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "    Failed to set permissions for $current_directory (error = $result)."
			recursive_check_got_error=1
		fi
	done

	log_message "Recursive scan of $base_directory completed."
	
	return $recursive_check_got_error
}

#--------------------------------------------------------------
# rule_OSR_VAR_LOG_Subdirectory_Restrictions from policy file:
# <cdf:requires idref="FilePermsV2-varsub" /> 
#  <cdf:title>5.1 Operating System Resources/OSR \VAR\LOG Subdirectory Restrictions</cdf:title> 
#  <cdf:description>Subdirectories of /var/log may be world writable if and only if the permissions are 1777</cdf:description> 
# <<<<<<<<<< YET, the requirement coverage matrix states the following:
# /var/log
# Settings for other on this directory must be r-x or more restrictive.
# Note: subdirectories of /var may be world writable if and only if the permissions are 1777.
# So the coverage matrix refers to this directory /var/log and subdirectories of /var, not subdirectories of /var/log.
# I have requested clarifications on this August 10 2015.
# For the moment I will code the rule remediation function to act on /var/log itself, not its subdirectories.
# Arguments:
#   this rule expects as second parameter the value to apply as /var/log directory permissions for OTHERS (string value, for instance rx).
rule_OSR_VAR_LOG_Subdirectory_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	got_error=0

    var_log_dir="/var/log"

	log_message "rule_OSR_VAR_LOG_Subdirectory_Restrictions: $var_log_dir directory permissions for OTHERS."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as $var_log_dir directory permissions for OTHERS (string value, for instance rx)."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use rx as parameter (read and execute permission)."
		requested_permission_value="rx"
	else 
		requested_permission_value=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the permission
		if echo $requested_permission_value | grep "[^rwx"] 2>&1 > /dev/null
		then
			log_message "The folder permission $requested_permission_value is not a valid permission string. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
	# Set the requested OTHERS permission for the $var_log_dir folder
	chmod o=$requested_permission_value $var_log_dir 2> /dev/null
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "Failed to set OTHERS permission for folder $var_log_dir (error = $result)."
		RuleResult=1
	else	
		# Get complete folder permission as a readable string
		permission_string=`stat -c "%A" $var_log_dir | awk '{print $1}'`
		log_message "Permissions for OTHERS have been set to $requested_permission_value (complete folder permissions = $permission_string) for folder $var_log_dir."
		RuleResult=0
	fi

	###### defect 149099
	#  /var/log 
	log_message "Checking directory /var/log (recursively)..."
	base_directory="/var/log"
	recursively_prevent_directories_others_write_permission $base_directory
	result=$?
	if [ $result -ne 0 ]
	then
		got_error=1
	fi
	
	if [ $got_error -ne 0 ]
	then
		RuleResult=1
	else	
		RuleResult=0
	fi	
	######
	return
}

#--------------------------------------------------------------
# rule_OSR_VAR_TMP_Directory_Restriction from policy file:
#  <cdf:requires idref="FilePermsV2-perms" /> 
#  <cdf:title>5.1 Operating System Resources/OSR \VAR\TMP Directory Restriction</cdf:title> 
#  <cdf:description>Files in /var/tmp and its subdirectories may not have both the other-write and any execute permissions set.</cdf:description> 
#  <scm:violationMessage>Invalid OSR ACL for {1}, Owner: {2}, Group: {3}, Permissions: {4}, Settings for this directory must be rwxrwxrwt(1777)</scm:violationMessage>
# <<< SO THE VIOLATION MESSAGE DOES NOT MATCH THE DESCRIPTION <<< 
# <<<<<<<<<< the requirement coverage matrix states the following:
# Settings for this directory must be rwxrwxrwt(1777).
# <<< I will code on the basis of that for now; I requested clarifications <<<
# Arguments:
#   this rule expects as second parameter the OCTAL value to apply as /var/tmp directory permissions, for example 1777).
rule_OSR_VAR_TMP_Directory_Restriction()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

    var_tmp_dir="/var/tmp"

	log_message "rule_OSR_VAR_TMP_Directory_Restriction: $var_tmp_dir directory permissions."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the octal value to apply as $var_tmp_dir directory permissions (for instance 1777)."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 1777 as parameter."
		requested_permission_value=01777
	else 
		requested_permission_value=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the permission
		if echo $requested_permission_value | grep "[^0-7"] 2>&1 > /dev/null
		then
			log_message "The folder permission $requested_permission_value is not a valid octal permission value. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
	# Set the requested permission for the $var_tmp_dir folder
	chmod $requested_permission_value $var_tmp_dir 2> /dev/null
	result=$?
	if [ $result -ne 0 ]
	then
		log_message "Failed to set permission for folder $var_tmp_dir (error = $result)."
		RuleResult=1
	else	
		# Get complete folder permission as a readable string
		permission_string=`stat -c "%A" $var_tmp_dir | awk '{print $1}'`
		log_message "Permissions have been set to $requested_permission_value (complete folder permissions = $permission_string) for folder $var_tmp_dir."
		RuleResult=0
	fi

	return
}

#--------------------------------------------------------------
# rule_OSR_ETC_Restrictions from ITCS104 policy file Rule id="79":
# <cdf:title>Operating System Resources/OSR \ETC Restrictions</cdf:title>
# <cdf:ruleName>OSR_ETC_Restrictions</cdf:ruleName>
# <cdf:description>UNIX OSR directory - Settings for other on this directory "/etc" must be r-x or more stringent. Must be owned by privileged Owner and Group. This requirement applied recursively.</cdf:description>
# <scm:violationMessage>{1} {2}, Owner: {3}, Group: {4}, Permissions: {5}, Settings for other must be r-x or more stringent. Must be owned by privileged Owner and Group</scm:violationMessage>
# Recursively check permission Settings for other on "/etc" directory which must be r-x or more stringent. Then recursively check all directories and files for privileged Owner and Group and change them accordingly.
rule_OSR_ETC_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_OSR_ETC_Restrictions: Operating System Resources/OSR \ETC Restrictions"
	log_message "Parameters received: $arg_string"

	log_message "Checking directory /etc (recursively)..."
	base_directory="/etc"
	recursively_prevent_directories_and_files_others_write_permission $base_directory
	result=$?

	if [ $result -ne 0 ]
	then
		RuleResult=1
	else
		RuleResult=0
	fi
	
	$FindCommand $base_directory -not -user root -or -not -group root | while read -r current_file
	do
		check_and_set_privileged_owner_group "$current_file"
	done
		
	return
}

#--------------------------------------------------------------
# rule_OSR_USR_Restrictions from ITCS104 policy file Rule id="81"
# <cdf:title>Operating System Resources/OSR \USR Restrictions</cdf:title>
# <cdf:ruleName>OSR_USR_Restrictions</cdf:ruleName>
# <cdf:description>UNIX OSR directory - Settings for other on this directory "/usr" must be r-x or more stringent. Must be owned by privileged Owner and Group. This requirement applied recursively.</cdf:description>
# <scm:violationMessage>{1} {2}, Owner: {3}, Group: {4}, Permissions: {5}, Settings for other must be r-x or more stringent. Must be owned by privileged Owner and Group</scm:violationMessage>
# Recursively check permission Settings for other on "/usr" directory which must be r-x or more stringent. Then recursively check all directories and files for privileged Owner and Group and change them accordingly.
rule_OSR_USR_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_OSR_USR_Restrictions: Operating System Resources/OSR \USR Restrictions"
	log_message "Parameters received: $arg_string"
	
	log_message "Checking directory /usr (recursively)..."
	base_directory="/usr"
	recursively_prevent_directories_and_files_others_write_permission $base_directory
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	else
		RuleResult=0
	fi
		
	$FindCommand $base_directory -not -user root -or -not -group root | while read -r current_file
	do
		check_and_set_privileged_owner_group "$current_file"
	done
	
	return
}

#--------------------------------------------------------------
# sub_rule_RC_Command_Group_perms_function
# Check all the files in a directory for group permissions
sub_rule_RC_Command_Group_perms_function()
{
	dir_name=$1

	requested_group_permission="rx"
	accepted_permission_modes_grep_expression=".[541]."
	function_result=0

	# Check if we have a directory redirection
	check_if_file_is_a_redirection $dir_name	
	if [ $? -eq 0 ]; then
	    log_message "Directory $dir_name is a redirection to target directory $GlobalTargetFileNameAndPath, will use target directory"		
		dir_name=$GlobalTargetFileNameAndPath
	fi
	is_dir_emtpy=`ls -1 $dir_name`
	if [ "$is_dir_emtpy" = "" ]; then
		log_message "Directory $dir_name is empty."
	else
		log_message "Processing all files in directory $dir_name ..."
		dir_name="$dir_name/*"		
		for file_name in $dir_name ; do
			check_if_file_is_a_directory $file_name	
			if [ $? -ne 0 ]; then
				# Current file is not a directory; process it
				check_if_file_is_a_redirection $file_name				
				if [ $? -eq 0 ]; then
					file_name=$GlobalTargetFileNameAndPath
				fi

				grp=$(getGroup $file_name)
				if [ "$grp" = "$default_group" ]; then 
					log_message "Processing file $file_name..."
					file_and_path_check_and_set_group_permission_mode $file_name $requested_group_permission $accepted_permission_modes_grep_expression		
					if [ $? -ne 0 ]; then
						log_message "An error occurred while trying to set the group permissions for $file_name; manual verification is needed."
						function_result=1
					fi
				fi
				
				if [ -f $file_name ]; then
					privileged_check_file_list="$(egrep '^[[:space:]]*\.[[:space:]]+\/' $file_name | awk '{print $2}' | sed 's/\s//g')"
					
					for file in $privileged_check_file_list ; do
						if [ -e $file ]; then
							absoluteFilePath="$(readlink -f $file)"
							file_gid=`stat -c "%g" $absoluteFilePath`
							if [ $file_gid -gt 99 ]; then 
								check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
								if [ $? -ne 0 ]; then								
									function_result=1
								fi
							fi	
							check_and_set_privileged_owner_group $absoluteFilePath			
						else
							which $file 1>/dev/null 2>&1
							if [ $? -eq 0 ]; then
								file_path="$(which $file | awk '{print $1}')"
								absoluteFilePath="$(readlink -f $file_path)"
								file_gid=`stat -c "%g" $absoluteFilePath`
								if [ $file_gid -gt 99 ]; then 
									check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
									if [ $? -ne 0 ]; then								
										function_result=1
									fi
								fi
								check_and_set_privileged_owner_group $absoluteFilePath
							fi				
						fi
					done
				fi
			fi
		done		
	fi
	return $function_result
}	

#--------------------------------------------------------------
# rule_RC_Command_Group_Permissions from policy file:
#<cdf:title>Operating System Resources/RC Command Group Permissions</cdf:title>
#<ruleName>RC_Command_Group_Permissions</ruleName>
#<cdf:ruleName>RC_Command_Group_Permissions</cdf:ruleName>
#<cdf:description>rc0.d, rc1.d, rc2.d, rc3.d, rc4.d, rc5.d, rc6.d, rcS.d directories under /etc/init.d/ directory -or- rc0.d, rc1.d, rc2.d, rc3.d, rc4.d, rc5.d, rc6.d, rcS.d directories under  /etc/rc.d/ directory. Each active entry's file/command/script executed, and all existing directories in its path must have settings for &quot;group&quot;  of r-x or more stringent, if owned by groups considered to be default groups for general users. (users)</cdf:description>

#  Each file which is executed as a result of links placed in this directory and all existing directories in its path must have
#  settings for "group"  of r-x or more stringent, if owned by groups considered to be default groups for general users.
#  Actual files in this directory must meet the same requirement. 
#  Checking and setting owner and group permissions for privileged access.

rule_RC_Command_Group_Permissions()
{
    arg_string=$1
    
	log_message "Operating System Resources/RC Command Group Permissions"
	log_message "Parameters received: $arg_string"
	RuleResult=0
	
	RC_Directory_List="/etc/init.d /etc/rc.d /etc/init.d/rc0.d /etc/init.d/rc1.d /etc/init.d/rc2.d /etc/init.d/rc3.d /etc/init.d/rc4.d /etc/init.d/rc5.d /etc/init.d/rc6.d /etc/init.d/rcS.d /etc/rc.d/rc0.d /etc/rc.d/rc1.d /etc/rc.d/rc2.d /etc/rc.d/rc3.d  /etc/rc.d/rc4.d /etc/rc.d/rc5.d /etc/rc.d/rc6.d /etc/rc.d/rcS.d"
	
	# Creating Unique list of directories to be processed 
	dirlist=""
	for directory in $RC_Directory_List; do
		dirpath="$(readlink -f $directory)"
		dirlist="$dirlist $dirpath"
	done
	RC_Directory_List=`echo "$dirlist" | tr ' ' '\n' | sed '/^$/d' | sort | uniq`
	
	for directory in $RC_Directory_List; do
		absoluteDirPath="$(readlink -f $directory)"					
		if [ -d "$absoluteDirPath" ]; then
			sub_rule_RC_Command_Group_perms_function $absoluteDirPath
			result=$?
			if [ $result -ne 0 ]; then
				RuleResult=1			
			fi		
			is_dir_emtpy=`ls -1 $absoluteDirPath`
			if [ ! "$is_dir_emtpy" = "" ]; then			
				FILES=$absoluteDirPath"/*"			 
				for file in $FILES
				do 	
					absoluteFilePath="$(readlink -f $file)"
					if [ -e "$absoluteFilePath" -a ! -z "$absoluteFilePath" ]; then
						file_gid=`stat -c "%g" $absoluteFilePath`
						if [ $file_gid -gt 99 ]; then 
							check_and_set_priviledged_command_groups_permissions $absoluteFilePath $file_gid
							if [ $? -ne 0 ]; then								
								RuleResult=1
							fi
						fi
						check_and_set_privileged_owner_group $absoluteFilePath
					fi
				done	
			fi
		 fi
	done
	
	if [ $RuleResult -eq 0 ]; then 
		log_message "Group permission and ownership for all active entries have required settings."  
	fi 
	
	return 
}

#--------------------------------------------------------------
# Check all the files in a directory for others permissions
sub_rule_RC_Command_WW_perms_function()
{
	dir_name=$1

	if [ ! -d $dir_name ] ; then
	    log_message "Directory $dir_name not found. Skipping..."
		return 0
	fi

	requested_others_permission="rx"
	accepted_permission_modes_grep_expression="..[541]"
	function_result=0

	# Check if we have a directory redirection
	check_if_file_is_a_redirection $dir_name
	result=$?
	if [ $result -eq 0 ] ; then
	    log_message "    $dir_name is a redirection to target directory $GlobalTargetFileNameAndPath"
		log_message "    Will work on $GlobalTargetFileNameAndPath"
		dir_name=$GlobalTargetFileNameAndPath
	fi
	
    log_message "Processing all files in $dir_name ..."
	dir_name="$dir_name/*"
	for file_name in $dir_name ; do
		check_if_file_is_a_directory $file_name
		result=$?
		if [ $result -ne 0 ] ; then
			# Current file is not a directory; process it
			check_if_file_is_a_redirection $file_name
			result=$?
			if [ $result -eq 0 ]
			then
				file_name=$GlobalTargetFileNameAndPath
			fi

			file_and_path_check_and_set_other_permission_mode $file_name $requested_others_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ] ; then
				log_message "    An error occurred while trying to set the group permissions for $file_name; manual verification is needed."
				function_result=1
			fi
		fi
	done
	
	return $function_result
}	

#--------------------------------------------------------------
# rule_RC_Command_WW_Permissions from policy file:
# <cdf:title>5.1 Operating System Resources/RC Command WW Permissions</cdf:title> 
# <cdf:description> /etc/init.d/rc0.d, /etc/init.d/rc1.d, /etc/init.d/rc2.d, /etc/init.d/rc3.d, /etc/init.d/rc4.d, /etc/init.d/rc5.d, /etc/init.d/rc6.d, /etc/init.d/rcS.d directories -or- /etc/rc.d/rc0.d, /etc/rc.d/rc1.d, /etc/rc.d/rc2.d, /etc/rc.d/rc3.d, /etc/rc.d/rc4.d, /etc/rc.d/rc5.d, /etc/rc.d/rc6.d, /etc/rc.d/rcS.d directories. Each active entry's file/command/script to be executed, and all existing directories in its path, must have settings for "other" of r-x or more stringent. </cdf:description>

#  Each file which is executed as a result of links placed in this directory and all existing directories in its path
#  must have settings for "other"  of r-x or more stringent.
#  Actual files in this directory must meet the same requirement.
#  soft-link check added for /etc/rc.d directory for SuSE compatibility. 
rule_RC_Command_WW_Permissions()
{
    arg_string=$1
    
	log_message "5.1 Operating System Resources/RC Command WW Permissions"
	log_message "Parameters received: $arg_string"

	RuleResult=0
	
	directory="/etc/init.d"
	absoluteDirPath="$(readlink -f $directory)"
	sub_rule_RC_Command_WW_perms_function $absoluteDirPath
	result=$?
	if [ $result -ne 0 ] ; then
		RuleResult=1
	fi
	
	directory="/etc/rc.d"
	absoluteDirPath="$(readlink -f $directory)"
	sub_rule_RC_Command_WW_perms_function $absoluteDirPath
	result=$?
	if [ $result -ne 0 ] ; then
		RuleResult=1
	fi
	
	i=0
	while [ $i -lt 7 ] ; do
		directory="/etc/init.d/rc$i.d"
		absoluteDirPath="$(readlink -f $directory)"
		sub_rule_RC_Command_WW_perms_function $absoluteDirPath
		result=$?
		if [ $result -ne 0 ] ; then
			RuleResult=1
		fi
		i=`expr $i + 1`
	done
	
	directory="/etc/init.d/rcS.d"
	absoluteDirPath="$(readlink -f $directory)"
	sub_rule_RC_Command_WW_perms_function $absoluteDirPath
	result=$?
	if [ $result -ne 0 ] ; then
		RuleResult=1
	fi
	
	i=0
	while [ $i -lt 7 ] ; do
		directory="/etc/rc.d/rc$i.d"
		absoluteDirPath="$(readlink -f $directory)"
		sub_rule_RC_Command_WW_perms_function $absoluteDirPath
		result=$?
		if [ $result -ne 0 ] ; then
			RuleResult=1
		fi
		i=`expr $i + 1`
	done
	
	directory="/etc/rc.d/rcS.d"
	absoluteDirPath="$(readlink -f $directory)"
	sub_rule_RC_Command_WW_perms_function $absoluteDirPath
	result=$?
	if [ $result -ne 0 ] ; then
		RuleResult=1
	fi
	
	return 
}

#--------------------------------------------------------------
# rule_SNMPD_CONF_Restrictions from policy file:
#  <cdf:requires idref="FilePermsV2-perms" /> 
#  <cdf:title>5.1 Operating System Resources/SNMPD.CONF Restrictions</cdf:title> 
#  <cdf:description>snmpd.conf - Permissions must be 0640 or more restrictive if the file exists Note: possible locations are the /etc, /etc/snmp, or /etc/snmpd subdirectory</cdf:description> 
# NOTE: action is taken only if the file exists
# Arguments:
#   this rule expects as second parameter the value to apply as snmpd.conf file permissions (octal value).
rule_SNMPD_CONF_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

    # Possible locations for the file: /etc, /etc/snmp, or /etc/snmpd.
	# We will check all locations.
    snmpd_file1="/etc/snmpd.conf" 	
    snmpd_file2="/etc/snmp/snmpd.conf" 	
    snmpd_file3="/etc/snmpd/snmpd.conf" 	

	log_message "rule_SNMPD_CONF_Restrictions: snmpd.conf file permissions."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as snmpd.conf file permissions (octal value)."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		requested_permission_value=0640
		log_message "No 2nd parameter was received. We will use $requested_permission_value as parameter (Read and Write for Owner and Read for Group)."
	else 
		requested_permission_value=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the permission: must be an octal value
		if echo $requested_permission_value | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The file permission value is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
    # Check that at least one of the possible file locations is valid (file exists)
	if [ ! -e $snmpd_file1 ]
	then
		if [ ! -e $snmpd_file2 ]
		then
			if [ ! -e $snmpd_file3 ]
			then
			    log_message "snmpd.conf file not found on the system. Exiting."
				RuleResult=1
				return
			fi
		fi
	fi
	
    log_message "Will look for the following possible file locations: $snmpd_file1, $snmpd_file2 and $snmpd_file3"
    check_and_set_file_permission $snmpd_file1 $requested_permission_value
	result1=$?
    check_and_set_file_permission $snmpd_file2 $requested_permission_value
	result2=$?
    check_and_set_file_permission $snmpd_file3 $requested_permission_value
	result3=$?
	# If we have at least one success, return success status
	if [ $result1 -eq 0 -o $result2 -eq 0 -o $result3 -eq 0 ]
	then
		RuleResult=0
	else	
		RuleResult=1
	fi			

	return
}

#--------------------------------------------------------------
# rule_TALLYLOG_Permission_Restriction from policy file:
#  <cdf:requires idref="FilePermsV2-perms" /> 
#  <cdf:requires idref="PamV1" /> 
#  <cdf:title>5.1 Operating System Resources/TALLYLOG Permission Restriction</cdf:title> 
#  <cdf:description>/var/log/tallylog Must have permission 0600.</cdf:description> 
# NOTE: action is taken only if the file exists
# Arguments:
#   this rule expects as second parameter the value to apply as/var/log/tallylog file permissions (octal value).
rule_TALLYLOG_Permission_Restriction()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

    tallylog_file="/var/log/tallylog"

	log_message "rule_TALLYLOG_Permission_Restriction: $tallylog_file file permissions."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as $tallylog_file file permissions (octal value)."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		requested_permission_value=0600
		log_message "No 2nd parameter was received. We will use $requested_permission_value as parameter (Read and Write permission only for root)."
	else 
		requested_permission_value=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the permission: must be an octal value
		if echo $requested_permission_value | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The file permission value is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
    check_and_set_file_permission $tallylog_file $requested_permission_value
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	else	
		RuleResult=0
	fi			

	return
}

# This function checks the privileged GID of the file and updates file permissions accordingly.
check_privileged_GID()
{
	file=$1
	permission_value_privileged=$2
	permission_value_regular=$3
		
	#get the current GID of $file
	file_gid=`stat -c "%g" $file`

	# Setting is_privileged=1 when group is from privileged GID number range. 
	is_privileged=0
	if [ $file_gid -le 99 ]; then
		is_privileged=1
	elif [ $debian_version -eq 5 ]; then
		if [ $file_gid -ge 101 -a  $file_gid -le 199 ]; then
			is_privileged=1
		fi
	elif [ $IsRHEL5 -eq 1 -o  $IsRHEL6 -eq 1 -o $SUSE_10_or_later -eq 1 ]; then
		if [ $file_gid -ge 101 -a $file_gid -le 499 ]; then
			is_privileged=1
		fi
	elif [ $IsRHEL7 -eq 1 -o $debian_version -ge 6 ]; then
		if [ $file_gid -ge 101 -a $file_gid -le 999 ]; then
			is_privileged=1
		fi
	else	# Will cover gid=100 as well
		is_privileged=0
	fi
	
	# Verify the file permissions of $file and log the current value
    permission_value=`stat -c "%a" $file | awk '{print $1}'`
	already_privileged=$permission_value
	permission_string=`ls -l $file | awk '{print $1}'`
	permission_value_to_set=$permission_value_regular
	
	if [ "$file" = "/etc/profile.d/IBMsinit.sh" -o "$file" = "/etc/profile.d/IBMsinit.csh" ]; then
		permission_value_IBMsinit=`stat -c "%a" $file | cut -c 2-3`
		permission_value=$permission_value_IBMsinit
		# Changing permission_value_regular from 2 digit to 3 digit for check_and_set_file_permission() compatibility 
		permission_value_to_set="`stat -c "%a" $file | cut -c 1`$permission_value_regular"
	fi
	
	if [ $permission_value -eq $permission_value_privileged ] ; then
		if [ $is_privileged -eq 1 ] ; then
			RuleResult=0
			log_message "GID of file $file is from privileged group and permissions are $already_privileged ($permission_string). Remediation Not Required"
		else
			log_message "GID of file $file is NOT from privileged group. Remediation Required"
			check_and_set_file_permission $file $permission_value_to_set
			result=$?
			if [ $result -ne 0 ] ; then
				RuleResult=1
			else	
				RuleResult=0
			fi
		fi
	else	# For non privileged groups
		if [ $permission_value -eq $permission_value_regular ] ; then
			RuleResult=0
			log_message "File $file permissions are already $already_privileged ($permission_string). Remediation Not Required"
		else
			log_message "Current $file file permissions are Invalid. Remediation Required"		
			check_and_set_file_permission $file $permission_value_to_set
			result=$?
			if [ $result -ne 0 ] ; then
				RuleResult=1
			else	
				RuleResult=0
			fi
		fi
	fi	
}

#--------------------------------------------------------------
# Linux ITCS104 rule_ETC_SHADOW_Restrictions from policy file:
# <cdf:title>Operating System Resources/\ETC\SHADOW Restrictions</cdf:title>
# <cdf:description>/etc/shadow fIle File permissions must be set: rw- --- --- (or more restrictive). where the associated group is used only by set-GID operating system programs to avoid a need for root only access privileges. Read access is allowed for group if either of the following conditions is satisfied: The associated group which is identified as having a privileged GID number</cdf:description>
# NOTE: 
# 1. Action will be taken only if file /etc/shadow exists.
# 2. File /etc/shadow permissions must be set to 600 or can be set to 640 if group is from privileged GID number range.
rule_ETC_SHADOW_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	
    filename="/etc/shadow" 	
	log_message "rule_ETC_SHADOW_Restrictions: $filename file permissions"
	log_message "Parameters received: $arg_string"
	RuleResult=0

	if [ ! -e $filename ] ; then	# Check if file /etc/shadow exists
		log_message "File $filename does not exist. Remediation Not possible"
		return
	fi
	
	permission_value_privileged=640
	requested_permission_value=600

	check_privileged_GID "$filename" $permission_value_privileged $requested_permission_value
	
	return
}

#--------------------------------------------------------------
# rule_VAR_LOG_SECURE_Restrictions from policy file:
# <cdf:title>5.1 Operating System Resources/\VAR\LOG\SECURE Restrictions</cdf:title> 
# <cdf:ruleName>VAR_LOG_SECURE_Restrictions</cdf:ruleName>
# <cdf:description>/var/log/secure - permissions should be rwx r-x --- or can be rwx rwx --- When associated group is identified as having a privileged GID number</cdf:description>
# NOTE: 
# 1. Action will be taken only if file /var/log/secure exists.
# 2. File /var/log/secure permissions must be set to 750 or can be set to 770 if group is from privileged GID number range.
rule_VAR_LOG_SECURE_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
    RuleResult=0
	
	log_message "rule_VAR_LOG_SECURE_Restrictions: /var/log/secure Restrictions."
	log_message "Parameters received: $arg_string"

	file="/var/log/secure"
	
	if [ ! -e $file ] 	# Check if file /var/log/secure exists
	then
		log_message "File $file does not exist. Remediation Not possible"
		return	
	fi

	permission_value_privileged=770
	requested_permission_value=750
	
	check_privileged_GID "$file" $permission_value_privileged $requested_permission_value

	##Linux TechSpec ITCS104 changes:
	check_and_set_privileged_owner_group $file 
	result=$? 
	if [ $result -ne 0 ]
	then
		log_message "Failed to set privileged GID for file $file (error = $result)."
		RuleResult=1
	fi

	return
}

#--------------------------------------------------------------
# rule_FTP_Access_must_be_restricted_for_Root from policy file:
# <cdf:title>5.2 Security & system administrative authority/FTP Access must be restricted for Root</cdf:title> 
# <cdf:description>Root Id must exist in file /ETC/FTPUSERS or /etc/vsftpd.ftpusers to restrict FTP access</cdf:description> 
# Arguments:
#   this rule expects no second parameter.
rule_FTP_Access_must_be_restricted_for_Root()
{
    arg_string=$1

    file1="/etc/ftpusers"
	file2="/etc/vsftpd.ftpusers"

	log_message "rule_FTP_Access_must_be_restricted_for_Root: root Id must exist in file /etc/ftpusers or /etc/vsftpd.ftpusers to restrict FTP access."
	log_message "Parameters received: $arg_string"

    # Verify if /etc/ftpusers exists, if so, verify if the root ID is in there; if not, append it to the file
	if [ -e $file1 ]
	then
	    # /etc/ftpusers exists
		check_for_exact_match_of_keyword_in_file $file1 "root"
		result=$?
		if [ $result -ne 0 ]
		then
		    # root ID not found in the file; append it to the file
			log_message "root ID not found in $file1; inserting it."
			echo "root" >> $file1
			RuleResult=0
			return # --> done
		else
		    # root ID found;
			log_message "root ID found in $file1;"
		fi
	else
	    # /etc/ftpusers does not exist;
		# Create /etc/ftpusers and insert the root ID in there.
			log_message "$file1 does not exist. Creating $file1 and inserting root in it."
			echo "root" > $file1
			chmod 0644 $file1
	fi
		
	# verify if /etc/vsftpd.ftpusers exists, if so, verify if the root ID is in there; if not, append it to the file
	if [ -e $file2 ]
		then
			# /etc/vsftpd.ftpusers exists
			check_for_exact_match_of_keyword_in_file $file2 "root"
			result=$?
			if [ $result -ne 0 ]
			then
				# root ID not found in the file; append it to the file
			    log_message "root ID not found in $file2; inserting it."
				echo "root" >> $file2
				RuleResult=0
				return # --> done
			else
				# root ID found; ask why remediation is called for this rule
				log_message "root ID found in $file2; please verify why is the remediation function called for this rule."
				RuleResult=0
				return # --> done
			fi
	else
		    # None of the files exist. Create /etc/ftpusers and insert the root ID in there.
			log_message "$file2 does not exist. Creating $file2 and inserting root in it."
			echo "root" > $file2
			chmod 0644 $file2
			RuleResult=0
			return # --> done
	fi
}

#--------------------------------------------------------------
# rule_Root_Password_Required from policy file:
#  <cdf:requires idref="ShadowV2" /> 
#  <cdf:title>5.2 Security & system administrative authority/Root Password Required</cdf:title> 
#  <cdf:description>Root account must have password assigned</cdf:description> 
#  <scm:violationMessage>Account: {1} is missing password</scm:violationMessage> 
rule_Root_Password_Required()
{
    arg_string=$1

	log_message "rule_Root_Password_Required: Root account must have password assigned."
	log_message "Parameters received: $arg_string"
	log_message "Remediation for this rule cannot be automated. Manual intervention is required."
	RuleResult=0
	return
}

#--------------------------------------------------------------
# rule_SSH_PermitRootLogin_Restriction from policy file:
#  <cdf:title>5.2 Security & system administrative authority/SSH PermitRootLogin Restriction</cdf:title> 
#  <cdf:description>PermitRootLogin - Permits the root user to login remotely.
#  Value must be set to NO or without-password.</cdf:description>
#
# File: /etc/ssh/sshd_config
# Arguments: none except rule_SSH_PermitRootLogin_Restriction
rule_SSH_PermitRootLogin_Restriction()
{
    arg_string=$1

	log_message "rule_SSH_PermitRootLogin_Restriction: SSH PermitRootLogin Restriction; value must be set to no or without-password."
	log_message "Parameters received: $arg_string"

    sshd_config_file="/etc/ssh/sshd_config" 	

    # Verify if sshd_config_file exists; if not, create it with -rw-r--r-- permissions
	if [ ! -e $sshd_config_file ]
	then
	    log_message "$sshd_config_file not found on the system. Creating it."
	    log_message "Inserting the line [PermitRootLogin without-password] in $sshd_config_file."
		echo "# Policy remediation script creating $sshd_config_file with minimal required information for ITCS104 compliance." > $sshd_config_file
		echo "#" >> $sshd_config_file
		echo -e "# Authentication:" >> $sshd_config_file
		echo "PermitRootLogin without-password" >> $sshd_config_file
		chmod 0644 $sshd_config_file
		RuleResult=0
		return
	fi

    # Verify if sshd_config_file already has the PermitRootLogin keyword and, if so, log the current value
    grep "PermitRootLogin" $sshd_config_file | grep -v "#" 1> /dev/null 2>&1
    keyword_found=$?
    if [ $keyword_found -eq 0 ]
    then
	    # PermitRootLogin keyword found in the file
	    current_value_in_file=`grep "PermitRootLogin" $sshd_config_file | grep -v "#" | awk '{print $2}'`
        log_message "Current value of PermitRootLogin in $sshd_config_file = $current_value_in_file."
		if [ "$current_value_in_file" = "without-password" ]
		then
		    log_message "This value corresponds to the requested value; does not need to be changed. Exiting function."
			RuleResult=0
			return
		else
		    # Replace the existing definition by the new one in the file
	        log_message "Setting PermitRootLogin to without-password in $sshd_config_file."
		    replace_value_in_file_based_on_keyword $sshd_config_file "PermitRootLogin" "without-password"
			result=$?
            if [ $result -ne 0 ]
            then
	            log_message "An error occurred while attempting to set PermitRootLogin to without-password in $sshd_config_file."
				RuleResult=1
				return
            fi			
		fi
    else
		# Keyword PermitRootLogin not found in file; look for paragraph "Authentication" to insert the line there
        GlobalStringArgument="PermitRootLogin without-password"
		add_line_in_file_in_paragraph_based_on_keyword $sshd_config_file "Authentication:"
		result=$?
		if [ $result -eq 0 ]
		then
			RuleResult=0
			return
		else
			log_message "The PermitRootLogin definition was not found in $sshd_config_file and no Authentication paragraph was found. Appending at the end of the file." 
			echo -e "#" >> $sshd_config_file
			echo -e "# Linux remediation script inserting PermitRootLogin definition for ITCS104 compliance." >> $sshd_config_file
			echo -e "# Authentication:" >> $sshd_config_file
			echo -e "PermitRootLogin without-password" >> $sshd_config_file
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "An error occurred while attempting to append PermitRootLogin without-password in $sshd_config_file."
				RuleResult=1
				return
			fi
		fi
    fi

	# Success
	RuleResult=0
	return
}

#--------------------------------------------------------------
# rule_ETC_PAM_D_OTHER_Restrictions from policy file:
#  <cdf:title>5.2 Security & system administrative authority/\ETC\PAM.D\OTHER Restrictions</cdf:title> 
#  <cdf:description>/etc/pam.d/other required parameters: auth required /lib/security/pam_deny.so; account required /lib/security/pam_deny.so</cdf:description>
# And from coverage matrix:
# Note: For Red Hat Enterprise Linux V6 and later: If the system-auth file is in use, this control must ADDITIONALLY be applied to the
#       /etc/pam.d/password-auth file
# IMPORTANT: Use of full path and/or $ISA to pam modules is optional. After testing, we realized that the full path can cause problems if the pam module is not there.
#            So we do not put the full path.
# So:
# 1) Required in /etc/pam.d/other: auth required pam_deny.so
# 2) Required in /etc/pam.d/other: account required pam_deny.so
# 3) For Red Hat Enterprise Linux V6 and later: if the system-auth file is in use, this control must ADDITIONALLY be applied to the
#       /etc/pam.d/password-auth file
#
# Argument: none.
rule_ETC_PAM_D_OTHER_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_ETC_PAM_D_OTHER_Restrictions: /etc/pam.d/other required parameters: auth required pam_deny.so; account required pam_deny.so."
	log_message "Parameters received: $arg_string"

	file_name="/etc/pam.d/other"
	
	# Check if the file exists. If not, create it.
	if [ ! -e $file_name ]
	then
	    log_message "File $file_name not found. Creating it."
	    touch $file_name
		chmod 0644 $file_name
	fi
	
	error=0
	
	# 1) Required in /etc/pam.d/other: auth required pam_deny.so
	# The line is passed in a global string variable
	GlobalStringArgument="auth    required    pam_deny.so"
	log_message "Checking for the presence of the stanza [auth required pam_deny.so] in $file_name..."
	check_if_line_in_file_based_on_keywords $file_name 3 "auth" "required" "pam_deny.so"
	result=$?
    if [ $result -ne 0 ]
    then
	    log_message "stanza [auth required pam_deny.so] was not found in $file_name. Adding it."
		# If another line has [auth required], replace it.
		find_and_replace_stanza_line_in_file_based_on_keywords $file_name 2 "auth" "required"
		result=$?
		if [ $result -ne 0 ]
		then
		    # No line has [auth required], insert it.
			add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "auth"
			result=$?
			if [ $result -ne 0 ]
			then
				# Paragraph not found; append the stanza line at the end of the file
				log_message "Appending the line at the end of the file..."
				echo -e "#" >> $file_name
				echo -e "# Linux remediation script adding stanza [auth required pam_deny.so] to $file_name:" >> $file_name
				echo -e "$GlobalStringArgument" >> $file_name
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "An error occurred while attempting to append the stanza to the file."
					error=1
				fi
			fi
		fi
	fi

	# 2) Required in /etc/pam.d/other: account required pam_deny.so
	# The line is passed in a global string variable
	GlobalStringArgument="account    required    pam_deny.so"
	log_message "Checking for the presence of the stanza [account required pam_deny.so] in $file_name..."
	check_if_line_in_file_based_on_keywords $file_name 3 "account" "required" "pam_deny.so"
	result=$?
    if [ $result -ne 0 ]
    then
	    log_message "stanza [account required pam_deny.so] was not found in $file_name. Adding it."
		# If another line has [account required], replace it.
		find_and_replace_stanza_line_in_file_based_on_keywords $file_name 2 "account" "required"
		result=$?
		if [ $result -ne 0 ]
		then
		    # No line has [account required], insert it.
			add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "account"
			result=$?
			if [ $result -ne 0 ]
			then
				# Paragraph not found; append the stanza line at the end of the file
				log_message "Appending the line at the end of the file..."
				echo -e "#" >> $file_name
				echo -e "# Linux remediation script adding stanza [account required pam_deny.so] to $file_name:" >> $file_name
				echo -e "$GlobalStringArgument" >> $file_name
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "An error occurred while attempting to append the stanza to the file."
					error=1
				fi
			fi
		fi
	fi

	# 3) For Red Hat Enterprise Linux V6 and later: if the system-auth file is in use, this control must ADDITIONALLY be applied to the
	#       /etc/pam.d/password-auth file
	file_name="/etc/pam.d/system-auth"
	
	# Check that the file exists
	error=0
	if [ -e $file_name ]
	then
		# If on RedHat 6 or later, if the system-auth file is in use, this
		# control must ADDITIONALLY be applied to the /etc/pam.d/password-auth file.
		# HOWEVER, testing has shown that this remediation in password-auth can block root from logging in the machine; so
		# we make this remediation conditional on the value of the following flag. QA testing will report if this causes problems.
		do_remediation_in_password_auth=0
		if [ $RHEL6_or_later -eq 1 -a $do_remediation_in_password_auth -eq 1 ]
		then
		    file_name="/etc/pam.d/password-auth"
	        log_message "We are running on Red Hat 6 or later, also processing file $file_name..."
			# Check if the file name is a redirection; if so, use the real physical file name
			ls -l $file_name | grep "\->" 1> /dev/null
			result=$?
			if [ $result -eq 0 ]
			then
				link_name=$file_name
				file_name=`$ReadLinkCommand $link_name`
				echo $file_name | grep "/etc/" 1> /dev/null
				result=$?
				if [ $result -ne 0 ]
				then
					# Path is missing in file name; add it
					file_name="/etc/pam.d/$file_name"
				fi
				log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
			fi
			# 1) auth required pam_deny.so
			GlobalStringArgument="auth    required    pam_deny.so"
			log_message "Checking for the presence of the stanza [auth required pam_deny.so] in $file_name..."
			check_if_line_in_file_based_on_keywords $file_name 3 "auth" "required" "pam_deny.so"
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "stanza [auth required pam_deny.so] was not found in $file_name. Adding it."
				# If another line has [auth required], replace it.
				find_and_replace_stanza_line_in_file_based_on_keywords $file_name 2 "auth" "required"
				result=$?
				if [ $result -ne 0 ]
				then
					# No line has [auth required], insert it.
					add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "auth"
					result=$?
					if [ $result -ne 0 ]
					then
						# Paragraph not found; append the stanza line at the end of the file
						log_message "Appending the line at the end of the file..."
						echo -e "#" >> $file_name
						echo -e "# Linux remediation script adding stanza [auth required pam_deny.so] to $file_name:" >> $file_name
						echo -e "$GlobalStringArgument" >> $file_name
						result=$?
						if [ $result -ne 0 ]
						then
							log_message "An error occurred while attempting to append the stanza to the file."
							error=1
						fi
					fi
				fi
			fi

			# 2) account required pam_deny.so
			# The line is passed in a global string variable
			GlobalStringArgument="account    required    pam_deny.so"
			log_message "Checking for the presence of the stanza [account required pam_deny.so] in $file_name..."
			check_if_line_in_file_based_on_keywords $file_name 3 "account" "required" "pam_deny.so"
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "stanza [account required pam_deny.so] was not found in $file_name. Adding it."
				# If another line has [account required], replace it.
				find_and_replace_stanza_line_in_file_based_on_keywords $file_name 2 "account" "required"
				result=$?
				if [ $result -ne 0 ]
				then
					# No line has [account required], insert it.
					add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "account"
					result=$?
					if [ $result -ne 0 ]
					then
						# Paragraph not found; append the stanza line at the end of the file
						log_message "Appending the line at the end of the file..."
						echo -e "#" >> $file_name
						echo -e "# Linux remediation script adding stanza [account required pam_deny.so] to $file_name:" >> $file_name
						echo -e "$GlobalStringArgument" >> $file_name
						result=$?
						if [ $result -ne 0 ]
						then
							log_message "An error occurred while attempting to append the stanza to the file."
							error=1
						fi
					fi
				fi
			fi
		fi
	fi

	RuleResult=$error
	return
}

#--------------------------------------------------------------
# rule_Login_Retries_REDHAT_3_and_4 from policy file:
#   <cdf:requires idref="PlatformInfoV2" /> 
#   <cdf:requires idref="PamV1" /> 
#   <cdf:title>5.4 Systematic Attacks/Login Retries REDHAT 3 and 4 and SLES 9</cdf:title> 
#   <cdf:description>Limit consecutive invalid login attempts to 5. 
#   Setting to be used on SLES/SLED 9; RedHat AS/ES 3 and 4: 
#   auth required pam_tally.so no_magic_root 
#   account required pam_tally.so deny=5 reset no_magic_root
#   If pam_tally2.so is in use: auth required pam_tally2.so deny=5 account required pam_tally2.so</cdf:description> 
# From coverage matrix:
# For RedHat AS/ES 4 :
# auth required pam_tally.so no_magic_root
# account required pam_tally.so deny=5 reset no_magic_root
# 
# Will use pam_tally.so
# Files:
# /etc/pam.d/common-auth must exist and include these settings:
# auth required pam_tally.so no_magic_root
# /etc/pam.d/common-account must exist and include these settings:
# account required pam_tally.so deny=5 reset no_magic_root
# Argument: value of Login Retries.
##This rule is removed from both ITSSCSD and policy.xml file
rule_Login_Retries_REDHAT_3_and_4()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Login_Retries_REDHAT_3_and_4: REDHAT 3 and 4, limit consecutive invalid login attempts."
	log_message "Parameters received: $arg_string"

	# 1) Check that we are on REDHAT 3 or 4, or SLES 9: if not, exit
	if [ $SUSE_10_or_later -eq 1 ]
	then
	    log_message "This rule function can only be run on REDHAT 3 or 4, or SLES 9. Exiting."
		RuleResult=2
		return
	fi
	if [ $RHEL5_or_later -eq 1 ]
	then
	    log_message "This rule function can only be run on REDHAT 3 or 4, or SLES 9. Exiting."
		RuleResult=2
		return
	fi

	if [ $num_of_arguments -lt 2 ]
    then
		log_message "This rule expects as second parameter the value to apply as Login Retries."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		LoginRetries=5
		log_message "No 2nd parameter was received. We will use $LoginRetries as parameter."
	else 
		LoginRetries=`echo "$arg_string" | awk '{ print $2 }'`
	fi
 	
	# Validate the parameter (must be numeric decimal)
	if echo $LoginRetries | grep "[^0-9"] 2>&1 > /dev/null
	then
		log_message "The login retries value is not a valid decimal number. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

    # NOTE: this implementation assumes that pam_tally.so is in use
	# 1) /etc/pam.d/common-auth must exist and include these settings:
	# auth required pam_tally.so no_magic_root
	log_message "NOTE: this implementation uses pam_tally.so."
	GlobalStringArgument="auth        required      pam_tally.so no_magic_root"

	file_name="/etc/pam.d/common-auth"
	error=0

	# Check that the file exists; if not, create it
	if [ ! -e $file_name ]
	then
	    log_message "File $file_name not found. Creating it and inserting the line [$GlobalStringArgument] in it."
		echo "# Linux remediation script creating file $file_name for ITCS104 compliance." > $file_name
		echo "$GlobalStringArgument" >> $file_name
		chmod 0644 $file_name
	else
	    log_message "Processing file $file_name..."
		# Check if the file name is a redirection; if so, use the real physical file name
		ls -l $file_name | grep "\->" 1> /dev/null
		result=$?
		if [ $result -eq 0 ]
		then
			link_name=$file_name
			file_name=`$ReadLinkCommand $link_name`
			echo $file_name | grep "/etc/" 1> /dev/null
			result=$?
			if [ $result -ne 0 ]
			then
				# Path is missing in file name; add it
				file_name="/etc/pam.d/$file_name"
			fi
			log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
		fi

		find_and_replace_stanza_line_in_file_based_on_keywords $file_name 3 "auth" "required" "pam_tally.so"
		result=$?
		if [ $result -ne 0 ]
		then
			# No line has [auth required pam_tally.so], insert it.
			add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "auth"
			result=$?
			if [ $result -ne 0 ]
			then
				# Paragraph not found; append the stanza line at the end of the file
				log_message "Appending the line at the end of the file..."
				echo -e "#" >> $file_name
				echo -e "# Linux remediation script adding stanza [$GlobalStringArgument] to $file_name:" >> $file_name
				echo -e "$GlobalStringArgument" >> $file_name
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "An error occurred while attempting to append the stanza to the file."
					error=1
				fi
			fi
		fi
	fi

	# 2) /etc/pam.d/common-account must exist and include these settings:
	# account required pam_tally.so deny=<value passed as parameter> reset no_magic_root
	file_name="/etc/pam.d/common-account"
	GlobalStringArgument="account     required      pam_tally.so deny=$LoginRetries reset no_magic_root"

	if [ ! -e $file_name ]
	then
	    log_message "File $file_name not found. Creating it and inserting the line [$GlobalStringArgument] in it."
		echo "# Linux remediation script creating file $file_name for ITCS104 compliance." > $file_name
		echo "$GlobalStringArgument" >> $file_name
		chmod 0644 $file_name
	else
		log_message "Processing file $file_name..."
		# Check if the file name is a redirection; if so, use the real physical file name
		ls -l $file_name | grep "\->" 1> /dev/null
		result=$?
		if [ $result -eq 0 ]
		then
			link_name=$file_name
			file_name=`$ReadLinkCommand $link_name`
			echo $file_name | grep "/etc/" 1> /dev/null
			result=$?
			if [ $result -ne 0 ]
			then
				# Path is missing in file name; add it
				file_name="/etc/pam.d/$file_name"
			fi
			log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
		fi

		find_and_replace_stanza_line_in_file_based_on_keywords $file_name 3 "account" "required" "pam_tally.so"
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "stanza [account required pam_tally.so] was not found in $file_name. Adding it."
			add_stanza_line_in_file_at_paragraph_based_on_keyword $file_name "account"
			result=$?
			if [ $result -ne 0 ]
			then
				# Paragraph not found; append the stanza line at the end of the file
				log_message "Appending the line at the end of the file..."
				echo -e "#" >> $file_name
				echo -e "# Linux remediation script adding stanza [$GlobalStringArgument] to $file_name:" >> $file_name
				echo -e "$GlobalStringArgument" >> $file_name
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "An error occurred while attempting to append the stanza to the file."
					error=1
				fi
			fi
		fi
	fi

	RuleResult=$error
	return
}

#--------------------------------------------------------------
# rule_Login_Retries_REDHAT_5_plus from policy file:
#   <cdf:title>5.4 Systematic Attacks/Login Retries REDHAT 5+</cdf:title> 
#   <cdf:description>Limit consecutive invalid login attempts to 5. Settings to be used on RedHat AS/ES 5 and newer:
#       auth required pam_tally.so deny=5
# 	  account required pam_tally.so
#  If pam_tally2.so is in use:
#       auth required pam_tally2.so deny=5
#       account required pam_tally2.so</cdf:description> 
# AND from ITCS104 coverage requirement matrix (more detailed):
# For Red Hat V5 and later:
# If pam_tally2.so is NOT in use:
# auth required pam_tally.so deny=5
# account required pam_tally.so
# 
# Any raleases: if pam_tally2.so is in use:
# auth required pam_tally2.so deny=5
# account required pam_tally2.so
# 
# Notes: 
# -Each entry must precede any lines of same module-type with a control-flag of sufficient with the exception of pam_deny.so
# -If /etc/pam.d/system-auth exists, this is the control
# file. Otherwise, it must appear in all /etc/pam.d control files
# which require login authentication: (using the list from rule 9) /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
# -Use of full path and/or $ISA to pam modules is
# optional.
# -For Red Hat Enterprise Linux V6 and later: This control must ADDITIONALLY be
# applied to the /etc/pam.d/password-auth file.
# 
# So, the algorithm is:
# 1) Check that we are on RHEL 5 or newer: if not, exit
# 2) Check if pam_tally2.so is in use;
#    note: from the information found, pam_tally2.so is the default on RHEL 6+; pam_tally.so is used on RHEL 5, so we will use that to select the stanza:
#       if so, preformat the lines to put in the files with pam_tally2.so
#       if not, preformat the lines to put in the files with pam_tally.so
# 3) Check if system-auth is in use;
#       if so, this the control file
#       if not, work on /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su
# 4) For Red Hat Enterprise Linux V6 and later: This control must ADDITIONALLY be applied to the /etc/pam.d/password-auth file.
# 
# Argument: value of Login Retries.

#<cdf:title>Password Requirements/Login Retries REDHAT 5+</cdf:title>
#<cdf:ruleName>Login_Retries_REDHAT_5_plus</cdf:ruleName>
#<cdf:description>If /etc/pam.d/system-auth exist, it must include this setting:
#Red Hat 5:
#auth required pam_tally.so deny=5
#account required pam_tally.so
#Red Hat 6 or above:
#auth required pam_tally2.so deny=5
#account required pam_tally2.so
#Note: On Red Hat v6 and later if the system-auth file is in use, this control must additionally be applied to the /etc/pam.d/password-auth file</cdf:description>
# For remediation required stanza added in /etc/pam.d/system-auth file as per the version of RHEL 
rule_Login_Retries_REDHAT_5_plus()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Login_Retries_REDHAT_5_plus: RedHat Linux 5 and newer, limit consecutive invalid login attempts."
	log_message "Parameters received: $arg_string"

	# 1) Check that we are on RHEL 5 or newer: if not, exit
	if [ $IsRHEL3 -eq 1 -o $IsRHEL4 -eq 1 ] ; then
	    log_message "This rule function can only be run on RedHat Linux 5 or newer. Exiting."
		RuleResult=2
		return
	fi
    
	if [ $num_of_arguments -lt 2 ] ;  then
		log_message "This rule expects as second parameter the value to apply as Login Retries."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		LoginRetries=5
		log_message "No 2nd parameter was received. We will use $LoginRetries as parameter."
	else 
		LoginRetries=`echo "$arg_string" | awk '{ print $2 }'`
	fi
 	
	# Validate the parameter (must be numeric decimal)
	if echo $LoginRetries | grep "[^0-9"] 2>&1 > /dev/null ; 	then
		log_message "The login retries value is not a valid decimal number. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

	# 2) Check if pam_tally2.so is in use;
	#       if so, preformat the lines to put in the files with pam_tally2.so
	#       if not, preformat the lines to put in the files with pam_tally.so
	#    note: from the information found, pam_tally2.so is the default on RHEL 6+; pam_tally.so is used on RHEL 5, so we will use that to select the stanza.
	# The lines are stored in global string variables that will be used by function enforce_login_retries_in_file
	if [ $RHEL6_or_later -eq 1 ] ; 	then
		# auth required pam_tally2.so deny=$LoginRetries
		# account required pam_tally2.so
	    log_message "We are running on RHEL6 or newer. Will use pam_tally2.so in the specifications."
		GlobalLoginRetryLine1="auth        required      pam_tally2.so deny=$LoginRetries"
		GlobalLoginRetryLine2="account     required      pam_tally2.so"
	else
		# auth required pam_tally.so deny=$LoginRetries
		# account required pam_tally.so
	    log_message "We are running on RHEL5. Will use pam_tally.so in the specifications."
		GlobalLoginRetryLine1="auth        required      pam_tally.so deny=$LoginRetries"
		GlobalLoginRetryLine2="account     required      pam_tally.so"
	fi
	
	# 3) Check if system-auth is in use;
	#       if so, this is the control file
	#       if not, work on /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su
	file_name="/etc/pam.d/system-auth"
	
	# Check that the file exists
	error=0
	if [ -e $file_name ] ; 	then
	    log_message "Processing file $file_name..."
        enforce_login_retries_in_file $file_name "/etc/pam.d"
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to fix the stanza in the file $file_name."
			error=1
 		fi
	else
	    log_message "File $file_name not found. Exiting.."
        error=1		
	fi

	# 4) For Red Hat Enterprise Linux V6 and later: This control must ADDITIONALLY be applied to the /etc/pam.d/password-auth file.
	if [ $RHEL6_or_later -eq 1 ] ; 	then
		file_name="/etc/pam.d/password-auth"
		log_message "We are running on Red Hat 6 or later, also processing file $file_name..."
		enforce_login_retries_in_file $file_name "/etc/pam.d"
		result=$?
		if [ $result -ne 0 ] ; then
			log_message "An error occurred while attempting to fix the stanza in the file $file_name."
			error=1
		fi
	fi
	
	RuleResult=$error
	return
}

#<cdf:title>Password Requirements/Login Retries SLES 10+ and Debian</cdf:title>
#<cdf:ruleName>Login_Retries_SLES_10_plus_and_Debian</cdf:ruleName>
#<cdf:description>Threshold for consecutive failed login attempts. For Debian and SLES 10 and later: &quot;auth required pam_tally.so deny=5 onerr=fail per_user no_lock_time&quot; in /etc/pam.d/common-auth. And &quot;account required pam_tally.so&quot; in /etc/pam.d/common-account. pam_tally2.so may be used in place of pam_tally.so on any level of Linux which supports pam_tally2.so. Note: Must precede any lines of same module-type with a control-flag of sufficient with the exception of pam_deny.so</cdf:description>
#<scm:violationMessage>Invalid or Missing Login Retries required setting. For more information see checks description.</scm:violationMessage>
#For remediation required settings in required files are added for SLES 10+ ,Debian and ubuntu
rule_Login_Retries_SLES_10_plus_and_Debian()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
    RuleResult=0
	failure=0
	
	log_message "rule_Login_Retries_SLES_10_plus: SuSE Linux 10+, limit consecutive invalid login attempts."
	log_message "Parameters received: $arg_string"

	
	if [ $num_of_arguments -lt 2 ] ; then
		log_message "This rule expects as second parameter the value to apply as Login Retries."
		RuleResult=1
		return                   
	else 
		accountLoginRetries=`echo "$arg_string" | awk '{ print $2 }'` # $(Account Login Retries) variable value from Policy.xml i.e. 5                         
	fi
	
	if [ "$SUSE_10_or_later" = "1" -o "$IsDebian" = "1" -o "$IsUbuntu" = "1" ] ; then
		common_auth_file="/etc/pam.d/common-auth"
		common_account_file="/etc/pam.d/common-account"
		create_files_with_permisions "$common_auth_file" "644"
		create_files_with_permisions "$common_account_file" "644"
	
		str="auth required pam_tally.so deny=5 onerr=fail per_user no_lock_time"
		str1="auth required pam_tally.so deny=5"
		auth_sufficient="auth sufficient pam_deny.so"
		acc_sufficient="account sufficient pam_deny.so"
		acc_required="account required pam_tally.so"
					  
		#log_message "readling lineNumber=$lineNumber"
		isPam_tally_module="$(cat $common_auth_file | egrep -c  "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally.so")"
		isPam_tally2_module="$(cat $common_auth_file | egrep -c  "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally2.so")"
		
		if [ $isPam_tally_module -eq 1 ] ; then  # check if either pam_tally.so or pam_tally2.so exists else loop to next line 
			if cat $common_auth_file | egrep -cw "pam_tally.so" 1>/dev/null 2>&1 ; then                                                              
				log_message "Module pam_tally.so exists in file $common_auth_file"
				if cat $common_auth_file | egrep "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally.so[[:space:]]+(deny=$accountLoginRetries|onerr=fail|per_user|no_lock_time)[[:space:]]+(deny=$accountLoginRetries|onerr=fail|per_user|no_lock_time)[[:space:]]+(deny=$accountLoginRetries|onerr=fail|per_user|no_lock_time)[[:space:]]+(deny=$accountLoginRetries|onerr=fail|per_user|no_lock_time)[[:space:]]*$" ; then 
					log_message "Required Arguments of pam_tally.so module already exists in file $common_auth_file.Nothing to do."
				else # Partial pam_tally.so stanza exists 
					log_message "Partial pam_tally.so arguments exists in file $common_auth_file.Remediation required"
					sed -i "s/pam_tally.so.*/pam_tally.so deny=$accountLoginRetries onerr=fail per_user no_lock_time/" $common_auth_file				
					if [ $? -ne 0 ] ; then
						log_message "Error in adding required arguments of pam_tally.so module."
						failure=`expr failure + 1`
					fi				
				fi
			fi  
		elif [ $isPam_tally_module -eq 0 -a $isPam_tally2_module -eq 1 ] ; then
			if cat $common_auth_file | egrep -cw "pam_tally2.so" 1>/dev/null 2>&1 ; then                                                              
				log_message "Module pam_tally2.so exists in file $common_auth_file"
				if cat $common_auth_file | egrep "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally2.so[[:space:]]+deny=$accountLoginRetries" ; then 
					log_message "Required Arguments to pam_tally2.so already exists in file $common_auth_file.Nothing to do."					
				else # Partial pam_tally.so stanza exists 
					 log_message "Partial pam_tally2.so arguments exists in file $common_auth_file.Remediation required"
					sed -i "s/pam_tally2.so.*/pam_tally2.so deny=$accountLoginRetries/" $common_auth_file				
					if [ $? -ne 0 ] ; then
						log_message "Error in adding required arguments of pam_tally.so module."
						failure=`expr failure + 1`
					fi				
				fi
			fi     					
		else
		   log_message "Nonr of the Module pam_tally.so/pam_tally2.so exists in file $common_auth_file.Adding pam_tally.so module with arguments.."
		   echo $str >> $common_auth_file		
		   if [ $? -ne 0 ] ; then
			   log_message "Error in adding required arguments of pam_tally.so module."
			   failure=`expr failure + 1`
		   fi				
		fi
		
		pam_tally_sufficient="$(cat $common_auth_file | egrep -c  "^[[:space:]]*auth[[:space:]]+sufficient[[:space:]]+[a-zA-Z0-9\/\_]*pam_deny.so")"
		pam_deny_sufficient_line_number="$(egrep -n "^[[:space:]]*auth[[:space:]]+sufficient[[:space:]]+[a-zA-Z0-9\/\_]*pam_deny.so" $common_auth_file | cut -f 1 -d ":" | head -1 )"  
		pam_tally_sufficient_line_number="$(egrep -n "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*(pam_tally.so|pam_tally2.so)" $common_auth_file | cut -f 1 -d ":" | head -1 )"  
		
		line_number="$(expr $pam_tally_sufficient_line_number)"
		line_number=$line_number"i"
		
		if [ $pam_tally_sufficient -eq 1 ] ; then
			 if [ $pam_deny_sufficient_line_number -lt $pam_tally_sufficient_line_number ];then
				 log_message "Module auth sufficient pam_deny.so precedes auth required pam_tally.so"
			 else
				 log_message "auth sufficient pam_deny.so does not precedes auth required pam_tally.so.Insert it." 		 		
				 sed -i "$line_number $auth_sufficient" $common_auth_file
				 if [ $? -ne 0 ] ; then
					log_message "Error in adding required arguments of sufficient pam_deny.so module."
					failure=`expr failure + 1`
				 fi				
			 fi		 
		else
			log_message "auth sufficient pam_deny.so doesnt exist..Need to insert"
			sed -i "$line_number $auth_sufficient" $common_auth_file	
			if [ $? -ne 0 ] ; then
			   log_message "Error in adding required arguments of sufficient pam_deny.so module."
			   failure=`expr failure + 1`
			fi				
		fi	
		
		isPam_tally_module="$(cat $common_auth_file | egrep -c  "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally.so")"   
		isPam_tally_module_account="$(cat $common_account_file | egrep -c  "^[[:space:]]*account[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally.so")"	
		if [ $isPam_tally_module -eq 1 -a $isPam_tally_module_account -eq 0 ] ; then
		   log_message "Module account required pam_tally.so does not exists in file $common_account_file.Insert it."
			echo $acc_required >> $common_account_file
			if [ $? -ne 0 ] ; then
				log_message "Error in adding required arguments of sufficient pam_deny.so module."
				failure=`expr failure + 1`
			fi	
		fi	
	   
		isPam_tally_module="$(cat $common_auth_file | egrep -c  "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally.so")"
		isPam_tally_module_account="$(cat $common_account_file | egrep -c  "^[[:space:]]*account[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally.so")"
		isPam_tally2_module_account="$(cat $common_account_file | egrep -c  "^[[:space:]]*account[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally2.so")"
		pam_tally_sufficient_account="$(cat $common_account_file | egrep -c  "^[[:space:]]*account[[:space:]]+sufficient[[:space:]]+[a-zA-Z0-9\/\_]*pam_deny.so")"				 
		pam_deny_sufficient_line_number_acc="$(egrep -n "^[[:space:]]*account[[:space:]]+sufficient[[:space:]]+[a-zA-Z0-9\/\_]*pam_deny.so" $common_account_file | cut -f 1 -d ":" | head -1 )"  
		pam_tally_sufficient_line_number_acc="$(egrep -n "^[[:space:]]*account[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*(pam_tally.so|pam_tally2.so)" $common_account_file | cut -f 1 -d ":" | head -1 )"   
			
		line_number_acc="$(expr $pam_tally_sufficient_line_number_acc)"
		line_number_acc=$line_number_acc"i"
		
		if [ $isPam_tally_module -eq 1 -a $isPam_tally_module_account -eq 1 ] ; then	    
			log_message "account required pam_tally.so exists."
			if [ $pam_tally_sufficient_account -eq 1 ] ; then
				if [ $pam_deny_sufficient_line_number_acc -lt $pam_tally_sufficient_line_number_acc ] ; then
					log_message "account sufficient pam_deny.so precedes account required pam_tally.so"
				else
					log_message "account sufficient pam_deny.so does not precedes account required pam_tally.so" 		 		
					sed -i "$line_number_acc $acc_sufficient" $common_account_file
					if [ $? -ne 0 ] ; then
						log_message "Error in adding required arguments of sufficient pam_deny.so module."
						failure=`expr failure + 1`
					fi				
				fi	
			else
				 log_message "account sufficient pam_deny.so does not precedes account required pam_tally.so" 		 		
				 sed -i "$line_number_acc $acc_sufficient" $common_account_file	
				 if [ $? -ne 0 ] ; then
					log_message "Error in adding required arguments of sufficient pam_deny.so module."
					failure=`expr failure + 1`
				 fi				
			fi	 
		fi
	else
	    log_message "This Rule applies to SUSE 10+, Debian and Ubuntu only" 		 		
		RuleResult=2		
    fi	
	
	if [ $failure -gt 0 ] ; then
	    RuleResult=1
    else 
	    RuleResult=0
    fi	
	
	return
}


#--------------------------------------------------------------
# Rule 74 from policy file:
#- <cdf:Rule id="74">
#  <cdf:requires idref="FilePermsV2-tallylog" /> 
#  <cdf:requires idref="PamV1" /> 
#  <cdf:title>6.1 System access logging/Log File Required tallylog</cdf:title> 
#  <cdf:description>Reports missing log files: /var/log/tallylog, /var/log/faillog. Must exist for all systems using pam_tally2.so</cdf:description> 
# Additional parameter with rule_Log_File_Required_tallylog:
#   list of files names (with complete path) that are missing and must exist,
#   and each file name must be followed by its octal permission value.
#   Example: rule_Log_File_Required_tallylog /var/log/tallylog 0600 /var/log/faillog 0600
rule_Log_File_Required_tallylog()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Log_File_Required_tallylog: log files must exist."
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 3 ]
   then
		log_message "This rule expects as parameters the list of files which must exist, each file name must also be followed by the file permission octal value."
		log_message "Example: rule_Log_File_Required_tallylog /var/log/tallylog 0600 /var/log/faillog 0600" 
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
	    file_list="/var/log/tallylog 0600 /var/log/faillog 0600"
		log_message "No file list was received. We will use the following default list: $file_list."
		num_of_files=2
	else 
	    # Take out the rule_Log_File_Required_tallylog and rule_Log_File_Required_tallylog_faillog (in case of call for ITSSCSD) substring to get the list of files
	    file_list=`echo $arg_string | sed s,"rule_Log_File_Required_tallylog_faillog",,`
	    file_list=`echo $file_list | sed s,"rule_Log_File_Required_tallylog",,`
		# The number of files to process is the remaining number of arguments / 2 (because of presence of permission values in the list)
		num_of_files=`expr $num_of_arguments - 1`
		# Verify that the remaining number of arguments is an even number (sets of file names and permissions)
		remaining_args_modulo=`expr $num_of_files % 2`
		if [ $remaining_args_modulo -ne 0 ]
		then
		    log_message "Bad parameter list. The number of arguments following the rule ID must be an even number (sets of file names and permissions). Exiting."
			RuleResult=1
			return
		fi
		num_of_files=`expr $num_of_files / 2`
	fi
 	
    log_message "Number of files to create: $num_of_files."
	got_error=0
    files_created=0
	while [ $files_created -lt $num_of_files ]
	do
	    # Get the next file name
	    next_file=`echo "$file_list" | awk '{ print $1 }'`
		# Remove the file being processed from the list
		file_list=`echo $file_list | sed s,$next_file,,`
	    # Get this file's permission
	    next_permission=`echo "$file_list" | awk '{ print $1 }'`
		# Validate the permission: must be an octal value
		if echo $next_permission | grep "[^0-7"] 2>&1 > /dev/null
		then
		  log_message "The file permission $next_permission for file $next_file is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
		# Remove the file permission from the list
		file_list=`echo $file_list | sed s,$next_permission,,`
		# Create the file if does not exist
		if [ ! -e $next_file ]
		then
		    # Check if the file was renamed by the make-violations script; if so restore it
			violation_file_name_suffix="_renamed_by_script_scm511-itcs104v12.1-LINUX_make_violations"
			violation_file_name="$next_file$violation_file_name_suffix"
			if [ -e $violation_file_name ]
			then
				log_message "$next_file not found on the system but $violation_file_name was found."
				log_message "Restoring $next_file from $violation_file_name"
				mv $violation_file_name $next_file
			else
				touch $next_file 2> /dev/null
				result=$?		
				if [ $result -ne 0 ]
				then
					log_message "Failed to create file $next_file (error = $result)."
					got_error=1
				else
					chmod $next_permission $next_file
					permission_value=`stat -c "%A" $next_file | awk '{print $1}'`
					log_message "Created file $next_file with permission $next_permission ($permission_value)."
				fi
			fi
		else
		    log_message "File $next_file already exists. Skipping..."
		fi
		files_created=`expr $files_created + 1`
	done
	
	if [ $got_error -ne 0 ]
	then
		RuleResult=1
	else	
		RuleResult=0
	fi			

	return
}

#This function is created to verify command return code.
#It accepts two parameters 1. Return code and 2. File name 
#It verifies return code and add log message for File.
verify_result()
{
result=$1
File=$2

        if [ "$result" -ne 0 ] ; then
			log_message	"Remdiation failed for File $File"
			RuleResult=1
        else
			log_message	"Remdiation done for File $File"
        fi
}
#<cdf:title>Logging/Log Files Required</cdf:title>
#<cdf:ruleName>Log_Files_Required</cdf:ruleName>
#<cdf:description>Reports missing log files: /var/log/wtmp, /var/log/tallylog if pam_tally2.so is in use, /var/log/faillog if pam_tally2.so is NOT in use, /var/log/syslog and /var/log/auth.log only for Debian systems, /var/log/messages and /var/log/secure only for non Debian systems.
#</cdf:description>
#<scm:violationMessage>Required log file missing: {1}</scm:violationMessage>
#<scm:priority>normal</scm:priority>
#For remediation files are checked whether they are exist or not , if doesnt exist files are created.
rule_Log_Files_Required()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	failure=0
	files_created=0
    RuleResult=0
	
	log_message "Logging/Log Files Required: rule_Log_Files_Required"
	log_message "Parameters received: $arg_string"
	
	syslog_file="/var/log/syslog"
    auth_file="/var/log/auth.log"
	faillog_file="/var/log/faillog"
	messages_file="/var/log/messages"
	secure_file="/var/log/secure"
	wtmp_file="/var/log/wtmp"
	tallylog_file="/var/log/tallylog"

#This code is commented since pam_tally2.so should be checked in all files under /etc/pam.d directory
# :'   	
	# if [ "$IsRedHat" = "1" ] ; then
	    # system_file="/etc/pam.d/system-auth"  ###rhel 
    # else		 
		# system_file="/etc/pam.d/common-auth"  ##Ubuntu and Suse
	# fi	
	
	# system_file_pam_tall2_count="$(egrep -v ^\s*# $system_file | egrep -cw "pam_tally2.so")"	
# '

	# Checking if pam_tally2.so is in use
	system_file_pam_tall2_count="$(egrep -R pam_tally2.so /etc/pam.d/* |cut -f 2 -d ":"|egrep -c -v '^\s*#')"
	
	if [ "$IsDebian" = "1" -o  "$IsUbuntu" = "1" ] ; 
	then	

		touch "$syslog_file"
		verify_result $? "$syslog_file"
		
		touch "$auth_file"
		verify_result $? "$auth_file"
	else

		touch "$messages_file"
		verify_result $? "$messages_file"
		
		touch "$secure_file"
		verify_result $? "$secure_file"
	fi
	
	if [ $system_file_pam_tall2_count -gt 0 ];   ###pam_tally2.so in use	    	
	then	

		touch "$wtmp_file"
		verify_result $? "$wtmp_file"
		
		touch "$tallylog_file"
		verify_result $? "$tallylog_file"
		
	else

		touch "$faillog_file"
		verify_result $? "$faillog_file"
	fi
    return
}
	
#Following code is commented as it was not handling right set of files and above code is added to fix issue 302158
	
# :'
		# if [ ! -e $syslog_file ] ; then	       
		   # create_files_with_permisions "$syslog_file" "644"
		   # if [ $? -ne 0 ] ; then
		       # failure=`expr failure + 1`
		   # fi
	   # else
	        # log_message "File $syslog_file already exist. Remediation not required.."
       # fi
       # if [ ! -e $auth_file ] ; then	       
		   # create_files_with_permisions "$auth_file" "644"
		    # if [ $? -ne 0 ] ; then
		       # failure=`expr failure + 1`
		   # fi
	   # else
	        # log_message "File $auth_file already exist. Remediation not required.."
       # fi

	   
	# else
		# if [ $system_file_pam_tall2_count -gt 0 ]; then  ###pam_tally2.so in use	    
			# num_of_files=1			
			# file_list="/var/log/tallylog"		
		# else
			# num_of_files=4			
			# file_list="/var/log/faillog /var/log/messages /var/log/secure /var/log/wtmp"				 
		# fi
		
		# while [ $files_created -lt $num_of_files ]
		# do	    
			# next_file=`echo "$file_list" | awk '{ print $1 }'`	            
			# file_list=`echo $file_list | sed s,$next_file,, `							
			# if [ ! -e $next_file ] ; then					     
				 # create_files_with_permisions "$next_file" "644"
				  # if [ $? -ne 0 ] ; then
					  # failure=`expr failure + 1`
				  # fi
			# else
				 # log_message "File $next_file already exist. Remediation not required.."
			# fi
			# files_created=`expr $files_created + 1`
	   # done
	# fi   

	
	# if [ $failure -ne 0 ] ; then
	     # RuleResult=1
	# else
         # RuleResult=0	
	# fi
# '

#--------------------------------------------------------------
# rule_Login_Success_or_Failure_in_rsyslog_conf from policy file:
# <cdf:title>6.1 System access logging/Login Success or Failure in rsyslog.conf</cdf:title> 
#  <cdf:description>Login Success or Failure Logging Requirements for rsyslog.conf</cdf:description> 

# FROM COVERAGE MATRIX:
# Requirements for systems that use rsyslog: 
# SLES 11, Red Hat V5 and above:
# File:/etc/rsyslog.conf
# $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
# *.info;mail.none;authpriv.none;cron.none /var/log/messages
# authpriv.* /var/log/secure 

# Debian Linux: 
# File:/etc/rsyslog.conf
# $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
# auth,authpriv.* /var/log/auth.log
# *.*;auth,authpriv.none -/var/log/syslog
# *.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages 
# Note: The use of the "-" in "-/var/log/...", which indicates that buffered writes are allowed, is optional in any Linux syslog configuration.
# Note: More extensive logging is permissible, e.g "cron.none" may be removed from the facility section of the control stanza for /var/log/messages.
rule_Login_Success_or_Failure_in_rsyslog_conf()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Login_Success_or_Failure_in_rsyslog_conf: Login Success or Failure Logging Requirements for rsyslog.conf"
	log_message "Parameters received: $arg_string"

	file_name="/etc/rsyslog.conf"
	
	store_comment=1
	
	# Check if the file exists; if not create it
	if [ ! -e $file_name ]
	then
		log_message "$file_name not found. Creating it."
		echo "# Linux ITCS104 remediation script creating $file_name" > $file_name
		chmod 644 $file_name
		store_comment=0
	fi

	# 1) SuSE 11+ and RHEL 5+
	if [ $SUSE_11_or_later -eq 1 -o $RHEL5_or_later -eq 1 ]
	then
		# Must have these three lines:
		# $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
		# *.info;mail.none;authpriv.none;cron.none /var/log/messages
		# authpriv.* /var/log/secure 

		# First line: $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
		grep '$ActionFileDefaultTemplate' $file_name | grep 'RSYSLOG_TraditionalFileFormat' | grep -v "#" 1>/dev/null 2>&1
		result=$?
		if [ $result -ne 0 ]
		then
			# Line not found or commented out; append it to the file
			log_message "Appending line [\$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat] to $file_name"
			if [ $store_comment -eq 1 ]
			then
				echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
				store_comment=0
			fi
			echo '$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat' >> $file_name
		else
			log_message "Found line [\$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat] in $file_name"
		fi
		
		# Second line: *.info;mail.none;authpriv.none;cron.none /var/log/messages
		grep '*.info;mail.none;authpriv.none;cron.none' $file_name | grep '/var/log/messages' | grep -v "#" 1>/dev/null 2>&1
		result=$?
		if [ $result -ne 0 ]
		then
			# Line not found or commented out; append it to the file
			log_message "Appending line [*.info;mail.none;authpriv.none;cron.none /var/log/messages] to $file_name"
			if [ $store_comment -eq 1 ]
			then
				echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
				store_comment=0
			fi
			echo '*.info;mail.none;authpriv.none;cron.none /var/log/messages' >> $file_name
		else
			log_message "Found line [*.info;mail.none;authpriv.none;cron.none /var/log/messages] in $file_name"
		fi
		
		# Third line: authpriv.* /var/log/secure
		grep 'authpriv.*' $file_name | grep '/var/log/secure' | grep -v "#" 1>/dev/null 2>&1
		result=$?
		if [ $result -ne 0 ]
		then
			# Line not found or commented out; append it to the file
			log_message "Appending line [authpriv.* /var/log/secure] to $file_name"
			if [ $store_comment -eq 1 ]
			then
				echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
				store_comment=0
			fi
			echo 'authpriv.* /var/log/secure' >> $file_name
		else
			log_message "Found line [authpriv.* /var/log/secure] in $file_name"
		fi
	else
		# Running on Debian or Ubuntu?
		if [ $IsDebian -eq 1 -o $IsUbuntu -eq 1 ] ;  
		then
			# Must have these 4 lines:
			# $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
			# auth,authpriv.* /var/log/auth.log
			# *.*;auth,authpriv.none -/var/log/syslog
			# *.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages 

			# First line: $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
			grep '$ActionFileDefaultTemplate' $file_name | grep 'RSYSLOG_TraditionalFileFormat' | grep -v "#" 1>/dev/null 2>&1
			result=$?
			if [ $result -ne 0 ]
			then
				# Line not found or commented out; append it to the file
				log_message "Appending line [\$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat] to $file_name"
				if [ $store_comment -eq 1 ]
				then
					echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
					store_comment=0
				fi
				echo '$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat' >> $file_name
			else
				log_message "Found line [\$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat] in $file_name"
			fi
			
			# Second line: auth,authpriv.* /var/log/auth.log
			grep 'auth,authpriv.*' $file_name | grep '/var/log/auth.log' | grep -v "#" 1>/dev/null 2>&1
			result=$?
			if [ $result -ne 0 ]
			then
				# Line not found or commented out; append it to the file
				log_message "Appending line [auth,authpriv.* /var/log/auth.log] to $file_name"
				if [ $store_comment -eq 1 ]
				then
					echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
					store_comment=0
				fi
				echo 'auth,authpriv.* /var/log/auth.log' >> $file_name
			else
				log_message "Found line [auth,authpriv.* /var/log/auth.log] in $file_name"
			fi
			
			# Third line: *.*;auth,authpriv.none -/var/log/syslog
			grep '*.*;auth,authpriv.none' $file_name | grep '/var/log/syslog' | grep -v "#" 1>/dev/null 2>&1
			result=$?
			if [ $result -ne 0 ]
			then
				# Line not found or commented out; append it to the file
				log_message "Appending line [*.*;auth,authpriv.none -/var/log/syslog] to $file_name"
				if [ $store_comment -eq 1 ]
				then
					echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
					store_comment=0
				fi
				echo '*.*;auth,authpriv.none -/var/log/syslog' >> $file_name
			else
				log_message "Found line [*.*;auth,authpriv.none -/var/log/syslog] in $file_name"
			fi

			# Fourth line: *.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages
			# Note: grep had problems with the first patterns so I had to separate them
			grep '*.=info;' $file_name | grep '*.=notice;' | grep '*.=warning;' | grep 'auth,authpriv.none;[[:space:]]*cron,daemon.none;[[:space:]]*mail,news.none' | grep '/var/log/messages' | grep -v "#" 1>/dev/null 2>&1
			result=$?
			if [ $result -ne 0 ]
			then
				# Line not found or commented out; append it to the file
				log_message "Appending line [*.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages] to $file_name"
				if [ $store_comment -eq 1 ]
				then
					echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
					store_comment=0
				fi
				echo '*.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages' >> $file_name
			else
				log_message "Found line [*.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages] in $file_name"
			fi

		else
			log_message "This remediation function is applicable to SuSE 11+, RHEL 5+, Debian and Ubuntu Linux; not applicable to this platform."
		fi
	fi
	
	RuleResult=0
	return
}

#--------------------------------------------------------------
# rule_Login_Success_or_Failure_in_syslog_conf from policy file:
#  <cdf:title>6.1 System access logging/Login Success or Failure in syslog.conf</cdf:title> 
#  <cdf:description>Login Success or Failure Logging Requirements for syslog.conf</cdf:description> 
#
# FROM COVERAGE MATRIX:
# Requirements for systems that use syslog:
#
# The following requirements cover RedHat, and SLES.
# File:/etc/syslog.conf
# *.info;mail.none;authpriv.none;cron.none /var/log/messages
# authpriv.* /var/log/secure
#
# The following requirements cover Debian Linux:
# auth,authpriv.* /var/log/auth.log
# *.*;auth,authpriv.none -/var/log/syslog
# *.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages
#
# Note: The use of the "-" in "-/var/log/...", which indicates that buffered writes are allowed, is optional in any Linux syslog configuration.
# Note: More extensive logging is permissible, e.g "cron.none" may be removed from the facility section of the control stanza for /var/log
rule_Login_Success_or_Failure_in_syslog_conf()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Login_Success_or_Failure_in_syslog_conf: System access logging/Login Success or Failure in syslog.conf"
	log_message "Parameters received: $arg_string"

	file_name="/etc/syslog.conf"
	
	store_comment=1
	
	# Check if the file exists; if not, exit; the rule states: "for systems that use syslog"
	if [ ! -e $file_name ]
	then
		log_message "$file_name not found; the rule states: <for systems that use syslog>. Exiting."
		RuleResult=0
		return
	fi

	# 1) SuSE and RHEL
	if [ $IsDebian -eq 0 ]
	then
		# Must have these two lines:
		# *.info;mail.none;authpriv.none;cron.none /var/log/messages
		# authpriv.* /var/log/secure
		
		# First line: *.info;mail.none;authpriv.none;cron.none /var/log/messages
		grep '*.info;mail.none;authpriv.none;cron.none' $file_name | grep '/var/log/messages' | grep -v "#" 1>/dev/null 2>&1
		result=$?
		if [ $result -ne 0 ]
		then
			# Line not found or commented out; append it to the file
			log_message "Appending line [*.info;mail.none;authpriv.none;cron.none /var/log/messages] to $file_name"
			if [ $store_comment -eq 1 ]
			then
				echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
				store_comment=0
			fi
			echo '*.info;mail.none;authpriv.none;cron.none /var/log/messages' >> $file_name
		else
			log_message "Found line [*.info;mail.none;authpriv.none;cron.none /var/log/messages] in $file_name"
		fi
		
		# Second line: authpriv.* /var/log/secure
		grep 'authpriv.*' $file_name | grep '/var/log/secure' | grep -v "#" 1>/dev/null 2>&1
		result=$?
		if [ $result -ne 0 ]
		then
			# Line not found or commented out; append it to the file
			log_message "Appending line [authpriv.* /var/log/secure] to $file_name"
			if [ $store_comment -eq 1 ]
			then
				echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
				store_comment=0
			fi
			echo 'authpriv.* /var/log/secure' >> $file_name
		else
			log_message "Found line [authpriv.* /var/log/secure] in $file_name"
		fi
	else
		# Running on Debian?
		if [ $IsDebian -eq 1 ]
		then
			# Must have these 3 lines:
			# auth,authpriv.* /var/log/auth.log
			# *.*;auth,authpriv.none -/var/log/syslog
			# *.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages

			# First line: auth,authpriv.* /var/log/auth.log
			grep 'auth,authpriv.*' $file_name | grep '/var/log/auth.log' | grep -v "#" 1>/dev/null 2>&1
			result=$?
			if [ $result -ne 0 ]
			then
				# Line not found or commented out; append it to the file
				log_message "Appending line [auth,authpriv.* /var/log/auth.log] to $file_name"
				if [ $store_comment -eq 1 ]
				then
					echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
					store_comment=0
				fi
				echo 'auth,authpriv.* /var/log/auth.log' >> $file_name
			else
				log_message "Found line [auth,authpriv.* /var/log/auth.log] in $file_name"
			fi
			
			# Second line: *.*;auth,authpriv.none -/var/log/syslog
			grep '*.*;auth,authpriv.none' $file_name | grep '/var/log/syslog' | grep -v "#" 1>/dev/null 2>&1
			result=$?
			if [ $result -ne 0 ]
			then
				# Line not found or commented out; append it to the file
				log_message "Appending line [*.*;auth,authpriv.none -/var/log/syslog] to $file_name"
				if [ $store_comment -eq 1 ]
				then
					echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
					store_comment=0
				fi
				echo '*.*;auth,authpriv.none -/var/log/syslog' >> $file_name
			else
				log_message "Found line [*.*;auth,authpriv.none -/var/log/syslog] in $file_name"
			fi

			# Third line: *.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages
			# Note: grep had problems with the first patterns so I had to separate them
			grep '*.=info;' $file_name | grep '*.=notice;' | grep '*.=warning;' | grep 'auth,authpriv.none;[[:space:]]*cron,daemon.none;[[:space:]]*mail,news.none' | grep '/var/log/messages' | grep -v "#" 1>/dev/null 2>&1
			result=$?
			if [ $result -ne 0 ]
			then
				# Line not found or commented out; append it to the file
				log_message "Appending line [*.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages] to $file_name"
				if [ $store_comment -eq 1 ]
				then
					echo "# Linux ITCS104 remediation script appending line(s) to $file_name" >> $file_name
					store_comment=0
				fi
				echo '*.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages' >> $file_name
			else
				log_message "Found line [*.=info;*.=notice;*.=warning; auth,authpriv.none; cron,daemon.none; mail,news.none -/var/log/messages] in $file_name"
			fi

		else
			log_message "This remediation function is applicable to SuSE 11+ and RHEL 5+, or Debian Linux; not applicable to this platform."
		fi
	fi
	
	RuleResult=0
	return
}

#--------------------------------------------------------------
get_ftp_home_directory()
{
#echo $(cat /etc/passwd | awk -F: '/^ftp:/{print $6}') 
awk -F: '/^ftp:/{print $6}' /etc/passwd
}

#--------------------------------------------------------------
getACL_new() {
    myfile=$1
	if [ ! -e $myfile ]
	then
		log_message "$myfile not found."
		return 1
	fi
	ACL=`stat -c "%a" $myfile`
	return 0
}
#--------------------------------------------------------------
# rule_Access_Permissions_for_Directories_Accessible_via_Anonymous_FTP from policy file:
# <cdf:title>FTP Restrictions/Access Permissions for Directories Accessible via Anonymous FTP</cdf:title>
# <ruleName>Access_Permissions_for_Directories_Accessible_via_Anonymous_FTP</ruleName>
# <cdf:description>Access permissions for directories accessible via Anonymous FTP.
#      Each directory may allow read access or write access to anonymous users, but not both.</cdf:description>
rule_Access_Permissions_for_Directories_Accessible_via_Anonymous_FTP()
{
  	RuleResult=0 
	arg_string=$*
	numb_of_args=`echo "$arg_string" | wc -w`;

	log_message "rule_Access_Permissions_for_Directories_Accessible_via_Anonymous_FTP"
	log_message "Parameters received: $arg_string"

	#  get the home directory of ftp user from /etc/passwd.
	FTPHOME=$(get_ftp_home_directory)
	#
	# make sure that FTPHOME is reasonable, to protect against otherwise disastrous results.
	#
	if [ -z "$FTPHOME" ]; then
		log_message 'ftp login directory not set.'
		log_message 'The purpose of remediation is to remediate not to set up ftp login directory.'
		RuleResult=1 
		return
	fi
	if [ ! -d "$FTPHOME" ]; then
		log_message "$FTPHOME: not a directory."
		log_message 'The purpose of remediation is to remediate not to set up ftp login directory.'
		RuleResult=1 
		return
	fi
	filepath1="$FTPHOME/bin"
	filepath2="$FTPHOME/etc"
	filepath3="$FTPHOME/lib"
	filepath4="$FTPHOME/dev"
	filepath5="$FTPHOME/usr"
	filepath6="$FTPHOME/pub"
	
	log_message "We will verify the following directories:"
	log_message " $filepath1"
	log_message " $filepath2"
	log_message " $filepath3"
	log_message " $filepath4"
	log_message " $filepath5"
	log_message " $filepath6"

	acl_other_forbidden="7 6" # rwx , rw 
	log_message "   NOTE: value forbidden for Other ACL: $acl_other_forbidden"	

	log_message "checking $filepath1 ..."
	getACL_new "$filepath1"
	if [ $? -eq 0 ]
	then
		log_message "   Current ACL : $ACL"
		otherACL=$(echo ${ACL} | sed 's/.*\(.\)$/\1/')
		log_message "   Other ACL value : $otherACL"
		res=$(containsa "$acl_other_forbidden" "$otherACL")
		if [ $res -eq 0 ] ; then
			log_message "   Settings are ok. nothing to do."
		else
			log_message "   Remediation is required."
			log_message "   Change ACL settings for other to $((otherACL-2)) "
			log_message "   will run chmod o-w $filepath1 "
			$(chmod o-w $filepath1)
			if [ $? -eq 0 ];then
				log_message "   ACL setting was successfully changed."
			else
				log_message "   Failure. ACL setting was NOT successfully changed."
				RuleResult=1 
			fi 
		fi
	fi

	log_message "checking $filepath2 ..."
	getACL_new "$filepath2"
	if [ $? -eq 0 ]
	then
		log_message "   Current ACL : $ACL"
		otherACL=$(echo ${ACL} | sed 's/.*\(.\)$/\1/')
		log_message " Other ACL value : $otherACL"
		res=$(containsa "$acl_other_forbidden" "$otherACL")
		if [ $res -eq 0 ] ; then
			log_message " Settings are ok. nothing to do."
		else
			log_message " Remediation is required."
			log_message " Change ACL settings for other to $((otherACL-2)) "
			log_message " will run chmod o-w $filepath2 "
			$(chmod o-w $filepath2)
			if [ $? -eq 0 ];then
				log_message " ACL setting was successfully changed."
			else
				log_message " Failure. ACL setting was NOT successfully changed."
				RuleResult=1 
			fi 
		fi 	
	fi

	log_message "checking $filepath3 ..."
	getACL_new "$filepath3"
	if [ $? -eq 0 ]
	then
		log_message "   Current ACL : $ACL"
		otherACL=$(echo ${ACL} | sed 's/.*\(.\)$/\1/')
		log_message "   Other ACL value : $otherACL"
		res=$(containsa "$acl_other_forbidden" "$otherACL")
		if [ $res -eq 0 ] ; then
			log_message "   Settings are ok. nothing to do."
		else
			log_message "   Remediation is required."
			log_message "   Change ACL settings for other to $((otherACL-2)) "
			log_message "   will run chmod o-w $filepath3 "
			$(chmod o-w $filepath3)
			if [ $? -eq 0 ];then
				log_message "   ACL setting was successfully changed."
			else
				log_message "   Failure. ACL setting was NOT successfully changed."
				RuleResult=1 
			fi 
		fi 	
	fi

	log_message "checking $filepath4 ..."
	getACL_new "$filepath4"
	if [ $? -eq 0 ]
	then
		log_message "   Current ACL : $ACL"
		otherACL=$(echo ${ACL} | sed 's/.*\(.\)$/\1/')
		log_message "   Other ACL value : $otherACL"
		res=$(containsa "$acl_other_forbidden" "$otherACL")
		if [ $res -eq 0 ] ; then
			log_message "   Settings are ok. nothing to do."
		else
			log_message "   Remediation is required."
			log_message "   Change ACL settings for other to $((otherACL-2)) "
			log_message "   will run chmod o-w $filepath4 "
			$(chmod o-w $filepath4)
			if [ $? -eq 0 ] ;then
				log_message "   ACL setting was successfully changed."
			else
				log_message "   Failure. ACL setting was NOT successfully changed."
				RuleResult=1 
			fi 
		fi 	
	fi

	log_message "checking $filepath5 ..."
	getACL_new "$filepath5"
	if [ $? -eq 0 ]
	then
		log_message "   Current ACL : $ACL"
		otherACL=$(echo ${ACL} | sed 's/.*\(.\)$/\1/')
		log_message "   Other ACL value : $otherACL"
		res=$(containsa "$acl_other_forbidden" "$otherACL")
		if [ $res -eq 0 ] ; then
			log_message "   Settings are ok. nothing to do."
		else
			log_message "   Remediation is required."
			log_message "   Change ACL settings for other to $((otherACL-2)) "
			log_message "   will run chmod o-w $filepath5 "
			$(chmod o-w $filepath5)
			if [ $? -eq 0 ];then
				log_message "   ACL setting was successfully changed."
			else
				log_message "   Failure. ACL setting was NOT successfully changed."
				RuleResult=1 
			fi 
		fi 	
	fi
	
	log_message "checking $filepath6 ..."
	getACL_new "$filepath6"
	if [ $? -eq 0 ]
	then
		log_message "   Current ACL : $ACL"
		otherACL=$(echo ${ACL} | sed 's/.*\(.\)$/\1/')
		log_message "   Other ACL value : $otherACL"
		res=$(containsa "$acl_other_forbidden" "$otherACL")
		if [ $res -eq 0 ] ; then
			log_message "   Settings are ok. nothing to do."
		else
			log_message "   Remediation is required."
			log_message "   Change ACL settings for other to $((otherACL-2)) "
			log_message "   will run chmod o-w $filepath6 "
			$(chmod o-w $filepath6)
			if [ $? -eq 0 ];then
				log_message "   ACL setting was successfully changed."
			else
				log_message "   Failure. ACL setting was NOT successfully changed."
				RuleResult=1 
			fi 
		fi 	
	fi
	getACL_new "$FTPHOME"
	if [ $? -eq 0 ]
	then
		otherACL=$(echo ${ACL} | sed 's/.*\(.\)$/\1/')
		res=$(containsa "$acl_other_forbidden" "$otherACL")
		if [ $res -eq 1 ] ; then 
			log_message "fix up ftp's root directory"
			$(chmod 555 $FTPHOME)
			$(chown root $FTPHOME)
		fi
	fi
}

#--------------------------------------------------------------
# Rule Configuration_of_the_BIN_Subdirectory_of_the_FTP_Account_Home_Directory
# <cdf:title>FTP Restrictions/Configuration of the BIN Subdirectory of the FTP Account Home Directory</cdf:title>
# <ruleName>Configuration_of_the_BIN_Subdirectory_of_the_FTP_Account_Home_Directory</ruleName>
# <cdf:description>Configuration of the bin subdirectory of the ftp account home directory.
# Must be owned by root and grant write access only to the owner. Files contained in this directory must have a mode of 0111.</cdf:description>
rule_Configuration_of_the_BIN_Subdirectory_of_the_FTP_Account_Home_Directory()
{

  	RuleResult=0 
	arg_string=$*
	numb_of_args=`echo "$arg_string" | wc -w`;

	log_message "Rule : rule_Configuration_of_the_BIN_Subdirectory_of_the_FTP_Account_Home_Directory"
	log_message "Parameters received: $arg_string"
	
	requested_permission="rx"

	ftpHomeDir="$(get_ftp_home_directory)"
	if [[ "$ftpHomeDir" == "" ]] ; then 
		log_message "No FTP home was found. Nothing to do. Exiting... "
		return
	else 
		log_message "FTP home directory found : $ftpHomeDir "
		target_directory="$ftpHomeDir/bin"
		if [[ -d $target_directory ]] ; then 
			log_message "Directory $target_directory was found. Checking permissions for OTHER and GROUP, and the owner ... "	
			log_message "Expected ACL OTHER and GROUP settings : r-x or more stringent "
			
			log_message "Checking and setting requested OTHER mode if applicable..."
			accepted_permission_modes_grep_expression="..[541]"
			check_and_set_other_permission_mode $target_directory $requested_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    An error occurred while trying to set the OTHER permissions for $target_directory; manual verification is needed."
				RuleResult=1
			fi

			log_message "Checking and setting requested GROUP mode if applicable..."
			accepted_permission_modes_grep_expression=".[541]."
			check_and_set_group_permission_mode $target_directory $requested_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    An error occurred while trying to set the group permissions for $target_directory; manual verification is needed."
				RuleResult=1
			fi

			log_message "Ensuring that the owner of $target_directory is root..."
			if [[ $(chown root $target_directory) -gt 0 ]] ; then 
				log_message "\t The $target_directory owner was NOT successfully changed."
				RuleResult=1
			else
				log_message "The $target_directory owner was successfully set to root."	
			fi	
				
			log_message "Checking all files inside $target_directory (we skip directories, sym. links and files with 111 octal perms) ..."
			file_found=0
			ls -l $target_directory > /tmp/bin_dir_listing$$
			while read -r line
			do
				skip_line=0
				first_word=`echo -e $line | awk '{print $1}'`
				if [ "$first_word" == "total" ]
				then
					skip_line=1
				fi
				if echo -e $first_word | grep '^[dl]' 2>&1 1>/dev/null
				then
					# Directory or link: skip
					skip_line=1
				fi
				if [ $skip_line -eq 0 ]
				then
					current_file=`echo -e $line | awk '{print $9}'`
					log_message "Checking file $current_file"
					getACL_new "$target_directory/$current_file"
					acl_requested="111"
					if [[ "$ACL" != "$acl_requested" ]] ; then
						file_found=1
						log_message "Remediation : setting mode $acl_requested for file $target_directory/$current_file"
						$(chmod $acl_requested $target_directory/$current_file)
						if [[ $? -ne 0 ]] ; then 
							log_message "    Failure."
							RuleResult=1
						else
							log_message "    Permissions were successfully changed on $target_directory/$current_file."
						fi 
					fi
				fi
			done < /tmp/bin_dir_listing$$
			rm -f /tmp/bin_dir_listing$$

			if [ $file_found -eq 0 ]
			then
				log_message "No remediation was needed on any file in $target_directory"
			fi
		else 
			log_message "$target_directory was not found. Nothing to do."
		fi 
	fi
	
	return
}

#--------------------------------------------------------------
# rule_Configuration_of_the_ETC_Subdirectory_of_the_FTP_Account_Home_Directory
# <cdf:description>Configuration of the etc subdirectory of the ftp account home directory.
# Must be owned by root and grant write access only to the owner.</cdf:description>
rule_Configuration_of_the_ETC_Subdirectory_of_the_FTP_Account_Home_Directory()
{

  	RuleResult=0 
	arg_string=$*
	numb_of_args=`echo "$arg_string" | wc -w`;

	log_message "Rule : rule_Configuration_of_the_ETC_Subdirectory_of_the_FTP_Account_Home_Directory"
	log_message "Parameters received: $arg_string"
	
	requested_permission="rx"

	ftpHomeDir="$(get_ftp_home_directory)"
	if [[ "$ftpHomeDir" == "" ]] ; then 
		log_message "No FTP home was found. Nothing to do. Exiting... "
		return
	else 
		log_message "FTP home directory found : $ftpHomeDir "
		target_directory="$ftpHomeDir/etc"
		if [[ -d $target_directory ]] ; then 
			log_message "Directory $target_directory was found. Checking permissions for OTHER and GROUP, and the owner ... "	
			log_message "Expected ACL OTHER and GROUP settings : r-x or more stringent "
			
			log_message "Checking and setting requested OTHER mode if applicable..."
			accepted_permission_modes_grep_expression="..[541]"
			check_and_set_other_permission_mode $target_directory $requested_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    An error occurred while trying to set the OTHER permissions for $target_directory; manual verification is needed."
				RuleResult=1
			fi

			log_message "Checking and setting requested GROUP mode if applicable..."
			accepted_permission_modes_grep_expression=".[541]."
			check_and_set_group_permission_mode $target_directory $requested_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    An error occurred while trying to set the group permissions for $target_directory; manual verification is needed."
				RuleResult=1
			fi

			log_message "Ensuring that the owner of $target_directory is root..."
			if [[ $(chown root $target_directory) -gt 0 ]] ; then 
				log_message "\t The $target_directory owner was NOT successfully changed."
				RuleResult=1
			else
				log_message "The $target_directory owner was successfully set to root."	
			fi	
		else 
			log_message "$target_directory was not found. Nothing to do."
		fi 
	fi
	
	return
}

#--------------------------------------------------------------
# rule_Configuration_of_the_LIB_Subdirectory_of_the_FTP_Account_Home_Directory
# <cdf:title>FTP Restrictions/Configuration of the LIB Subdirectory of the FTP Account Home Directory</cdf:title>
# <ruleName>Configuration_of_the_LIB_Subdirectory_of_the_FTP_Account_Home_Directory</ruleName>
# <cdf:description>Configuration of the lib subdirectory of the ftp account home directory.
# Must be owned by root and grant write access only to the owner.
# Files contained in this directory must have a mode of 0555.</cdf:description>
rule_Configuration_of_the_LIB_Subdirectory_of_the_FTP_Account_Home_Directory()
{

  	RuleResult=0 
	arg_string=$*
	numb_of_args=`echo "$arg_string" | wc -w`;

	log_message "Rule : rule_Configuration_of_the_LIB_Subdirectory_of_the_FTP_Account_Home_Directory"
	log_message "Parameters received: $arg_string"
	
	requested_permission="rx"

	ftpHomeDir="$(get_ftp_home_directory)"
	if [[ "$ftpHomeDir" == "" ]] ; then 
		log_message "No FTP home was found. Nothing to do. Exiting... "
		return
	else 
		log_message "FTP home directory found : $ftpHomeDir "
		target_directory="$ftpHomeDir/lib"
		if [[ -d $target_directory ]] ; then 
			log_message "Directory $target_directory was found. Checking permissions for OTHER and GROUP, and the owner ... "	
			log_message "Expected ACL OTHER and GROUP settings : r-x or more stringent "
			
			log_message "Checking and setting requested OTHER mode if applicable..."
			accepted_permission_modes_grep_expression="..[541]"
			check_and_set_other_permission_mode $target_directory $requested_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    An error occurred while trying to set the OTHER permissions for $target_directory; manual verification is needed."
				RuleResult=1
			fi

			log_message "Checking and setting requested GROUP mode if applicable..."
			accepted_permission_modes_grep_expression=".[541]."
			check_and_set_group_permission_mode $target_directory $requested_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    An error occurred while trying to set the group permissions for $target_directory; manual verification is needed."
				RuleResult=1
			fi

			log_message "Ensuring that the owner of $target_directory is root..."
			if [[ $(chown root $target_directory) -gt 0 ]] ; then 
				log_message "\t The $target_directory owner was NOT successfully changed."
				RuleResult=1
			else
				log_message "The $target_directory owner was successfully set to root."	
			fi	
				
			log_message "Checking all files inside $target_directory (we skip directories, sym. links and files with 555 octal perms) ..."
			file_found=0
			ls -l $target_directory > /tmp/lib_dir_listing$$
			while read -r line
			do
				skip_line=0
				first_word=`echo -e $line | awk '{print $1}'`
				if [ "$first_word" == "total" ]
				then
					skip_line=1
				fi
				if echo -e $first_word | grep '^[dl]' 2>&1 1>/dev/null
				then
					# Directory or link: skip
					skip_line=1
				fi
				if [ $skip_line -eq 0 ]
				then
					current_file=`echo -e $line | awk '{print $9}'`
					log_message "Checking file $current_file"
					getACL_new "$target_directory/$current_file"
					acl_requested="555"
					if [[ "$ACL" != "$acl_requested" ]] ; then
						file_found=1
						log_message "Remediation : setting mode $acl_requested for file $target_directory/$current_file"
						$(chmod $acl_requested $target_directory/$current_file)
						if [[ $? -ne 0 ]] ; then 
							log_message "    Failure."
							RuleResult=1
						else
							log_message "    Permissions were successfully changed on $target_directory/$current_file."
						fi 
					fi
				fi
			done < /tmp/lib_dir_listing$$
			rm -f /tmp/lib_dir_listing$$

			if [ $file_found -eq 0 ]
			then
				log_message "No remediation was needed on any file in $target_directory"
			fi
		else 
			log_message "$target_directory was not found. Nothing to do."
		fi 
	fi
	
	return
}


#####################################
#<cdf:title>1.5 Network Settings/Configuration of the OTHER Subdirectories of the FTP Account Home Directory</cdf:title>
#<ruleName>Configuration_of_the_OTHER_Subdirectories_of_the_FTP_Account_Home_Directory</ruleName>

#<cdf:description>Configuration of other subdirectories of the ftp account home directory. Must not be owned by a general user account. If write access is granted to the group owner of the file, membership in the group is a security administrative authority. Files and directories must allow only read/execute, write/execute, execute (directories only), or no access for other.</cdf:description>

#<scm:violationMessage>Invalid Anon FTP Home Directory Permissions for File : {1}, Owner: {2}, Text Permission: {3}, Octal Permission: {4}</scm:violationMessage>
#####################################
rule_Configuration_of_the_OTHER_Subdirectories_of_the_FTP_Account_Home_Directory()
{
	arg_string=$*
	numb_of_args=`echo "$arg_string" | wc -w`;

	log_message "Rule : rule_Configuration_of_the_OTHER_Subdirectories_of_the_FTP_Account_Home_Directory"
	log_message "Parameters received: $arg_string"
	failure=0
	ftpHomeDir="$(get_ftp_home_directory)"
    
	if [[ "$ftpHomeDir" == "" ]] ; then 
		log_message "No FTP home was found. Nothing to do. Exiting... "
		return
	else 
		log_message "FTP home directory found : $ftpHomeDir "
        files_to_process="$(find $ftpHomeDir*)"
        
		for target_directory in $files_to_process
        do            
            if [[ -d $target_directory ]] ; then                 
                echo "$target_directory"|egrep -i "((/bin)|(/etc)|(/lib))$" 2>&1 1>/dev/null                
                if [ $? -ne 0 ]
                then
                    #Check if file is owned by a general user account
                    log_message "Ensuring that the owner of $target_directory is ftp..."
                    octal_perm=`stat --format "%a" "$target_directory"`
                    text_perm=`stat --format "%A" "$target_directory"`
                    owner=`stat --format "%U" "$target_directory"`
                    
                    if [[ $owner != "ftp" ]] ; then     
                        if [[ $(chown ftp $target_directory) -gt 0 ]] ; then 
                            log_message "The $target_directory owner, was NOT successfully changed to 'ftp'."
                            failure=`expr $failure + 1`
                        else
                            log_message "The $target_directory owner was successfully changed to 'ftp'."	
                        fi
                    else
                        log_message "The $target_directory owner is already set to 'ftp'."
                    fi
					
                    #Check if write access is granted to the group owner of the file 
                    group_perm=`stat --format "%A" "$target_directory"|sed 's/^.\(...\)\(...\).../\1\2/g'`
                    echo "$group_perm"|egrep -i "w" 2>&1 1>/dev/null                    
                    if [ $? -eq 0 ]
                    then
                        log_message "write access is present to the group owner of the file '$target_directory'"
                    else
                        log_message "write access is NOT present to the group owner of the file '$target_directory'"
                    fi
					
                    #Files and directories must allow only read/execute, write/execute, execute (directories only),
                    #or no access for other
                    other_perm=`stat --format "%A" "$target_directory"|sed 's/^.......\(...\)/\1/g'`
                    echo "$other_perm"|egrep -i "(r-x)|(-wx)|(--x)|(---)" 2>&1 1>/dev/null                    
                    if [ $? -eq 0 ]
                    then
                        log_message "Directory $target_directory already have permission '$other_perm' for others"
                    else                        
                        chmod o-rwx $target_directory 1>/dev/null 2>&1                         
                        if [ $? -eq 0 ]; then
                            log_message "Directory $target_directory permission successfully changed to '---' for others"
						else
							log_message "Failed to change Directory $target_directory permission to '---' for others"
							failure=`expr $failure + 1`
                        fi
                    fi                    
                fi
                ####################################################completed till this point
            else                
                octal_perm=`stat --format "%a" "$target_directory"`
                text_perm=`stat --format "%A" "$target_directory"`
                owner=`stat --format "%U" "$target_directory"`

                if [[ -f $target_directory ]] ; then
                    if [[ $owner != "ftp" ]] ; then                        
                        if [[ $(chown ftp $target_directory) -gt 0 ]] ; then 
                            log_message "The $target_directory owner, was NOT successfully changed to 'ftp'."
                            failure=`expr $failure + 1`
                        else
                            log_message "The $target_directory owner was successfully changed to 'ftp'."
                        fi
                    else
                        log_message "The $target_directory owner is already set to 'ftp'."
                    fi
                    #Files and directories must allow only read/execute, write/execute, execute (directories only),
                    #or no access for other
                    other_perm=`stat --format "%A" "$target_directory"|sed 's/^.......\(...\)/\1/g'`
                    echo "$other_perm"|egrep -i "(r-x)|(-wx)|(---)" 2>&1 1>/dev/null                    
                    if [ $? -eq 0 ]
                    then
                        log_message "File $target_directory already have permission '$other_perm' for others"
                    else                        
                        chmod o-rwx $target_directory 1>/dev/null 2>&1                        
                        if [ $? -eq 0 ]; then
                            log_message "File $target_directory permission successfully changed to '---' for others"
						else
							log_message "Failed to change $target_directory permission to '---' for others"
							failure=`expr $failure + 1`                        
                        fi
                    fi
                else
                    log_message "$target_directory was not found. Nothing to do."
                fi                
            fi 
        done
		if [ $failure -gt 0 ];then
			RuleResult=1
		else
			RuleResult=0
		fi
	fi
	return
}

#--------------------------------------------------------------
# rule_Configuration_of_the_FTP_Account_Home_Directory
# <cdf:title>FTP Restrictions/Configuration of the FTP Account Home Directory</cdf:title>
# <ruleName>Configuration_of_the_FTP_Account_Home_Directory</ruleName>
# <cdf:description>Configuration of the ftp account home directory. Must be owned by root and grant write access only to the owner</cdf:description>
rule_Configuration_of_the_FTP_Account_Home_Directory()
{
 	RuleResult=0 
	arg_string=$*
	numb_of_args=`echo "$arg_string" | wc -w`;

	log_message "Rule : rule_Configuration_of_the_FTP_Account_Home_Directory"
	log_message "Parameters received: $arg_string"
	
	requested_permission="rx"

	ftpHomeDir="$(get_ftp_home_directory)"
	if [[ "$ftpHomeDir" == "" ]] ; then 
		log_message "No FTP home was found. Nothing to do. Exiting... "
		return
	else 
		log_message "FTP home directory found : $ftpHomeDir "
		target_directory="$ftpHomeDir"
		if [[ -d $target_directory ]] ; then 
			log_message "Directory $target_directory was found. Checking permissions for OTHER and GROUP, and the owner ... "	
			log_message "Expected ACL OTHER and GROUP settings : r-x or more stringent "
			
			log_message "Checking and setting requested OTHER mode if applicable..."
			accepted_permission_modes_grep_expression="..[541]"
			check_and_set_other_permission_mode $target_directory $requested_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    An error occurred while trying to set the OTHER permissions for $target_directory; manual verification is needed."
				RuleResult=1
			fi

			log_message "Checking and setting requested GROUP mode if applicable..."
			accepted_permission_modes_grep_expression=".[541]."
			check_and_set_group_permission_mode $target_directory $requested_permission $accepted_permission_modes_grep_expression
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    An error occurred while trying to set the group permissions for $target_directory; manual verification is needed."
				RuleResult=1
			fi

			log_message "Ensuring that the owner of $target_directory is root..."
			if [[ $(chown root $target_directory) -gt 0 ]] ; then 
				log_message "\t The $target_directory owner was NOT successfully changed."
				RuleResult=1
			else
				log_message "The $target_directory owner was successfully set to root."	
			fi	
		else 
			log_message "$target_directory was not found. Nothing to do."
		fi 
	fi
	
	return
}


#--------------------------------------------------------------
# rule_TCP_Configuration_Files_Required from policy file:
#  <cdf:title>TCP Restrictions/TCP Configuration Files Required</cdf:title> 
#  <cdf:description>/etc/sysctl.conf file or proc files must exist</cdf:description> 
# Arguments:
#   none
rule_TCP_Configuration_Files_Required()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	file_name="/etc/sysctl.conf"
	log_message "rule_TCP_Configuration_Files_Required: /etc/sysctl.conf file or proc files must exist."
	log_message "Parameters received: $arg_string"

    # Verify if /etc/sysctl.conf exists; if not, create it
	if [ ! -e $file_name ]
	then
	    log_message "$file_name not found on the system. Creating it."
		touch $file_name
		chmod 0644 $file_name
	else
	    log_message "$file_name found on the system. No action to take."
	fi

	RuleResult=0
	return
}

#--------------------------------------------------------------
# rule_TCP_Configuration_Files_Restrictions from policy file:
#  <cdf:title>TCP Restrictions/TCP Configuration Files Restrictions</cdf:title> 
#  <cdf:description>/etc/sysctl.conf file or proc files must contain the following settings:
#    net.ipv4.tcp_syncookies =1
#	 net.ipv4.icmp_echo_ignore_broadcasts = 1
#	 net.ipv4.conf.all.accept_redirects = 0
#	 The sysctl -p /etc/sysctl.conf command or reboot is required to apply changes to the file.</cdf:description>
# The related proc files are:
#    /proc/sys/net/ipv4/tcp_syncookies
#    /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
#    /proc/sys/net/ipv4/conf/all/accept_redirects
#
# Arguments:
#   none
rule_TCP_Configuration_Files_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	file_name="/etc/sysctl.conf"
	log_message "rule_TCP_Configuration_Files_Restrictions: TCP Restrictions/TCP Configuration Files Restrictions."
	log_message "Parameters received: $arg_string"

    # Verify if /etc/sysctl.conf exists; if not, create it
	if [ ! -e $file_name ]
	then
	    log_message "$file_name not found on the system. Creating it."
		touch $file_name
		chmod 0644 $file_name
	fi

	got_error=0
	apply_changes=0

	# Insert (or replace) the required lines in the file
	#    net.ipv4.tcp_syncookies = 1
	current_value_in_file=`grep "net.ipv4.tcp_syncookies" $file_name | grep -v "#" | awk '{print $3}'`
	if [ "$current_value_in_file" = "" ]
	then
	    current_value_in_file=999
	fi
	if [ $current_value_in_file -eq 1 ]
	then
	    log_message "net.ipv4.tcp_syncookies is already set to 1; does not need to be changed."
	else
		apply_changes=1
		GlobalStringArgument="net.ipv4.tcp_syncookies = 1"
		insert_or_replace_line_in_file_based_on_one_keyword $file_name "net.ipv4.tcp_syncookies"
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to insert the line [$GlobalStringArgument] in $file_name"
			got_error=1
		fi
	fi

	#	 net.ipv4.icmp_echo_ignore_broadcasts = 1
	current_value_in_file=`grep "net.ipv4.icmp_echo_ignore_broadcasts" $file_name | grep -v "#" | awk '{print $3}'`
	if [ "$current_value_in_file" = "" ]
	then
	    current_value_in_file=999
	fi
	if [ $current_value_in_file -eq 1 ]
	then
	    log_message "net.ipv4.icmp_echo_ignore_broadcasts is already set to 1; does not need to be changed."
	else
		apply_changes=1
		GlobalStringArgument="net.ipv4.icmp_echo_ignore_broadcasts = 1"
		insert_or_replace_line_in_file_based_on_one_keyword $file_name "net.ipv4.icmp_echo_ignore_broadcasts"
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to insert the line [$GlobalStringArgument] in $file_name"
			got_error=1
		fi
	fi

		#	 net.ipv4.conf.all.accept_redirects = 0
	current_value_in_file=`grep "net.ipv4.conf.all.accept_redirects" $file_name | grep -v "#" | awk '{print $3}'`
	if [ "$current_value_in_file" = "" ]
	then
	    current_value_in_file=999
	fi
	if [ $current_value_in_file -eq 0 ]
	then
	    log_message "net.ipv4.conf.all.accept_redirects is already set to 0; does not need to be changed."
	else
		apply_changes=1
		GlobalStringArgument="net.ipv4.conf.all.accept_redirects = 0"
		insert_or_replace_line_in_file_based_on_one_keyword $file_name "net.ipv4.conf.all.accept_redirects"
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to insert the line [$GlobalStringArgument] in $file_name"
			got_error=1
		fi
	fi

	if [ $got_error -eq 0 -a $apply_changes -eq 1 ]
	then
		#	 The sysctl -p /etc/sysctl.conf command is required to apply changes to the file.
		log_message "Applying the modified $file_name"
		result_message=`sysctl -p /etc/sysctl.conf 2>1`
		log_message "$result_message"
	fi
	
	RuleResult=$got_error
	return
}

#--------------------------------------------
# rule_Password_Control_Values_Files from policy file:
#<cdf:title>2.1 Reusable Passwords/Password Control Values Files</cdf:title>
#<ruleName>Password_Control_Values_Files</ruleName>
#<cdf:description>
#The files 
#/etc/pam.d/login, 
#/etc/pam.d/passwd, 
#/etc/pam.d/sshd and 
#/etc/pam.d/su 
#must exist</cdf:description>
#<scm:violationMessage>File "{1}" does not exist. But it must exists.</scm:violationMessage>
#--------------------------------------------
rule_Password_Control_Values_Files()
{
    #The files /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su must exist
	log_message "rule_Password_Control_Values_Files: 2.1 Reusable Passwords/Password Control Values Files"
	log_message "Parameters received: $arg_string"
    RuleResult=0
    if [ ! -e "/etc/pam.d/login" ]
    then
        create_files_with_permisions "/etc/pam.d/login" "640"
    else
        log_message "File /etc/pam.d/login already exists"
    fi
    #---------------------
    if [ ! -e "/etc/pam.d/passwd" ]
    then
        create_files_with_permisions "/etc/pam.d/passwd" "640"
    else
        log_message "File /etc/pam.d/passwd already exists"
    fi
    #---------------------
    if [ ! -e "/etc/pam.d/sshd" ]
    then
        create_files_with_permisions "/etc/pam.d/sshd" "640"
    else
        log_message "File /etc/pam.d/sshd already exists"
    fi
    #---------------------
    if [ ! -e "/etc/pam.d/su" ]
    then
        create_files_with_permisions "/etc/pam.d/su" "640"
    else
        log_message "File /etc/pam.d/su already exists"
    fi
    
    return
}
#---------------------------------------------
#given file full path and permissions(3 digit numeric) as input, creates file
#put initial comments in file
#
#---------------------------------------------
create_files_with_permisions()
{
    file_name=$1
    perm=$2
    creation_timestamp=`date`
    if [ ! -e $file_name ]
    then
        log_message "File '$file_name' does not exist. But it must exist."
        echo "#This file is created by remediation script '$0' " > $file_name
        echo "#Creation timestamp is $creation_timestamp" >> $file_name
        chmod "0$perm" $file_name
		if [ $? -eq 0 ]
		then 
            log_message "File $file_name created successfully with permissions 0$perm"
		else 
			log_message "Failure! File $file_name creation failed"
            RuleResult=1
		fi 
    fi
}

Deny_access_files()
{
	arg_string=$*
	file=$1
	# Check that the file exists
	if [ ! -e $file ]
	then
		log_message "File $file not found. Creating it..."
		create_files_with_permisions "$file" "640"
		if [ ! -e $file ]
		then
			log_message "Failed to create file $file"
			RuleResult=1
			return
		else
			log_message "File $file successfully created"
		fi
	else
		log_message "File $file Already Exist!!"
	fi

	# check for following required pattern 
	# auth required /lib/security/$ISA/pam_listfile.so item=user sense=deny file=/etc/security/$FILENAME onerr=succeed
	egrep '^auth[[:space:]]+required[[:space:]]+\/lib\/security\/\$ISA\/pam_listfile\.so[[:space:]]+item\=user[[:space:]]+sense\=deny[[:space:]]+file\=\/etc\/security\/\$FILENAME[[:space:]]+onerr\=succeed' $file 1>/dev/null 2>&1
	result=$?
	
	if [ $result -ne 0 ]
	then
	    log_message "Required entry does not exist in the file $file. Remediating it now..."
	    lineNoToInsert="$(egrep -n '^auth[[:space:]]+sufficient' $file | egrep  -v '^#' | tail -1 | cut -f 1 -d ":")"
		lineNoToInsert=`expr $lineNoToInsert + 1`
		# Deciding Location to Insert entry in the $file
	    if [ -z "$lineNoToInsert" ]; then
	    	log_message "Appending required entry at the end of the file $file, since preceding auth entry with control=value not found "
	        echo -e "auth      required      /lib/security/\$ISA/pam_listfile.so item=user sense=deny file=/etc/security/\$FILENAME onerr=succeed" >> $file
		
			if [ $? -ne 0 ]; then
				log_message "Failed to append required entry at the end of file $file" 
				RuleResult=1
				return
			else
				log_message "Successfully appended required entry at the end of file $file" 
				RuleResult=0
				return
			fi
		else
			lineNoToInsertUsingSed=$lineNoToInsert"i"
			log_message "Inserting required entry preceding since existing auth entry with control=value found in the file $file."
			sed -i "$lineNoToInsertUsingSed auth        required      /lib/security/\$ISA/pam_listfile.so item=user sense=deny file=/etc/security/\$FILENAME onerr=succeed" $file
			if [ $? -ne 0 ]; then
				log_message "Failed to insert required entry before existing auth entry in the file $file"
				RuleResult=1
				return
			else
				log_message "Successfully inserted required entry before existing auth entry in the file $file"
				RuleResult=0
				return
			fi
		fi
	# Entry Already Exists
	else
		log_message "File $file already contains required settings. Remediation not Required"
		RuleResult=0
		return
	fi
}

#---------------------------------
# <cdf:title>1.1 Password Requirements/Deny access files - Red Hat</cdf:title>
# <ruleName>Deny_access_files_Red_Hat</ruleName>
# <cdf:description>/etc/pam.d/system-auth and /etc/pam.d/password-auth must exist and include these settings auth required /lib/security/$ISA/pam_listfile.so item=user sense=deny file=/etc/security/$FILENAME onerr=succeed Note: This entry must precede any entries of type auth whose control field is set to the value sufficient. </cdf:description>
# <scm:violationMessage>/etc/pam.d/system-auth or /etc/pam.d/password-auth - required entry missing: {1}</scm:violationMessage>
#---------------------------------
rule_Deny_access_files_Red_Hat()
{
	arg_string=$1
	log_message "rule_Deny_access_files_Red_Hat: 1.1 Password Requirements/Deny access files - Red Hat"
	log_message "Parameters received: $arg_string"
    RuleResult=0
	
    systemAuthFile="/etc/pam.d/system-auth"
    passwordAuthFile="/etc/pam.d/password-auth"
	
	if [ "$IsRedHat" = "1" ]
    then
        Deny_access_files $systemAuthFile
		Deny_access_files $passwordAuthFile
	else
		log_message "Remediation can not run on OS other than RHEL, Exiting!!"
		RuleResult=2
		return
    fi
 }

#----------------------------------------------
#<cdf:title>1.1 Password Requirements/Deny access files - Debian and SLES</cdf:title>
#<ruleName>Deny_access_files_Debian_and_SLES</ruleName>
#<cdf:description>For Debian and SLES: /etc/pam.d/common-auth must exist and include these settings
#auth required /lib/security/\$ISA/pam_listfile.so item=user sense=deny file=/etc/security/\$FILENAME onerr=succeed
#Note: This entry must precede any entries of type auth whose control field is set to the value sufficient. </cdf:description>
#<scm:violationMessage>/etc/pam.d/common-auth - required entry missing: {1}</scm:violationMessage>
rule_Deny_access_files_Debian_and_SLES()
{
	arg_string=$1
	log_message "1.1 Password Requirements/Deny access files - Debian and SLES"
	log_message "Parameters received: $arg_string"
    RuleResult=0
	commonAuthFile="/etc/pam.d/common-auth"
	
	if [ "$IsDebian" = "1" -o "$IsSUSE" = "1"  ]
	then
		Deny_access_files $commonAuthFile
	else
		log_message "Remediation can not run on OS other than Debian or SUSE, Exiting!!"
		RuleResult=2
		return
	fi
	
	return
}

#-----------------------------
#<cdf:title>1.5 Network Settings/FTP Deamon Options</cdf:title>
#<ruleName>FTP_Deamon_Options</ruleName>
#<cdf:description>UNIX ftpd daemon options: If any directories will be made writable, the -u option must be used</cdf:description>
#<scm:violationMessage>{1}</scm:violationMessage>
#-----------------------------
rule_FTP_Deamon_Options()
{
  	RuleResult=0 
	arg_string=$*
	numb_of_args=`echo "$arg_string" | wc -w`;

	log_message "Rule : rule_FTP_Deamon_Options"
	log_message "Parameters received: $arg_string"
	
	ftpHomeDir="$(get_ftp_home_directory)"
    #echo "ftp homedirectory $ftpHomeDir"
	if [[ "$ftpHomeDir" == "" ]] ; then 
		log_message "No FTP home was found. Nothing to do. Exiting... "
		return
	else 
		log_message "FTP home directory found : $ftpHomeDir "
        
        for target_directory in  "$ftpHomeDir/"* 
        do
            if [[ -d $target_directory ]] ; then
                log_message "Checking directory '$target_directory' is writable or not"
                grp_oth_perm=`stat --format "%A" "$target_directory"|sed 's/^....\(...\)\(...\)/\1\2/g'`
                echo "$grp_oth_perm"|egrep -i "w" 2>&1 1>/dev/null
                result=$?
                if [ $result -eq 0 ]
                then
                    log_message "Directory '$target_directory' is writable"
                    log_message "If any directories will be made writable, ftpd daemon options -u must be used"
                    `ftpd -u 022`
                    if [ $result -eq 0 ]
                    then
                        log_message "set FTP Deamon -u option successful......"
                        RuleResult=0 
                        return 0
                    else
                        log_message "set FTP Deamon -u option failed......"                    
                        RuleResult=1
                        return 0
                    fi
                else
                    log_message "Directory '$target_directory' is NOT writable"
                fi
            fi
        done
	fi
	return
}
#-----------------------------
#<ruleName>FTP_PASSWD_File_Restrictions</ruleName>
#<description>Passwd files in etc subdirectory of the ftp account home directory. Password fields must be empty.</description>
#<message>User: testme does not have empty passsword in ~ftp/etc/passwd file.</message>
#-----------------------------
rule_FTP_PASSWD_File_Restrictions()
{
    #------------------
    #Passwd files in etc subdirectory of the ftp account home directory. Password fields must be empty.
    #User: {user} does not have empty passsword in ~ftp/etc/passwd file.
    #------------------
    arg_string=$1
	log_message "rule_FTP_PASSWD_File_Restrictions: FTP Restrictions/FTP PASSWD File Restrictions"
	log_message "Parameters received: $arg_string"
    RuleResult=0
    passwd_file="/etc/passwd"
            
    home_dir=`egrep -i "^ftp:" "$passwd_file"|awk -F":" '{print $6}'`
    ftp_passwd_file="$home_dir/etc/passwd"
    if [ -f  "$ftp_passwd_file" -a $home_dir != "" -a -d "$home_dir" ]
    then
        while read -r line
        do
            passwd_val=`echo $line | awk -F":" '{print $2}'`
            user_name=`echo $line | awk -F":" '{print $1}'`
            `echo $passwd_val|sed 's/x//g'|egrep "[a-zA-Z0-9_]+" 2>&1 1>/dev/null`
            result=$?
            if [ $result -eq 0 ]
            then
                log_message "User: $user_name does not have empty passsword in $home_dir/etc/passwd file."
                sed -i "s/^$user_name:[^:]*:/$user_name:x:/g" "$ftp_passwd_file"
                result=$?
                if [ $result -ne 0 ]
                then
                    log_message "Failure! Remediation failed for FTP PASSWD File Restrictions"
                    RuleResult=1
                else
                    log_message "Remediation was successfully applied for FTP PASSWD File Restrictions"
                fi
            else
                log_message "User: $user_name already have empty passsword in $home_dir/etc/passwd file."
            fi
        done < $ftp_passwd_file
    else
        log_message "FTP home directory not set or is not a directory"
        RuleResult=1
    fi
  
	return
}

# ETC_PAM_D_Restrictions() this function is common for rules rule_ETC_PAM_D_RLOGIN_Restrictions & rule_ETC_PAM_D_RSH_Restrictions
# For /etc/pam.d/rlogin & /etc/pam.d/rsh : If the file exists and there is a /lib/security/pam_rhosts_auth.so stanza present, the no_hosts_equiv parameter must be present.

ETC_PAM_D_Restrictions()
{
    file_name=$1	
    
	# Check that if file exists
	if [ ! -e $file_name ]
	then
		log_message "File $file_name does not exist. Remediation Not Required"
		RuleResult=0
		return		
	fi
	
#check if stanza [auth required pam_rhosts_auth.so] already present in file $file_name
    log_message "Checking auth stanza for module pam_rhosts_auth.so"
    if egrep -i "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_rhosts_auth.so" $file_name  2>&1 1>/dev/null
	then
		if egrep -i "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_rhosts_auth.so[[:space:]]+no_hosts_equiv" $file_name  2>&1 1>/dev/null
		then
			log_message "File $file_name already contains module pam_rhosts_auth.so with no_hosts_equiv option.Remediation not required"
			RuleResult=0
		else
			log_message "Inserting no_hosts_equiv option for module pam_rhosts_auth.so"                         
			sed -i "s/\(^\s*auth\s*required\s*[a-zA-Z0-9\/\_]*pam_rhosts_auth.so\).*/\1 no_hosts_equiv/g" $file_name  2>&1 1>/dev/null

			if egrep -i "^[[:space:]]*auth[[:space:]]+required[[:space:]]+[a-zA-Z0-9\/\_]*pam_rhosts_auth.so[[:space:]]+no_hosts_equiv" $file_name  2>&1 1>/dev/null
			then
				log_message "Successfully inserted no_hosts_equiv option for pam_rhosts_auth.so module"
				RuleResult=0
			else
				log_message "Failed to insert no_hosts_equiv option for pam_rhosts_auth.so module"                                
			fi
		fi
	else
		log_message "Module pam_rhosts_auth.so does not exist in file $file_name. Remediation not required"
		RuleResult=0
	fi

	return
}

#<cdf:title>1.5 Network Settings/\ETC\PAM.D\RLOGIN Restrictions</cdf:title>
#<ruleName>ETC_PAM_D_RLOGIN_Restrictions</ruleName>
#<cdf:description>/etc/pam.d/rlogin must contain an auth stanza for /lib/security/pam_rhosts_auth.so with a no_hosts_equiv parameter</cdf:description>
#<scm:violationMessage>/etc/pam.d/rlogin must contain an auth stanza for pam_rhosts_auth.so with a no_hosts_equiv parameter</scm:violationMessage>

rule_ETC_PAM_D_RLOGIN_Restrictions()
{
	arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	log_message "rule_ETC_PAM_D_RLOGIN_Restrictions: 1.5 Network Settings/ETC/PAM.D/RLOGIN Restrictions"
	log_message "Parameters received: $arg_string"
	
	ETC_PAM_D_Restrictions "/etc/pam.d/rlogin"
}

#<cdf:title>1.5 Network Settings/\ETC\PAM.D\RSH Restrictions</cdf:title>
#<ruleName>ETC_PAM_D_RSH_Restrictions</ruleName>
#<cdf:description>/etc/pam.d/rsh must contain an auth stanza for /lib/security/pam_rhosts_auth.so with a no_hosts_equiv parameter</cdf:description>
#<scm:violationMessage>/etc/pam.d/rsh must contain an auth stanza for pam_rhosts_auth.so with a no_hosts_equiv parameter</scm:violationMessage>

rule_ETC_PAM_D_RSH_Restrictions()
{
	arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	log_message "rule_ETC_PAM_D_RSH_Restrictions: 1.5 Network Settings/\ETC\PAM.D\RSH Restrictions"
	log_message "Parameters received: $arg_string"
	
    ETC_PAM_D_Restrictions "/etc/pam.d/rsh"
}

if_nfs_server_running()
{
 serv=`ps -eo comm | grep "^nfsd$" | grep -v "grep"`
 ret_val=$?
 if [[ "$ret_val" == 1 ]] ; then
        return 1 # no nfs server running
 else
        return 0 # nfs server is running
 fi
}

rule_NFS_ETC_EXPORTS_Restrictions_exists()
{
        RuleResult=0
    arg_string=$*
        numb_of_args=`echo "$arg_string" | wc -w`;

        log_message "Objective : NFS Restrictions/NFS \ETC\EXPORTS Restrictionsi Exists"
        log_message "Parameters received: $arg_string"
        if_nfs_server_running
        ret_val=$?
 log_message "Checking for nfs server running :"
 if [ $ret_val -eq 1 ]
  then
        log_message "no nfs server was found running. Exiting..."
        RuleResult=1
        return
 fi
 log_message "nsf server is running"

 log_message "Does file /etc/exports exist? "
 if [[ -e /etc/exports ]] ; then
        log_message "File exists."
 else
        log_message "file was not found."
        log_message "Create /etc/exports file"
        log_message "\t will run touch /etc/exports"
        `touch /etc/exports`
        if [[ $? -eq 1 ]] ; then
                RuleResult=1
                return
        fi
        log_message "file /etc/exports was created"
  fi
  return
}

rule_NFS_ETC_EXPORTS_Restrictions_owner()
{
        RuleResult=0
        arg_string=$*
        numb_of_args=`echo "$arg_string" | wc -w`;

        log_message "Objective : NFS Restrictions/NFS \ETC\EXPORTS Restrictions Owner"
        log_message "Parameters received: $arg_string"
        if_nfs_server_running
        ret_val=$?
        log_message "Checking for nfs server running :"

        if [ $ret_val -eq 1 ]
        then
            log_message "no nfs server was found running. Exiting..."
            RuleResult=1
        return
        fi

        log_message "nsf server is running"

        log_message "Does file /etc/exports exist? "

        if [[ -e /etc/exports ]] ; then
           log_message "File exists."
        else
           log_message "file was not found."
           log_message "Create /etc/exports file"
           log_message "will run touch /etc/exports"
           `touch /etc/exports`

           if [[ $? -eq 1 ]] ; then
                RuleResult=1
                return
           fi
           log_message "file /etc/exports was created"
       fi

       owner=`ls -ld /etc/exports | awk '{print $3}'`
       check_and_set_file_root_owner /etc/exports

       return
}

rule_NFS_ETC_EXPORTS_Restrictions_perms()
{
        RuleResult=0
    arg_string=$*
        numb_of_args=`echo "$arg_string" | wc -w`;

        log_message "Objective : NFS Restrictions/NFS \ETC\EXPORTS Restrictionsi Exists"
        log_message "Parameters received: $arg_string"
        if_nfs_server_running
        ret_val=$?
 log_message "Checking for nfs server running :"
 if [ $ret_val -eq 1 ]
  then
        log_message "no nfs server was found running. Exiting..."
        RuleResult=1
        return
 fi
 log_message "nsf server is running"

 log_message "Does file /etc/exports exist? "
 file="/etc/exports"
 if [[ -e /etc/exports ]] ; then
        log_message "File exists."
 else
        log_message "file was not found."
        log_message "Create /etc/exports file"
        log_message "\t will run touch /etc/exports"
        `touch /etc/exports`
        if [[ $? -eq 1 ]] ; then
                RuleResult=1
                return
        fi
        log_message "file /etc/exports was created"
  fi
  var=`stat -c "%a" $file`
  acl="644"
  if [[ $var == $acl ]] ; then
     log_message "/etc/exports already having the permissions of 644 "
  else
     log_message "Current permisions are $var... Setting permissions to 644 on /etc/exports ... "
      $(chmod 644 /etc/exports )
      if [ $? -eq 1 ] ; then
           log_message "Failure to set permission to 644. "
           RuleResult=1
           return
       else
            log_message "Setting permissions to 644 on /etc/exports done."
      fi
  fi

  log_message "IMPORTANT !!! IMPORTANT !!!"
  log_message "Manually ensure confidential data is exported securely via /etc/exports"
  return
}

#<cdf:title>NFS Restrictions/NFS \ETC\EXPORTS Restrictions</cdf:title>
#<ruleName>ETC_EXPORTS_Restrictions</ruleName>
#<cdf:description>If NFS server is installed and running, /etc/exports must exist and must be owned by root and have 0644 permissions.</cdf:description>
#<scm:violationMessage>/etc/exports {1} and NFS is running: {2}</scm:violationMessage>
rule_ETC_EXPORTS_Restrictions()
{
     RuleResult=0
     arg_string=$*
     numb_of_args=`echo "$arg_string" | wc -w`;

     log_message "Objective : NFS Restrictions/NFS \ETC\EXPORTS Restrictions"
     log_message "Parameters received: $arg_string"
	 
     if_nfs_server_running
     ret_val=$?
	 
     log_message "Checking for nfs server running :"
     if [ $ret_val -eq 1 ]
     then
        log_message "no nfs server was found running. Exiting..."
        RuleResult=1
        return
     fi
     log_message "nfs server is running"
	 
	 file="/etc/exports"
	 
	 if [ -f $file ]
	 then
	     log_message "File $file Exists. Checking file permissions.."
		 var=`stat -c "%a" $file`
         acl="644"
         if [[ $var == $acl ]] ; then
             log_message "/etc/exports already having the permissions of 644 "
         else
             log_message "Current permisions are $var... Setting permissions to 644 on /etc/exports ... "
             chmod 644 $file
			 if [ $? -eq 1 ] ; then
			    log_message "Failure to set permission to 644. "
				RuleResult=1
				return
			 else
			 	log_message "Setting permissions to 644 on /etc/exports done."
			 fi
          fi 	 
	 else
	     create_files_with_permisions $file "644"
	 fi
	 
	 owner=`ls -ld /etc/exports | awk '{print $3}'`
     check_and_set_file_root_owner $file

     return	 
}

rule_TFTP_Required_Startup_Options_inetd()
{
	#arg_string=$*
	#log_message "Rule: 1.5 Network Settings/TFTP Required Startup Options_inetd" 
	#log_message "Parameters received: $arg_string"

	RuleResult=0
	tftp_str="tftp    dgram   udp6    wait    root    /usr/sbin/in.tftpd      in.tftpd -s /tftpboot" 	
	file="/etc/inetd.conf"

	if [[ -e "$file" ]] ; then
	   log_message "File $file exists"
	else
	   log_message "file $file was not found. Creating it..."
	   create_files_with_permisions "$file" 644
	fi
 
	str=`cat "$file" | grep -e "tftpboot"`
        
	if [[ "$str" == "" ]] ; then
		log_message "File $file doesn't contains server_args with -s. Adding it..."
		echo $tftp_str >> $file
		if [[ $? -eq 1 ]] ; then
			RuleResult=1
			log_message "Configuration settings server_args with -s failed to update"
			return
		 else
			log_message "Configuration settings server_args with -s added"
		 fi 
	else 
		if echo -e $str | grep "tftp" | grep -e "-s /tftpboot" 1> /dev/null 2>&1; then
			log_message "File $file already contains -s server_args"
		elif echo -e $str | grep -e " s " 1> /dev/null 2>&1; then
 			tmpfile="/tmp/tst_$$"
			sed -e 's/ s / -s /' $file > $tmpfile
			 if [[ $? -eq 1 ]] ; then
			     RuleResult=1
				 log_message "File $file is not updated with -s server_args"
			 else
			     log_message "File $file updated with -s server_args"
			 fi
			 if [ -e $tmpfile ]; then
					mv -f $tmpfile $file
			 fi
		elif echo -e $str | grep "tftp" | grep -e " - " 1> /dev/null 2>&1; then
		 	 tmpfile2="/tmp/tst2_$$"
			 sed -e 's/ - / -s /' $file > $tmpfile2
			 if [[ $? -eq 1 ]] ; then
			    RuleResult=1
			    log_message "File $file is not updated with -s server_args"
			 else
			    log_message "File $file updated with -s server_args"
			 fi
			 if [ -e $tmpfile2 ]; then
				mv -f $tmpfile2 $file
			 fi
		else
			 tmpfile1="/tmp/tst1_$$"
		     sed -e 's/\/tftpboot/-s \/tftpboot/' $file > $tmpfile1
		     if [[ $? -eq 1 ]] ; then
			     RuleResult=1
			     log_message "File $file is not updated with -s server_args"
		     else
			     log_message "File $file updated with -s server_args"
		     fi  
		     if [ -e $tmpfile1 ]; then
				mv -f $tmpfile1 $file
		     fi
		fi
	fi

   return $RuleResult
}

rule_TFTP_Required_Startup_Options_xinetd()
{
	#arg_string=$*
	#log_message "Rule: 1.5 Network Settings/TFTP Required Startup Options_xinetd"
	#log_message "Parameters received: $arg_string"	
	RuleResult=0
		
	file="/etc/xinetd.conf"

	if [[ -e "$file" ]] ; then
	   log_message "File $file exists"
	else
	   create_files_with_permisions "$file" 644
	fi
	   
	declare -A server_arg
		server_arg[socket_type]="dgram"
		server_arg[protocol]="udp"
		server_arg[wait]="yes"
		server_arg[user]="root"
		server_arg[server]="/usr/sbin/in.tftpd"
		server_arg[server_args]="-s /tftpboot"
		server_arg[disable]="yes"
		server_arg[per_source]="11"
		server_arg[cps]="100 2"
		server_arg[flags]="IPv4"

	tftp_str=`cat $file | grep "service tftp"`
	tmp_str=`cat $file | grep "server_args"`
	
	if [[ $tftp_str == "" ]] ; then
		  echo "service tftp" >> $file
		  echo "{" >> $file
		   for args in "${!server_arg[@]}"; do
			   log_message "File $file doesn't contains TFTP xinted configuration string"
			  echo "      $args     =     ${server_arg["$args"]}" >> $file
			   if [[ $? -eq 1 ]] ; then
				  RuleResult=1
				  log_message "TFTP xinted configuration string failed to update"
				  return
			   else
				  log_message "TFTP xinted configuration string $args = ${server_arg["$args"]} added"
			   fi
		   done
		  echo "}" >> $file             
	else
		if cat $file | grep "server_args" | grep -e "-s" | grep -e "/tftpboot" ; then
		     log_message "File /etc/xinetd.conf already contains -s server_args"
		     return
		elif cat $file | grep "server_args" | cut -d= -f2 | grep -e "s" | grep -e "/tftpboot" ; then
		      tmpfile1="tmp1$$"
			  t=`cat $file | grep "server_args"`
			  t1="server_args = -s /tftpboot"
			  $(cat $file | sed "s|$t|$t1|" > $tmpfile1 )
		      if [[ $? -eq 1 ]] ; then
			     log_message "File $file is not updated with -s server_args"
			      RuleResult=1
		      else
			     log_message "File $file updated with -s server_args"
		      fi
		      mv -f $tmpfile1 $file            
       elif cat $file | grep "server_args" | cut -d= -f2 | grep -e " - " | grep -e "/tftpboot" ; then
	          tmpfile2="tmp2$$"
			  t=`cat $file | grep "server_args"`
			  t1="server_args = -s /tftpboot"
			  $(cat $file | sed "s|$t|$t1|" > $tmpfile2 )
		      if [[ $? -eq 1 ]] ; then
			     log_message "File $file is not updated with -s server_args"			   
				 RuleResult=1 
		      else
			     log_message "File $file updated with -s server_args"
		      fi
		      mv -f $tmpfile2 $file            		  
	   else
		      tmpfile="/tmp/tmp$$"
		      `sed -e 's/\/tftpboot/-s \/tftpboot/g' $file > $tmpfile`
		      if [[ $? -eq 1 ]] ; then
			     log_message "File /etc/xinetd.conf is not updated with -s server_args"
				 RuleResult=1				
		      else
			    log_message "File /etc/xinetd.conf updated with -s server_args"
		      fi
			  mv -f $tmpfile $file 
	  fi
   fi
   return $RuleResult
}

#<cdf:title>TFTP Restrictions/TFTP Required Startup Options</cdf:title>
#<cdf:ruleName>TFTP_Required_Startup_Options</cdf:ruleName>
#<cdf:description>TFTP Required Startup Options: The permitted directory must be specified with the -s parameter to server_args</cdf:description>
#<scm:violationMessage>TFTP setup: the permitted directory must be specified with the &quot;-s&quot; parameter in the {1} configuration</scm:violationMessage>

rule_TFTP_Required_Startup_Options()
{
	arg_string=$*
	log_message "TFTP Restrictions/TFTP Required Startup Options : TFTP_Required_Startup_Options" 
	log_message "Parameters received: $arg_string"
	
	rule_TFTP_Required_Startup_Options_inetd
	inetd_result=$?
	rule_TFTP_Required_Startup_Options_xinetd
	xinetd_result=$?
	
	if [ $inetd_result -eq 0 -a $xinetd_result -eq 0 ];then
		RuleResult=0
	else
		RuleResult=1
	fi
	
	return
}


#--------------------------------------------------------------
#    ITSSCSD RULES NOT COVERED BY ITCS104 REMEDIATIONS
#--------------------------------------------------------------

#--------------------------------------------------------------
# Check if a file is among the following types:
# symbolic link, sockets, pipes, block special files and character special files
check_for_special_file_l_s_p_b_c()
{
	type_and_permission_string=$1
	
	case "$type_and_permission_string" in
	l*)
		result=0
		;;
	s*)
		result=0
		;;
	p*)
		result=0
		;;
	b*)
		result=0
		;;
	c*)
		result=0
		;;
	*)
		result=1
		;;
	esac
		
	return $result
}

#--------------------------------------------------------------
# recursively_check_directories_and_files_for_others_permissions
# NOTE: we skip file types: links, sockets, pipes, block and character special files
# THIS FUNCTION IS NOW UNUSED; TO BE DELETED AFTER EXTENSIVE TESTING OF THE
# NEW FUNCTION: recursively_prevent_directories_and_files_others_write_permission
OLD_recursively_check_directories_and_files_for_others_permissions()
{
    base_directory=$1
	others_permission_mode=$2
	rejected_permission_modes_grep_expression=$3
	
	recursive_check_got_error=0
	
	# 1) check all the directories' permissions, recursively
	# Example of output of command "$FindCommand $base_directory -type d -ls":
	# 403509    4 drwxr-xr-x   2 root     root         4096 Jun  5 07:19 /usr/src/kernels/2.6.32-504.el6.x86_64/include/config/new
	log_message "Recursively checking all directories under $base_directory..."
	number_of_dir_checked=0
	# Get the current POSIX time in seconds
	previous_time_seconds=`date "+%s" 2> /dev/null | awk '{print $1}'`
	number_of_dir_to_check=`$FindCommand $base_directory -type d | wc -l | awk '{print $1}'`
	log_message "    Number of directories to check: $number_of_dir_to_check"
	# NOTE: using a file for find output and parsing does not help in performance
	$FindCommand $base_directory -type d -ls | while read -r current_directory
	do
		directory_path=`echo $current_directory | awk '{print $11}'`
		directory_permissions=`echo $current_directory | awk '{print $3}'`
		directory_others_permissions=`echo ${directory_permissions:7:3}`
		number_of_dir_checked=`expr $number_of_dir_checked + 1`
		# Get the current POSIX time in seconds
		current_time_seconds=`date "+%s" 2> /dev/null | awk '{print $1}'`
		time_elapsed_since_last_message=`expr $current_time_seconds - $previous_time_seconds`
		if [ $time_elapsed_since_last_message -gt 14 ]
		then
			log_message "    Verification still in progress, number of directories checked: $number_of_dir_checked (out of $number_of_dir_to_check)..."
			previous_time_seconds=$current_time_seconds
		fi
		# Check if others have permissions which are forbidden; if so, set the required permission passed as parameter
		echo $directory_others_permissions | grep "$rejected_permission_modes_grep_expression" 1>/dev/null 2>&1
		result=$?
		if [ $result -eq 0 ]
		then
			# Others have forbidden permissions; set the required permissions
			log_message "    Current OTHERS permission of $directory_path: $directory_others_permissions"
			log_message "    Changing OTHERS permission of $directory_path to $others_permission_mode"
			chmod o=$others_permission_mode $directory_path 2> /dev/null
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    Failed to set permissions for $directory_path (error = $result)."
				recursive_check_got_error=1
			fi
		fi
	done
	
	#2) check all the files, recursively
	log_message "Recursively checking all files under $base_directory..."
	number_of_files_checked=0
	# Get the current POSIX time in seconds
	previous_time_seconds=`date "+%s" 2> /dev/null | awk '{print $1}'`
	number_of_files_to_check=`$FindCommand $base_directory -type f | wc -l | awk '{print $1}'`
	log_message "    Number of files to check: $number_of_files_to_check"
	$FindCommand $base_directory -type f -ls | while read -r current_file
	do
		# Some file names may include white space in them, for example:
		# -rw-r--r--. 1 root root 16536 Feb 16  2007 /usr/share/doc/lpg-java-compat-1.1.0/Eclipse Public License - Version 1_0.htm
		# The output of the find command includes the escape characters (\) to handle white space:
		#   find /usr/share -type f -ls | grep Eclipse
		#   670367   20 -rw-r--r--   1 root     root        16536 Feb 16  2007 /usr/share/doc/lpg-java-compat-1.1.0/Eclipse\ Public\ License\ -\ Version\ 1_0.htm
		# So, in this case, we use cut to get the whole file name, instead of awk
		num_of_fields_in_current_file=`echo $current_file | wc -w | awk '{print $1}'`
		if [ $num_of_fields_in_current_file -gt 11 ]
		then
			# There is white space in the file name; strip the first 10 fields to isolate the complete file name including whitespace
			file_path=`echo $current_file | $CutCommand -d ' ' -f 11-$num_of_fields_in_current_file`
			# Then trim the "\" characters, which chmod cannot handle
			file_path=`echo $file_path | tr -d '\\' 2> /dev/null`
		else
			file_path=`echo $current_file | awk '{print $11}'`
		fi
		file_permissions=`echo $current_file | awk '{print $3}'`
		file_others_permissions=`echo ${file_permissions:7:3}`
		number_of_files_checked=`expr $number_of_files_checked + 1`
		# Get the current POSIX time in seconds
		current_time_seconds=`date "+%s" 2> /dev/null | awk '{print $1}'`
		time_elapsed_since_last_message=`expr $current_time_seconds - $previous_time_seconds`
		if [ $time_elapsed_since_last_message -gt 14 ]
		then
			log_message "    Verification still in progress, number of files checked: $number_of_files_checked (out of $number_of_files_to_check)..."
			previous_time_seconds=$current_time_seconds
		fi
		check_for_special_file_l_s_p_b_c $file_permissions
		result=$?
		if [ $result -ne 0 ]
		then
			# Not a special file, check it
			# Check if others have permissions which are forbidden; if so, set the required permission passed as parameter
			echo $file_others_permissions | grep "$rejected_permission_modes_grep_expression" 1>/dev/null 2>&1
			result=$?
			if [ $result -eq 0 ]
			then
				# Others have forbidden permissions; set the required permissions
				log_message "    Current OTHERS permission of $file_path: $file_others_permissions"
				log_message "    Changing OTHERS permission of $file_path to $others_permission_mode"
				chmod o=$others_permission_mode "$file_path" 2> /dev/null
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "    Failed to set permissions for $file_path (error = $result)."
					recursive_check_got_error=1
				fi
			fi
		fi
	done
	log_message "Recursive scan of $base_directory completed."
	
	return $recursive_check_got_error
}

#--------------------------------------------------------------
# recursively_prevent_directories_and_files_others_write_permission
# NOTE: we skip file types: links, sockets, pipes, block and character special files
recursively_prevent_directories_and_files_others_write_permission()
{
    base_directory=$1

	recursive_check_got_error=0
	
	# 1) check all the directories
	log_message "Recursively checking all directories under $base_directory..."
	
	$FindCommand $base_directory -type d -perm -o+w | while read -r current_directory
	do
		directory_permissions=`stat -c "%A" $current_directory | awk '{print $1}'`
		directory_others_permissions=`echo ${directory_permissions:7:3}`
		log_message "    Current OTHERS permission of $current_directory: $directory_others_permissions"
		others_permission_mode=`echo $directory_others_permissions | sed s/'w'/''/g`
		others_permission_mode=`echo $others_permission_mode | sed s/'-'/''/g`
		log_message "    Changing OTHERS permission of $current_directory to '$others_permission_mode'"
		chmod o=$others_permission_mode $current_directory 2> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "    Failed to set permissions for $current_directory (error = $result)."
			recursive_check_got_error=1
		fi
		
	done

	#2) check all the files, recursively
	log_message "Recursively checking all files under $base_directory..."
	$FindCommand $base_directory -type f -perm -o+w | while read -r current_file
	do
		
		# Check if there is white space in the file name; certain commands cannot handle that and need whitespace to be escaped with "\"
		num_of_fields_in_current_file=`echo $current_file | wc -w | awk '{print $1}'`
		if [ $num_of_fields_in_current_file -gt 1 ]
		then
			stat_file_name=`echo $current_file | sed s/' '/'\ '/g`
		else
			stat_file_name=$current_file
		fi
		
		file_permissions=`stat -c "%A" "$stat_file_name" | awk '{print $1}'`
		file_others_permissions=`echo ${file_permissions:7:3}`
		check_for_special_file_l_s_p_b_c $file_permissions
		result=$?
		if [ $result -ne 0 ]
		then
			# Not a special file, fix it
			log_message "    Current OTHERS permission of $current_file: $file_others_permissions"
			others_permission_mode=`echo $file_others_permissions | sed s/'w'/''/g`
			others_permission_mode=`echo $others_permission_mode | sed s/'-'/''/g`
			log_message "    Changing OTHERS permission of $current_file to '$others_permission_mode'"
			chmod o=$others_permission_mode "$current_file" 2> /dev/null
			result=$?
			if [ $result -ne 0 ]
			then
				log_message "    Failed to set permissions for $current_file (error = $result)."
				recursive_check_got_error=1
			fi
		fi
	done
	log_message "Recursive scan of $base_directory completed."
	
	return $recursive_check_got_error
}

#--------------------------------------------------------------
# itsscsd_rule_OSR_Directory_Restrictions from policy file:
#  <cdf:requires idref="FilePermsV2" /> 
#  <cdf:title>1.8 Protecting Resources-OSRs/OSR Directory Restrictions</cdf:title> 
#  <cdf:description>UNIX OSR directory - Settings for other on this directory must be r-x or more stringent. /etc, /opt, /usr, /var, /.</cdf:description> 
# EXCEPTIONS:
# a.text_permissions not like 'l%' and a.text_permissions not like 's%' and a.text_permissions not like 'p%'
# and a.text_permissions not like 'b%' and a.text_permissions not like 'c%'
#
# From coverage matrix:
# / : not recursive
# /var : not recursive
# /opt : not recursive
# /usr : recursive
# /etc : recursive
# Rows 119-121
# /
# OSR directory
# Settings for other on this directory must be r-x or more restrictive.
#  Note: This particular requirement is not recursive. See entries below for subdirectories
#        that do have recursive requirements for setting for other.
# /usr
# OSR directory
# Settings for other on this directory must be r-x or more restrictive.
# /etc
# OSR directory
# Settings for other on this directory must be r-x or more restrictive.
#
# Change due to defect 155854 (February 15 2016): make /opt remediation recursive also
#
# Parameters: none.
# itsscsd_rule_OSR_Directory_Restrictions()
# {
    # arg_string=$1
    # num_of_arguments=`echo "$arg_string" | wc -w`;

	# log_message "itsscsd_rule_OSR_Directory_Restrictions: OSR Directory Restrictions for /, /var, /var/log, /opt, /usr (recursive), /etc (recursive)."
	# log_message "Parameters received: $arg_string"

	# # Accepted OTHERS permission modes: r-x, r--, --x.
	# accepted_permission_modes_grep_expression="..[541]"
	# got_error=0
	
	# # 1) /
	# log_message "Checking root directory (/)..."
	# current_directory="/"
	# stat -c "%a" $current_directory | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
	# result=$?
	# if [ $result -ne 0 ]
	# then
	    # current_permission_string=`stat -c "%A" $current_directory | awk '{print $1}'`
		# current_permission_string=`echo ${current_permission_string:7:3}`
		# log_message "    Current OTHERS permission of $current_directory: $current_permission_string"
		# others_permission_mode=`echo $current_permission_string | sed s/'w'/''/g`
		# others_permission_mode=`echo $others_permission_mode | sed s/'-'/''/g`
		# log_message "    Changing OTHERS permission of $current_directory to $others_permission_mode"
		# chmod o=$others_permission_mode $current_directory 2> /dev/null
		# result=$?
		# if [ $result -ne 0 ]
		# then
			# log_message "    Failed to set permissions for $current_directory (error = $result)."
			# got_error=1
		# else
			# permission_string=`stat -c "%A" $current_directory | awk '{print $1}'`
			# log_message "    Permissions have been set to $permission_string for $current_directory."
		# fi
	# fi

	# # 2) /var
	# log_message "Checking directory /var..."
	# current_directory="/var"
	# stat -c "%a" $current_directory | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
	# result=$?
	# if [ $result -ne 0 ]
	# then
	    # current_permission_string=`stat -c "%A" $current_directory | awk '{print $1}'`
		# current_permission_string=`echo ${current_permission_string:7:3}`
		# log_message "    Current OTHERS permission of $current_directory: $current_permission_string"
		# others_permission_mode=`echo $current_permission_string | sed s/'w'/''/g`
		# others_permission_mode=`echo $others_permission_mode | sed s/'-'/''/g`
		# log_message "    Changing OTHERS permission of $current_directory to $others_permission_mode"
		# chmod o=$others_permission_mode $current_directory 2> /dev/null
		# result=$?
		# if [ $result -ne 0 ]
		# then
			# log_message "    Failed to set permissions for $current_directory (error = $result)."
			# got_error=1
		# else
			# permission_string=`stat -c "%A" $current_directory | awk '{print $1}'`
			# log_message "    Permissions have been set to $permission_string for $current_directory."
		# fi
	# fi

	# # 3) /var/log
	# log_message "Checking directory /var/log..."
	# current_directory="/var/log"
	# stat -c "%a" $current_directory | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
	# result=$?
	# if [ $result -ne 0 ]
	# then
	    # current_permission_string=`stat -c "%A" $current_directory | awk '{print $1}'`
		# current_permission_string=`echo ${current_permission_string:7:3}`
		# log_message "    Current OTHERS permission of $current_directory: $current_permission_string"
		# others_permission_mode=`echo $current_permission_string | sed s/'w'/''/g`
		# others_permission_mode=`echo $others_permission_mode | sed s/'-'/''/g`
		# log_message "    Changing OTHERS permission of $current_directory to $others_permission_mode"
		# chmod o=$others_permission_mode $current_directory 2> /dev/null
		# result=$?
		# if [ $result -ne 0 ]
		# then
			# log_message "    Failed to set permissions for $current_directory (error = $result)."
			# got_error=1
		# else
			# permission_string=`stat -c "%A" $current_directory | awk '{print $1}'`
			# log_message "    Permissions have been set to $permission_string for $current_directory."
		# fi
	# fi

	# # 4) /opt
	# # Change due to defect 155854 (February 15 2016): make /opt remediation recursive also (based on variable switch opt_remediation_recursive)
	# opt_remediation_recursive=1
	# if [ $opt_remediation_recursive -eq 0 ]
	# then
		# log_message "Checking directory /opt..."
		# current_directory="/opt"
		# stat -c "%a" $current_directory | grep "$accepted_permission_modes_grep_expression" 1>/dev/null 2>&1
		# result=$?
		# if [ $result -ne 0 ]
		# then
			# current_permission_string=`stat -c "%A" $current_directory | awk '{print $1}'`
			# current_permission_string=`echo ${current_permission_string:7:3}`
			# log_message "    Current OTHERS permission of $current_directory: $current_permission_string"
			# others_permission_mode=`echo $current_permission_string | sed s/'w'/''/g`
			# others_permission_mode=`echo $others_permission_mode | sed s/'-'/''/g`
			# log_message "    Changing OTHERS permission of $current_directory to $others_permission_mode"
			# chmod o=$others_permission_mode $current_directory 2> /dev/null
			# result=$?
			# if [ $result -ne 0 ]
			# then
				# log_message "    Failed to set permissions for $current_directory (error = $result)."
				# got_error=1
			# else
				# permission_string=`stat -c "%A" $current_directory | awk '{print $1}'`
				# log_message "    Permissions have been set to $permission_string for $current_directory."
			# fi
		# fi
	# else
		# log_message "Checking directory /opt (recursively)..."
		# base_directory="/opt"
		# recursively_prevent_directories_and_files_others_write_permission $base_directory
		# result=$?
		# if [ $result -ne 0 ]
		# then
			# got_error=1
		# fi
	# fi

	# # 5) /usr
	# log_message "Checking directory /usr (recursively)..."
	# base_directory="/usr"
	# recursively_prevent_directories_and_files_others_write_permission $base_directory
	# result=$?
	# if [ $result -ne 0 ]
	# then
		# got_error=1
	# fi

	# # 6) /etc
	# log_message "Checking directory /etc (recursively)..."
	# base_directory="/etc"
	# recursively_prevent_directories_and_files_others_write_permission $base_directory
	# result=$?
	# if [ $result -ne 0 ]
	# then
		# got_error=1
	# fi

	# RuleResult=$got_error
	# return
# }

#--------------------------------------------------------------
# recursively_prevent_both_other_write_and_any_execute_permission
# Exceptions: directories (d), socket (s), named pipe (p), block special file (b),
#  character special file (c), and symbolic link (l)
recursively_prevent_both_other_write_and_any_execute_permission()
{

	base_directory=$1
	
	got_error=0
	
	log_message "Recursively checking all files under $base_directory..."
	# 1) Get the list of files which have other-write permissions
	$FindCommand $base_directory -type f -perm -o+w | while read -r current_file
	do
		# Check if there is white space in the file name; certain commands cannot handle that and need whitespace to be escaped with "\"
		num_of_fields_in_current_file=`echo $current_file | wc -w | awk '{print $1}'`
		if [ $num_of_fields_in_current_file -gt 1 ]
		then
			stat_file_name=`echo $current_file | sed s/' '/'\ '/g`
		else
			stat_file_name=$current_file
		fi
		
		file_permissions=`stat -c "%A" "$stat_file_name" | awk '{print $1}'`
        file_permissions=`echo $file_permissions | sed s/[ST]/-/g`
        file_permissions=`echo $file_permissions | sed s/[st]/x/g`
		check_for_special_file_l_s_p_b_c $file_permissions
		result=$?
		if [ $result -ne 0 ]
		then
			# Not a special file, check if it has any execute permission
			echo $file_permissions | grep "x" 1>/dev/null 2>&1
			result=$?
			if [ $result -eq 0 ]
			then
				# This file is in violation; take out its other-write permission
				log_message "  File $current_file has both other-write and at least one execute permissions ($file_permissions)"
				file_others_permissions=`echo ${file_permissions:7:3}`
				log_message "    Current OTHERS permission of $current_file: $file_others_permissions"
				others_permission_mode=`echo $file_others_permissions | sed s/'w'/''/g`
				others_permission_mode=`echo $others_permission_mode | sed s/'-'/''/g`
				log_message "    Changing OTHERS permission of $current_file to $others_permission_mode"
				chmod o=$others_permission_mode "$current_file" 2> /dev/null
				result=$?
				if [ $result -ne 0 ]
				then
					log_message "    Failed to set permissions for $current_file (error = $result)."
					got_error=1
				fi
			fi
		fi
	done
	
	log_message "Recursive scan of $base_directory completed."
	return $got_error

}

#--------------------------------------------------------------
# itsscsd_rule_OSR_USR_LOCAL_Files_Restrictions from policy file:
#  <cdf:title>1.8 Protecting Resources-OSRs/OSR USR\LOCAL Files Restrictions</cdf:title> 
#  <cdf:description>Files in /usr/local and its subdirectories may not have both the other-write
#  and any execute permissions set. Note: directories (d), socket (s), named pipe (p), block special file (b),
#  character special file (c), and symbolic link (l) files are excluded from this requirement.</cdf:description> 
#
# Parameters: none.
itsscsd_rule_OSR_USR_LOCAL_Files_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "itsscsd_rule_OSR_USR_LOCAL_Files_Restrictions: OSR /usr/local Files Restrictions:"
	log_message "files in /usr/local and its subdirectories may not have both the other-write and any execute permissions set."
	log_message "Parameters received: $arg_string"

	recursively_prevent_both_other_write_and_any_execute_permission "/usr/local"
	result=$?

	RuleResult=$result
	return
}
 	
#--------------------------------------------------------------
# itsscsd_rule_OSR_OPT_Files_Restrictions from policy file:
#  <cdf:title>1.8 Protecting Resources-OSRs/OSR \OPT Files Restrictions</cdf:title> 
#  <cdf:description>Files /opt and its subdirectories not have both the other-write and any execute permissions set.
#  Note: directories (d), socket (s), named pipe (p), block special file (b), character special file (c), and symbolic link (l)
#  files are excluded from this requirement.</cdf:description> 
#
# Parameters: none.
itsscsd_rule_OSR_OPT_Files_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "itsscsd_rule_OSR_OPT_Files_Restrictions: OSR /opt Files Restrictions:"
	log_message "files in /opt and its subdirectories may not have both the other-write and any execute permissions set."
	log_message "Parameters received: $arg_string"

	recursively_prevent_both_other_write_and_any_execute_permission "/opt"
	result=$?

	RuleResult=$result
	return
}
 	
#--------------------------------------------------------------
# itsscsd_rule_OSR_TMP_Files_Restrictions from policy file:
#  <cdf:title>1.8 Protecting Resources-OSRs/OSR \TMP Files Restrictions</cdf:title> 
#  <cdf:description>Files in /tmp and its subdirectories may not have both the other-write and any execute permissions set.
#  Note: directories (d), socket (s), named pipe (p), block special file (b), character special file (c), and symbolic link (l)
#  files are excluded from this requirement.</cdf:description> 
#
# Parameters: none.
itsscsd_rule_OSR_TMP_Files_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "itsscsd_rule_OSR_TMP_Files_Restrictions: OSR /tmp Files Restrictions:"
	log_message "files in /tmp and its subdirectories may not have both the other-write and any execute permissions set."
	log_message "Parameters received: $arg_string"

	recursively_prevent_both_other_write_and_any_execute_permission "/tmp"
	result=$?

	RuleResult=$result
	return
}
 	
#--------------------------------------------------------------
# itsscsd_rule_OSR_VAR_Files_Restrictions from policy file:
#  <cdf:title>1.8 Protecting Resources-OSRs/OSR \VAR Files Restrictions</cdf:title> 
#  <cdf:description>Files in the /var directory and its subdirectories may not have both the other-write and any execute permissions set.
#  Note: directories (d), socket (s), named pipe (p), block special file (b), character special file (c), and symbolic link (l) files
#  are excluded from this requirement.</cdf:description> 
#
# Parameters: none.
itsscsd_rule_OSR_VAR_Files_Restrictions()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "itsscsd_rule_OSR_VAR_Files_Restrictions: OSR /var Files Restrictions:"
	log_message "files in /var and its subdirectories may not have both the other-write and any execute permissions set."
	log_message "Parameters received: $arg_string"

	recursively_prevent_both_other_write_and_any_execute_permission "/var"
	result=$?

	RuleResult=$result
	return
}
 	
#--------------------------------------------------------------
# itsscsd_rule_RC_Command_Group_Permissions from policy file:
#  <cdf:title>1.8 Protecting Resources-OSRs/RC Command Group Permissions</cdf:title> 
#<cdf:description> /etc/init.d/rc0.d, /etc/init.d/rc1.d, /etc/init.d/rc2.d, /etc/init.d/rc3.d, /etc/init.d/rc4.d, /etc/init.d/rc5.d, /etc/init.d/rc6.d, /etc/init.d/rcS.d directories -or- /etc/rc.d/rc0.d, /etc/rc.d/rc1.d, /etc/rc.d/rc2.d, /etc/rc.d/rc3.d, /etc/rc.d/rc4.d, /etc/rc.d/rc5.d, /etc/rc.d/rc6.d, /etc/rc.d/rcS.d directories. Each active entry's file/command/script executed, and all existing directories in its path must have settings for "group" of r-x or more stringent, if owned by groups considered to be default groups for general users. (users) </cdf:description>
# 
# Protection requirements for system facility entries executing with privilege authority.
# Each file which is executed as a result of links placed in this directory and all existing directories in its path 
# must have settings for "group"  of r-x or more stringent, if owned by groups considered to be default groups for general users.
# Actual files in this directory must meet the same requirement.
# IMPLEMENTATION: Satisfy the policy file.
# Arguments: none
# itsscsd_rule_RC_Command_Group_Permissions()
# {
    # arg_string=$1
    # log_message "1.8 Protecting Resources-OSRs/RC Command Group Permissions"
	# log_message "Parameters received: $arg_string"

	# RuleResult=0
	
	# i=0
	# while [ $i -lt 7 ]
	# do
		# directory="/etc/init.d/rc$i.d"
		# absoluteDirPath="$(readlink -f $directory)"
		# sub_rule_RC_Command_Group_perms_function $absoluteDirPath
		# result=$?
		# if [ $result -ne 0 ]
		# then
			# RuleResult=1			
		# fi
		# i=`expr $i + 1`
	# done
	
	# directory="/etc/init.d/rcS.d"
	# absoluteDirPath="$(readlink -f $directory)"
	# sub_rule_RC_Command_Group_perms_function $absoluteDirPath
	# result=$?
	# if [ $result -ne 0 ]
	# then
		# RuleResult=1
	# fi
	
	# i=0
	# while [ $i -lt 7 ]
	# do
		# directory="/etc/rc.d/rc$i.d"
		# absoluteDirPath="$(readlink -f $directory)"
		# sub_rule_RC_Command_Group_perms_function $absoluteDirPath
		# result=$?
		# if [ $result -ne 0 ]
		# then
			# RuleResult=1			
		# fi
		# i=`expr $i + 1`
	# done
	
	# directory="/etc/rc.d/rcS.d"
	# absoluteDirPath="$(readlink -f $directory)"
	# sub_rule_RC_Command_Group_perms_function $absoluteDirPath
	# result=$?
	# if [ $result -ne 0 ]
	# then
		# RuleResult=1
	# fi
	
	# return 
# }

#--------------------------------------------------------------
# itsscsd_rule_RC_Command_WW_Permissions from policy file:
# <cdf:title>1.8 Protecting Resources-OSRs/RC Command WW Permissions</cdf:title> 
# <cdf:description> /etc/init.d/rc0.d, /etc/init.d/rc1.d, /etc/init.d/rc2.d, /etc/init.d/rc3.d, /etc/init.d/rc4.d, /etc/init.d/rc5.d, /etc/init.d/rc6.d, /etc/init.d/rcS.d directories -or- /etc/rc.d/rc0.d, /etc/rc.d/rc1.d, /etc/rc.d/rc2.d, /etc/rc.d/rc3.d, /etc/rc.d/rc4.d, /etc/rc.d/rc5.d, /etc/rc.d/rc6.d, /etc/rc.d/rcS.d directories. Each active entry's file/command/script to be executed, and all existing directories in its path, must have settings for "other" of r-x or more stringent. </cdf:description>

# Protection requirements for system facility entries executing with privilege authority.
# Each file which is executed as a result of links placed in this directory and all existing directories in its path
# must have settings for "other"  of r-x or more stringent.
# Actual files in this directory must meet the same requirement. 
#
# IMPLEMENTATION: satisfy both the policy and the coverage matrix.
# Arguments: none
itsscsd_rule_RC_Command_WW_Permissions()
{
    arg_string=$1
    
	log_message "1.8 Protecting Resources-OSRs/RC Command WW Permissions"
	log_message "Parameters received: $arg_string"
	RuleResult=0

	i=0
	while [ $i -lt 7 ]
	do
		directory="/etc/init.d/rc$i.d"
		absoluteDirPath="$(readlink -f $directory)"
		sub_rule_RC_Command_WW_perms_function $absoluteDirPath
		result=$?
		if [ $result -ne 0 ]
		then
			RuleResult=1
		fi
		i=`expr $i + 1`
	done
	
	directory="/etc/init.d/rcS.d"
	absoluteDirPath="$(readlink -f $directory)"
	sub_rule_RC_Command_WW_perms_function $absoluteDirPath
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	fi
	
	i=0
	while [ $i -lt 7 ]
	do
		directory="/etc/rc.d/rc$i.d"
		absoluteDirPath="$(readlink -f $directory)"
		sub_rule_RC_Command_WW_perms_function $absoluteDirPath
		result=$?
		if [ $result -ne 0 ]
		then
			RuleResult=1
		fi
		i=`expr $i + 1`
	done
	
	directory="/etc/rc.d/rcS.d"
	absoluteDirPath="$(readlink -f $directory)"
	sub_rule_RC_Command_WW_perms_function $absoluteDirPath
	result=$?
	if [ $result -ne 0 ]
	then
		RuleResult=1
	fi	

	return 
}

#--------------------------------------------------------------
# itsscsd_rule_Default_UMASK_Restriction from policy file:
#<cdf:title>1.9 Protecting Resources-User Resources/Default UMASK Restriction</cdf:title>
#<ruleName>Default_UMASK_Restriction</ruleName>
#<cdf:description>Default UMASK must be x77</cdf:description>
# And from requirement coverage matrix:
#   RedHat: Configured in /etc/bashrc
#   SLES: Configured in /etc/profile.local
# Arguments:
#   this rule expects as second parameter the value to apply as umask.
itsscsd_rule_Default_UMASK_Restriction()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

    if [ $IsRedHat -eq 1 ]
	then
	    # We run on RedHat Linux
        file_to_check="/etc/bashrc" 	
	    log_message "itsscsd_rule_Default_UMASK_Restriction: RedHat Linux $file_to_check, umask definition"
	else
	    # We run on SuSE Linux
        file_to_check="/etc/profile.local" 	
	    log_message "itsscsd_rule_Default_UMASK_Restriction: SuSE Linux $file_to_check, umask definition"
	fi
	
	log_message "Parameters received: $arg_string"

   if [ $num_of_arguments -lt 2 ]
   then
		log_message "This rule expects as second parameter the value to apply as umask."
		if [ $FailIfMissingParameters -eq 1 ]
		then
		    log_message "Exiting due to missing parameter(s)..."
			RuleResult=1
			return
		fi
		# OK to use default hard-coded parameter(s)
		log_message "No 2nd parameter was received. We will use 077 as parameter."
		umask=077
	else 
		umask=`echo "$arg_string" | awk '{ print $2 }'`
		# Validate the mask: must be an octal value
		if echo $umask | grep "[^0-7"] 2>&1 > /dev/null
		then
		    log_message "The umask value is not a valid octal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi
	fi
 	
    # Verify if $file_to_check exists; if not, create it with -rw-r--r-- permissions
	if [ ! -e $file_to_check ]
	then
	    log_message "$file_to_check not found on the system. Creating it."
		echo "# Policy remediation script creating $file_to_check with minimal required information for ITCS104 compliance." > $file_to_check
		echo "#" >> $file_to_check
		chmod 0644 $file_to_check
	fi

    # Verify if $file_to_check already has the umask keyword and, if so, log the current value(s)
	# Note that there may be more than one occurrence in the file as assignments may be conditional.
    keyword_found=`grep "umask" $file_to_check | grep -v "#" | wc -l 2> /dev/null`
    if [ $keyword_found -gt 0 ]
    then
	    # umask keyword found in the file
		log_message "Found $keyword_found occurrence(s) of the keyword umask in $file_to_check:"
	    grep_output=`grep "umask" $file_to_check | grep -v "#"`
        log_message "$grep_output"
		# Replace the existing definitions by the new one in the file
		log_message "Setting umask to $umask in $file_to_check."
		replace_value_in_file_based_on_keyword $file_to_check "umask" $umask
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to set umask to $umask in $file_to_check."
			RuleResult=1
			return
		fi			
    else
		log_message "The umask definition was not found or is commented out in the file $file_to_check. Appending it at the end of the file." 
	    log_message "Setting umask to $umask."
	    echo -e "# Policy remediation script appending umask definition to $file_to_check." >> $file_to_check
		echo -e "umask $umask" >> $file_to_check
		result=$?
		if [ $result -ne 0 ]
		then
			log_message "An error occurred while attempting to append umask $umask in $file_to_check."
			RuleResult=1
			return
		fi
    fi

	# Success
	RuleResult=0
	return
}

#-----------------------------------------------------
#<cdf:title>1.5 Network Settings/Prohibit NIS YPASSWD</cdf:title>
#<ruleName>Prohibit_NIS_YPASSWD</ruleName>
#<cdf:description>UNIX - Network Information Services (NIS) System Settings (including NIS+ in NIS compatibility mode). If NIS is enabled, yppasswd daemon must be disabled</cdf:description>
#<scm:violationMessage>NIS is enabled and yppasswd daemon is running; yppasswd must be disabled when using NIS.</scm:violationMessage>
#
# If NIS(ypbind) service is running then yppasswdd daemon must be disabled.
#-----------------------------------------------------
rule_Prohibit_NIS_YPASSWD()
{
    arg_string=$1

	log_message "rule_Prohibit_NIS_YPASSWD: 1.5 Network Settings/Prohibit NIS YPASSWD"
	log_message "Parameters received: $arg_string"
    RuleResult=0
	
    ypbind_status=`service ypbind status 2>&1`
    yppasswdd_status=`service yppasswdd status 2>&1`
	
	# Check if ypbind or NIS service is running
	if echo "$ypbind_status" | grep -i "running" 2>&1 1>/dev/null
	then
		log_message "NIS/ypbind service is running"
		# Check if yppasswdd daemon is running
		if echo "$yppasswdd_status" | grep -i "running" 2>&1 1>/dev/null
		then
			log_message "yppasswdd daemon is running. Stopping it..."
			yppasswdd_stop=`service yppasswdd stop 2>&1 1>/dev/null`
			
			yppasswdd_status=`service yppasswdd status 2>&1`
			if echo "$yppasswdd_status" | grep -i "running" 2>&1 1>/dev/null
			then
				log_message "Failed to stop yppasswdd daemon. Exiting..."
				RuleResult=1				
			else
				log_message "yppasswdd daemon successfully stopped"
			fi			
		else
			log_message "yppasswdd daemon is already stopped/disabled. Remediation not Required"
		fi
	else
		log_message "NIS/ypbind service is NOT running. Remediation not Required"
	fi    
	
    return
}

#<cdf:title>1.5 Network Settings/\ETC\HOSTS.EQUIV Prohibited</cdf:title>
#<ruleName>ETC_HOSTS_EQUIV_Prohibited</ruleName>
#<cdf:description>hosts.equiv lists trusted hosts for the programs rlogin, rsh, rcp and the library routine rcmd(). Since it allows any user from a trusted host to login without a password, it should not be used as an access control mechanism.</cdf:description>
#<scm:violationMessage>/ETC/HOSTS.EQUIV must not be used as an access control mechanism</scm:violationMessage>
#
# As file /etc/hosts.equiv is used for access control mechanism, there should not be any content in the file. If file contains Plus Sign(+), List of Hostname and Users, then we need to remove them. We are also taking backup of file with name /etc/hosts.equiv.$time_stamp.
# Also, file /etc/hosts.equiv should have 600 permisions by default.
rule_ETC_HOSTS_EQUIV_Prohibited()
{
	log_message "rule_ETC_HOSTS_EQUIV_Prohibited: /etc/hosts.equiv Prohibited"
    RuleResult=0
	file="/etc/hosts.equiv"
	
	if [ ! -f "$file" ]; then
		log_message "File $file does not exist. Remediation not required"
		return
	else
		if cat $file | egrep -v "^[[:space:]]*#" 2>&1 1>/dev/null; then 
			lineNumber=`cat $file | egrep -nv "^#" | awk -F":" '{print $1}'`
			pattern=`cat $file | egrep -nv "^#" | awk -F":" '{print $2}'`
			
			for line in $lineNumber; do
				sed -i $line's/^/#/' $file
				if [ $? -eq 0 ]; then
					log_message "Remediation Successful by commenting line in file $file: $pattern"
				else
					RuleResult=1
					log_message "Remediation Failed while commenting line in file $file: $pattern"
				fi
			done
		else
			log_message "File $file is empty or all lines are commented. Remediation not required"
		fi
	fi
	
	#Get the current file permissions and set to 600 if not set already
	octal_file_permissions=`stat -c "%a" $file` 	
	if [ $octal_file_permissions -ne 600 ]; then 	
		check_and_set_file_permission $file 600
		if [ $? -eq 1 ]; then
			RuleResult=1
		fi
	else
		log_message "File $file permissions are already 600. Remediation not required"
	fi
	
	return
}

#--------------------------------------------------------------
# GENERIC INFORMATIONAL RULE FUNCTION
# This function is called by all the rules that are INFORMATIONAL only, for which
# no automated remediation is done on the system.
# Arguments: rule_ID followed by the information message.
informational_rule()
{
    arg_string=$1

	log_message "$arg_string"
	log_message "INFORMATIONAL RULE. No automated remediation is done on the system for this rule."

	RuleResult=0

	return
}

#ITSSCSD rule 1
#1.1 Password Requirements/Access via Password must be blocked.
#Access_via_Password_must_be_blocked.
#System ID's: bin, daemon, adm, lp, sync, shutdown, halt, mail, uucp, operator, games, gopher, ftp, nobody, dbus, usbmuxd, rpc, avahi-autoipd, vcsa, rtkit, 
#saslauth, postfix, avahi, ntp, apache,radvd, rpcuser, nfsnobody, qemu, haldaemon, nm-openconnect, pulse, gsanslcd, gdm, sshd, tcpdump password must not be assigned.

## Removing password for any user is critical functionality, Remediation not possible
## The sh shell has no syntax to create arrays, but Bash has the syntax (http://unix.stackexchange.com/questions/253892/syntax-error-unexpected-when-creating-an-array) array related code in this function will not work for ubuntu. 

# itsscsd_rule_Access_via_Password_must_be_blocked()
# {
    # arg_string=$*
	# log_message "itsscsd_rule_Access_via_Password_must_be_blocked: 1.1 Password Requirements/Access via Password must be blocked"
    # num_of_arguments=`echo "$arg_string" | wc -w`
	# log_message "Parameters received: $arg_string"

	# if [ $num_of_arguments -lt 2 ]; then
		# log_message "This rule expects parameter list of users whose password has to remove"
		# log_message "Exiting due to missing parameter(s)..."
		# return
	# fi
	
	# file="/etc/shadow"
	# RuleResult=0
	#Setting default file permissions to 600
	# check_and_set_file_permission $file 600

	#Getting the list of system users whose password has to remove
	# system_ids=`echo "$arg_string" | awk '{ print $2 }'`

	#Getting List in Array
	# system_ids=(${system_ids// / })

	#Reading /etc/shadow file and extracting the name of users whose passwords been set
	# string_of_passwd_set_users=$(awk 'BEGIN { FS=":" } {if($2 != "*" && $2 != "!" && $2 != "!!" && $2 != "" && $1 != "root"){ print $1,FNR }}' $file)
	#passwd_set_list=(${string_of_passwd_set_users// / })
	
	# count=0
	#Checking for the password set user is in list of system users whose password has to remove
	 # for (( user = 0; user < ${#passwd_set_list[@]}; user=user+2 ))
	 # do
		# for id in ${!system_ids[@]}
		# do
			# if echo ${system_ids[id]} | grep ${passwd_set_list[user]} 2>&1 1>/dev/null
			# then
				# index=${passwd_set_list[user+1]}
				# sed -i ${index}'s/[^:]*/*/'2 $file
		
				# if [ $? -ne 0 ];then 
					# log_message "Unable to remove password for system user: ${passwd_set_list[user]}"
					# RuleResult=1
				# fi				
				
				# log_message "For system user '${passwd_set_list[user]}' password has been removed"
				# Getting count of users whose password has been removed
				# count=$(( $count + 1 ))	
				# break
			# fi
		# done
	# done
	
	# if [ $count -eq 0 ];then
		# log_message "There are no passwords assigned to system users"
	# else
		# log_message "Password has been removed for $count system users"
	# fi

	# return			
# }

# Function Password_Control_Values will be used by rule_Password_Control_Values_Red_Hat and rule_Password_Control_Values_SLES
Password_Control_Values()
{
	file=$1
	Is_substack=0
	
	if [ $IsSUSE -eq 1 ]; then
		auth_value="common-auth"
		account_value="common-account"
		password_value="common-password"
	else
		auth_value="system-auth"
		account_value="system-auth"
		password_value="system-auth"
		if [ $RHEL5_or_later -eq 1 ]; then
			if [ "$RHEL5" = "1" -a "$file" = "/etc/pam.d/sshd" ]; then
				Is_substack=0
			elif [ $RHEL6_or_later -eq 1 -a "$file" = "/etc/pam.d/sshd" ]; then
				auth_value="password-auth"
				account_value="password-auth"
				password_value="password-auth"
				Is_substack=1
			else
				Is_substack=1				
			fi
		fi
	fi
	
	auth_string="auth       include      $auth_value"
	account_string="account    include      $account_value"
	password_string="password   include      $password_value"
	
	if [ ! -f $file ]
	then
		create_files_with_permisions $file 644
		echo -e "$auth_string \n$account_string \n$password_string" >> $file
		log_message "Successfully Inserted required settings in file $file"
		return
	fi
	
	flag=0
	types="auth account password"	# defining array of three types 

	for type in $types;  do							 # Looping over each array element i.e. $type
		variable_name=`echo $type"_value"`      # variable_name values will be : $auth_value , $account_value & password_value 
		variable_string=`echo $type"_string"`   # variable_string values will be : $auth_string, $account_string & password_string 

		# "${!variable_name}"  evaluate variables $auth_value, $account_value & $password_value
		# "${!variable_string}"  evaluate variables $auth_string, $account_string & $password_string
		
		control="$(sed -n 's/^\s*'$type'\s\s*\(include\|substack\)\s\s*'"${!variable_name}"'\s*/\1/p' "$file" | head -1 | sed 's/\s*//g')"
		if [ -n "$control" ]; then
			if [ $Is_substack -eq 1 -a "$control" = "substack" ]; then
				log_message "$type       substack     ${!variable_name} already present in file $file"
			elif [ "$control" = "include" ]; then 
				log_message "${!variable_string} already present in file $file"
			else
				log_message "\$CONTROL value must be one of 'include' or 'substack' in file $file"
			fi
		else
			echo -e "${!variable_string}" >> $file
			log_message "${!variable_string} was not present in file $file. Inserted it"
			flag=1
		fi
	done 

	if [ $flag -eq 0 ]; then
		log_message "Remediation not Required for file $file"
	else
		log_message "Remediation completed successfully for file $file"
	fi
}

# This rule exists only in ITCS104 policy file
# <cdf:title>2.1 Reusable Passwords/Password Control Values Red Hat</cdf:title>
# <ruleName>Password_Control_Values_Red_Hat</ruleName>
# <cdf:description>The files /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd, /etc/pam.d/su Must exist and include these settings:
# auth $CONTROL $PAM
# account $CONTROL $PAM
# password $CONTROL $PAM
# Note: For Red Hat 5+ $CONTROL must be one of: "include" or "substack". Exception: for /etc/pam.d/sshd on Red Har 5.* $CONTROL must be only "include"
# Note: $PAM must be "system-auth". Exception: For /etc/pam.d/sshd on Red Hat 6+ $PAM must be "password­auth"</cdf:description>
# <scm:violationMessage>File "{1}" has incorrect content. It must include these settings: {2}. {3}</scm:violationMessage>
#
#For Red Hat 5 and later for files: /etc/pam.d/login, /etc/pam.d/passwd, and /etc/pam.d/su.
# Must exist and include these settings:
# auth $CONTROL system-auth
# account $CONTROL system-auth
# password $CONTROL system-auth
#For Red Hat 5 for file:/etc/pam.d/sshd Must exist and include above settings but $CONTROL value must be "include" only
#For Red Hat 6 and later for file: /etc/pam.d/sshd, Must exist and include these settings:
# auth $CONTROL password-auth
# account $CONTROL password-auth
# password $CONTROL password-auth
# Note: $CONTROL in the above requirements must be one of "include", or "substack". 
rule_Password_Control_Values_Red_Hat()
{
	arg_string=$1
	log_message "rule_Password_Control_Values_Red_Hat: Reusable Passwords/Password Control Values Red Hat"
	log_message "Parameters received: $arg_string"
	
	file_login="/etc/pam.d/login"
	file_passwd="/etc/pam.d/passwd"
	file_sshd="/etc/pam.d/sshd"
	file_su="/etc/pam.d/su"

	if [ $IsRedHat -eq 1 ]; then
		Password_Control_Values "$file_login"
		Password_Control_Values "$file_passwd"
		Password_Control_Values "$file_sshd"
		Password_Control_Values "$file_su"
		RuleResult=0
	else
		RuleResult=2
		log_message "This is not an RedHat system. Remediation not applicable"
	fi
	
	return
}

# This rule exists only in ITCS104 policy file
# <cdf:title>2.1 Reusable Passwords/Password Control Values SLES</cdf:title>
# <ruleName>Password_Control_Values_SLES</ruleName>
# <cdf:description>The file /etc/pam.d/login Must exist and include these settings: auth include common-auth account include common-account password include common-password</cdf:description>
# <scm:violationMessage>File "{1}" has incorrect content. It must include these settings: auth include common-auth, account include common-account, password include common-password.</scm:violationMessage>
# For SLES and Debian. The files: /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
# Must exist and include these settings:
# auth     include        common-auth
# account  include        common-account
# password include        common-password
rule_Password_Control_Values_SLES()
{
	arg_string=$1
	log_message "rule_Password_Control_Values_SLES:2.1 Reusable Passwords/Password Control Values SLES"
	log_message "Parameters received: $arg_string"

	file_login="/etc/pam.d/login"
	file_passwd="/etc/pam.d/passwd"
	file_sshd="/etc/pam.d/sshd"
	file_su="/etc/pam.d/su"
	
	if [ $IsSUSE -eq 1 ]
	then
		Password_Control_Values "$file_login"
		Password_Control_Values "$file_passwd"
		Password_Control_Values "$file_sshd"
		Password_Control_Values "$file_su"
		RuleResult=0
	else
		RuleResult=2
		log_message "This is not an SuSE system. Remediation not applicable"
	fi
	
	return
}

# <cdf:title>5.2 Security & system administrative authority/Telnet Remote Root Login Restricted</cdf:title>
# <ruleName>Telnet_Remote_Root_Login_Restricted</ruleName>
# <cdf:description>Root access must be restricted to the physical console, or to a method that provides accountability to an individual. 
# Root access via telnet is controlled via the tty settings in the /etc/securetty file.</cdf:description>
#
# When root user log-in into the system using Telnet, then password transfer in plain text. So, need to restrict root login using Telnet.
# If file "/etc/securetty" does not exist or is empty, create one and put only local tty names in it i.e from tty1 to tty6.
# If file /etc/securetty exists and contains non-local tty then remove that entries. 
# To Summarise:  Remove all entries which are not equal to below list:
#  'console', 'vc/%', 'hvc%', 'xvc0', 'tty__', 'tty_', 'ttyS_', 'rsh', 'rlogin', 'rexec'
rule_Telnet_Remote_Root_Login_Restricted()
{
	arg_string=$1
	log_message "5.2 Security & system administrative authority/Telnet Remote Root Login Restricted"
	file="/etc/securetty"
	RuleResult=0
	
	if [ ! -e "$file" -o ! -s "$file" ]; then
		if [ ! -e "$file" ]; then
			touch $file
			chmod 644 $file
			if [ $? -eq 0 ] ; then 
				log_message "File $file created successfully with permissions 644"
			else 
				log_message "Failure! File $file creation failed"
				RuleResult=1
				return
			fi 
		fi
		
		for i in $(seq 1 6); do echo tty$i >> $file; done
		log_message "Inserted default local tty names(tty1 to tty6) in file $file"
	else
		lineNumbers=`egrep -nv "^console|^vc/[0-9]+|^tty[0-9]+|^hvc[0-9]+|^xvc0|^tty[0-9]+|ttyS[0-9]+|^rsh|^rlogin|^rexec|^[[:space:]]*#" $file | awk -F":" '{print $1}'`
		
		if [ "$lineNumbers" = "" ] ; then
			log_message "File $file contains only local tty names. Remediation not required"
		else
			for lineNumber in $lineNumbers ; do
				log_message "Commenting line $lineNumber as it contains non-local tty in file $file"
				sed -i ${lineNumber}'s/^/#/' $file
				if [ $? -eq 0 ] ; then
					log_message "Successfully commented line $lineNumber in file $file"
				else
					RuleResult=1
					log_message "Fail to comment line $lineNumber in file $file"
				fi
			done 
		fi
	fi
	
	return
}

#<cdf:title>Reusable Passwords/Password shadow specification</cdf:title>
#<cdf:ruleName>Password_shadow_specification</cdf:ruleName>
#<cdf:description>In /etc/shadow, password (second field) cannot be assigned the null value (::) as this would allow the id to be accessed without entering a password or using the 'empty' (null) password.</cdf:description>

# /etc/shadow file checked for user with blank password field(second column delimited by :(colon))
# If password field is blank/null then it will be replaced by !!(Double exclamation) which indicates user account is disabled or password not set. 
rule_Password_shadow_specification()
{
	arg_string=$1
	log_message "Reusable Passwords/Password shadow specification"
	
	file="/etc/shadow"
	if [ ! -e "$file" ]; then
		log_message "File $file does not exist.Remediation not possible"		
		return 
	fi
	
	usersWithNullPassword=`awk -F":" '{if ($2~/^\s+$/ || $2=="") print $1}' $file`
	if [ -z "$usersWithNullPassword" ]; then
		log_message "File $file does not contain null passwords.Remediation not required"
		RuleResult=0
	else
		log_message "File $file contains null password for following user(s) : $usersWithNullPassword"
		lineNumbersWithNullPassword=`awk -F":" '{if ($2~/^\s+$/ || $2=="") print NR}' $file`	
		
		for lineNumber in $lineNumbersWithNullPassword ; do 
			sed -i $lineNumber's/:\s*:/:!!:/1' $file
			passwordString=`sed -n $lineNumber'p' $file | awk -F":" '{print $2}'`
			usernameString=`sed -n $lineNumber'p' $file | awk -F":" '{print $1}'`
			
			if [ "$passwordString" = "!!" ]; then 				
				log_message "Successfully replaced null password for user $usernameString with '!!'"
				RuleResult=0
			else
				log_message "Failed to replace null password for user $usernameString with '!!'"
				RuleResult=1
				return
			fi 
		done
	fi	
}
# check_pam_unix_so_parameter_post_remediation() is called from sub function : Set_Password_Encryption() 
# This functions verifies remediation of rule function rule_RedHat_128_Bit_Password_Encryption_Required()
check_pam_unix_so_parameter_post_remediation()
{		
	pam_unix_parameters_after_remediation="$(sed -n $lineNumber'p' $file| awk -F"pam_unix.so" '{print $2}'| sed 's/^[ \t]*//;s/[ \t]*$//')"
	
	Is_md5_or_sha512_checksum_after_remediation="$(echo $pam_unix_parameters_after_remediation | egrep -cw '(md5|sha512)')"
	
	Is_shadow_after_remediation="$(echo $pam_unix_parameters_after_remediation | egrep -cw 'shadow')"
	
	if [ $Is_md5_or_sha512_checksum_after_remediation -eq 1 -a $Is_shadow_after_remediation -eq 1 ]; then 
		log_message "Successfully inserted parameter(s) $insertedParameter for module pam_unix.so"
		RuleResult=0
	else 
		log_message "Failed to insert parameter(s) $insertedParameter for module pam_unix.so"
		RuleResult=1		
	fi		
}
# set_Password_Encryption() function called from rule_RedHat_128_Bit_Password_Encryption_Required()  
# This function accepts filepath as argument : "/etc/pam.d/system-auth", "/etc/pam.d/passwd" & "/etc/pam.d/password-auth"(for RHEL 6+)
set_Password_Encryption()
{
	file=$1
	lineNumber=0
	log_message "Processing File $file"

	IsPam_unix=`cat "$file" | egrep -c '^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix.so'`	
	if [ $IsPam_unix -eq 0 ] ; then
		log_message "Stanza with pam_unix.so module does not exists in file $file. Appending it."		
		
		echo "password    sufficient    pam_unix.so sha512 shadow" >> $file
		if [ $? -eq 0 ];then
			log_message "Successfully appended stanza with pam_unix.so module to file $file"
			RuleResult=0			
		else
			log_message "Failed to append stanza with pam_unix.so module to file $file"
			RuleResult=1			
		fi
	else	 
		while read line; do 
			lineNumber=`expr $lineNumber + 1`
			IsPam_unix=`echo "$line" | egrep -c '^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix.so'`
			# e.g. line : password sufficient /usr/lib64/pam_unix.so
			
			if [ $IsPam_unix -ne 0 ]; then 
				pam_unix_parameters="$(echo "$line" | awk -F"pam_unix.so" '{print $2}'| sed 's/^[ \t]*//;s/[ \t]*$//')"
				if [ -z "$pam_unix_parameters" ]; then
					log_message "'shadow' and 'sha512 or md5' parameters are missing for module pam_unix.so, Remediation required"			
					sed -i $lineNumber's/pam_unix.so/pam_unix.so shadow sha512/' $file
					insertedParameter="shadow and sha512"
					check_pam_unix_so_parameter_post_remediation
				else			
					Is_md5_or_sha512_checksum="$(echo $pam_unix_parameters | egrep -cw '(md5|sha512)')"
					Is_shadow="$(echo $pam_unix_parameters | egrep -cw 'shadow')"		
									
					if [ $Is_md5_or_sha512_checksum -eq 1 ]; then
						if [ $Is_shadow -eq 1 ]; then 
							log_message "Required parameter already exists for module pam_unix.so, Remediation not required"
							RuleResult=0
							return 
						else 
							log_message "'shadow' parameter is missing for module pam_unix.so, Remediation required"				
							sed -i $lineNumber's/pam_unix.so/pam_unix.so shadow/' $file
							insertedParameter=shadow
							check_pam_unix_so_parameter_post_remediation						
						fi
					else
						if [ $Is_shadow -eq 1 ]; then
							log_message "'sha512 or md5' parameter is missing for module pam_unix.so, Remediation required"				
							sed -i $lineNumber's/pam_unix.so/pam_unix.so sha512/' $file
							insertedParameter=sha512
							check_pam_unix_so_parameter_post_remediation
						else
							log_message "'shadow' and 'sha512 or md5' parameters are missing for module pam_unix.so, Remediation required"	
							sed -i $lineNumber's/pam_unix.so/pam_unix.so shadow sha512/' $file
							insertedParameter="shadow and sha512"
							check_pam_unix_so_parameter_post_remediation
						fi				
					fi				
				fi		
			fi 
		done < $file
	fi
}

#<cdf:title>Encryption/RedHat 128 Bit Password Encryption Required</cdf:title>
#<cdf:ruleName>RedHat_128_Bit_Password_Encryption_Required</cdf:ruleName>
#<cdf:description>Passwords must be protected with 128-bit encryption through /etc/pam.d/system-auth or /etc/pam.d/passwd using "sha512 shadow" Pam setting for pam_unix.so module in password stanza. Note: It is permitted to replace "sha512" with "md5". Note: On Red Hat 6+ this setting must additionally be applyed through /etc/pam.d/password-auth</cdf:description>
#<scm:violationMessage>Passwords must be protected with 128-bit encryption {1} using "sha512 shadow" Pam setting for "pam_unix.so" module in "password" stanza. Note: It is permitted to replace "sha512" with "md5".</scm:violationMessage>

# Searched for line containg pam_unix.so in files /etc/pam.d/system-auth or /etc/pam.d/passwd for ALL RedHat versions and check /etc/pam.d/password-auth file for RHEL 6+ versions. 
# Checked for parameters "sha512 or md5" and "shadow" after pam_unix.so
# If pam_unix.so not available then no changes are required else append missing parameters next to pam_unix.so

rule_RedHat_128_Bit_Password_Encryption_Required()
{
	arg_string=$1
	log_message "Encryption/RedHat 128 Bit Password Encryption Required"
	
	if [ $IsRedHat -eq 1 ] ; then 		
		set_Password_Encryption "/etc/pam.d/system-auth"
		set_Password_Encryption "/etc/pam.d/passwd"
		if [ $RHEL6_or_later -eq 1 ] ; then				
			set_Password_Encryption "/etc/pam.d/password-auth"
		fi 
	else
		log_message "This is not a RHEL system. Remediation not applicable for this rule"
		RuleResult=2					
	fi
}

#<cdf:title>1.5 Network Settings/Prohibited SNMP Community Names</cdf:title>
#<ruleName>Prohibited_SNMP_Community_Names</ruleName>
#<cdf:description>UNIX SNMP community names public and private must not exist</cdf:description>
#<scm:violationMessage>SNMP community name prohibited: {1}, SNMP is running</scm:violationMessage>

# file /etc/snmp/snmpd.conf is checked for public or private community names 
# community name lines ending with public or private string will be commented. 

rule_Prohibited_SNMP_Community_Names()
{
	arg_string=$1
	log_message "1.5 Network Settings/Prohibited SNMP Community Names"
	log_message "Parameters received: $arg_string"
    	
	snmpdConfFile="/etc/snmp/snmpd.conf"	
	if [ ! -f "$snmpdConfFile" ]; then
		log_message "File $snmpdConfFile does not exists. Remediation not required"
		RuleResult=0
		return
	fi
	snmpd_status=`service snmpd status 2>&1`
	# Check status of snmpd service
	
	if echo "$snmpd_status" | grep -i "running" 2>&1 1>/dev/null ; then
		count=1
		public_private_found_count=0
		log_message "Processing file $snmpdConfFile.."
		log_message "Checking for existance of Private/Public SNMP community names"
		while read -r line; do
			if echo $line | egrep '.+(public|private)' 2>&1 1>/dev/null ; then 				
				alreadyCommented=`echo $line | egrep -c '^\s*#.*[public|private]'`		
				if [ $alreadyCommented -ne 1 ];	then		
					lineNeedsToBeCommented=`echo $line | egrep '*private|public' | egrep -v -c '#'`			
					if [ $lineNeedsToBeCommented -eq 1 ]; then
						log_message "Found SNMP entry:\"$line\" at line number $count.Trying to comment it..."
						public_private_found_count=`expr $public_private_found + 1`						
						sed -i "$count"'s/^/#/' $snmpdConfFile				
						commentStatus=`sed -n $count'p' $snmpdConfFile | egrep -c '^#'`
						if [ $commentStatus -ne 1 ]; then
							log_message "Failed to comment below line, Please verify:"
							log_message "\"$line\""
							RuleResult=1
							return
						else
							log_message "Successfully Commented line: \"$line\""
							RuleResult=0
						fi		
					fi				
				else		
					#log_message "Line \"$line\" is already commented."
					RuleResult=0
				fi
			fi
			count=`expr $count + 1`;
		done < $snmpdConfFile
		
		if [ $public_private_found_count -eq 0 ]; then
			log_message  "No active Private/Public SNMP community names found. Remdiation not required"
			RuleResult=0
		fi
	else
		log_message "SNMP service is not running.Remediation not Required"
		RuleResult=0
	fi	
	return
}

#--------------------------------------------------------------
# <cdf:title>Reusable Passwords/SUSE SLES Password History on SLES 10 and earlier</cdf:title>
# <ruleName>SUSE_SLES_Password_History_on_SLES_10_and_earlier</ruleName>
# <cdf:ruleName>SUSE_SLES_Password_History_on_SLES_10_and_earlier</cdf:ruleName>
# <cdf:description>Prevent reuse of passwords on SUSE SLES 10 and earlier -
# Option 1:
# password $CONTROL pam_unix2.so sha512
# password $CONTROL pam_pwcheck.so remember=8
# Option 2:
# password $CONTROL pam_unix_passwd.so remember=7 use_authtok sha512 shadow
# Additional requirements:
# sha512 remember=8 - must be in /etc/security/pam_pwcheck.conf
# password: sha512 shadow - must be in /etc/security/pam_unix2.conf
# Note: $CONTROL must be one of &quot;required&quot; or &quot;sufficient&quot;
# For more information see coverage matrix document.</cdf:description>

# sha512/md5 paramter supported.
# password <required or sufficient> pam_unix_passwd.so remember=7 use_authtok sha512 shadow
# Parameters : "remember=7 use_authtok sha512 shadow" were inserted after pam_unix_passwd.so module 

rule_SUSE_SLES_Password_History_on_SLES_10_and_earlier()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	log_message "Reusable Passwords/SUSE SLES Password History on SLES 10 and earlier"
	log_message "Parameters received: $arg_string"
	
	if [ $SUSE_10_or_earlier -eq 0 ]; then		
		log_message "This rule is applicable only for SuSE 10 or lower releases.Exiting."
		RuleResult=2
		return	
	fi
	
	if [ $num_of_arguments -lt 2 ]; then
		log_message "This rule expects as second parameter the value to apply as Minimum Password History."
		RuleResult=1
		return		
	else 
		PasswordMinHistory=`echo "$arg_string" | awk '{ print $2 }'` # 8 
		PasswordMinHistory2=`expr $PasswordMinHistory - 1`  # 8-1 = 7 For module pam_unix_passwd.so		
	fi
 	
	# Validate the parameter (must be numeric decimal)
	if echo $PasswordMinHistory | grep "[^0-9"] 2>&1 > /dev/null
	then
		log_message "The password min history value is not a valid decimal number. Please verify the parameters. Exiting."
		RuleResult=1
		return
	fi

    # IMPORTANT: THIS RULE IMPLEMENTS OPTION 2 DESCRIBED ABOVE
	# Option 2:
	# password $CONTROL pam_unix_passwd.so remember=7 use_authtok md5/sha512 shadow
	#
	# The statement must appear in /etc/pam.d/common-password, if the file exists. 
	# If /etc/pam.d/common-password does NOT exist, the statement must appear in
	#   /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
	# 
	# Additional requirements SLES:
	# md5/sha512 remember=8 must be in /etc/security/pam_pwcheck.conf 
	# password: md5/sha512 shadow must be in /etc/security/pam_unix2.conf
	# 
	# Note: $CONTROL in the following examples must be one of "required", or "sufficient".

    #  1) The statement must appear in /etc/pam.d/common-password, if the file exists. 
	file_name="/etc/pam.d/common-password"
	create_files_with_permisions "$file_name" "644"
	
	# Check that the file exists
	if [ -e $file_name ] ; then
	    log_message "Processing file $file_name..."
        enforce_SuSE_password_history_in_file $file_name $PasswordMinHistory2 "/etc/pam.d"
		result=$?
		if [ $result -ne 0 ] ; then
			log_message "An error occurred while attempting to fix the stanza in the file $file_name."
			RuleResult=1		
		else
			# Additional requirements SLES:
			# 1. md5/sha512 remember=8 must be in /etc/security/pam_pwcheck.conf 
			file_name="/etc/security/pam_pwcheck.conf"
			log_message "Additional requirement on SLES: md5/sha512 remember=8 must be in file $file_name"
			log_message "Processing file $file_name..."
			if [ -e $file_name ] ; then
				egrep "^[[:space:]]*(md5|sha512)[[:space:]]+remember=$PasswordMinHistory" $file_name | egrep -v "#" 1> /dev/null 2>&1
				result=$?
				if [ $result -eq 0 ] ; then
					log_message "Line [md5/sha512 remember=$PasswordMinHistory] already exists in file $file_name"
				else
					log_message "Appending line [md5/sha512 remember=$PasswordMinHistory] to the file $file_name"
					echo "# Linux ITCS104 remediation script appending line [md5/sha512 remember=$PasswordMinHistory] to the file" >> $file_name
					echo "sha512 remember=$PasswordMinHistory" >> $file_name
				fi
			else
				log_message "File $file_name not found. Creating it and inserting the line [md5/sha512 remember=$PasswordMinHistory]"
				touch $file_name
				echo "# Linux ITCS104 remediation script creating file $file_name and inserting line [md5/sha512 remember=$PasswordMinHistory] to the file" > $file_name
				echo "sha512 remember=$PasswordMinHistory" >> $file_name
			fi
			
			# 2. password: md5/sha512 shadow must be in /etc/security/pam_unix2.conf
			file_name="/etc/security/pam_unix2.conf"
			log_message "Additional requirement on SLES: password: md5/sha512 shadow must be in file $file_name"
			log_message "Processing file $file_name..."
			if [ -e $file_name ] ; then
				egrep "^[[:space:]]*password:[[:space:]]+(md5|sha512)[[:space:]]+shadow" $file_name | egrep -v "#" 1> /dev/null 2>&1
				result=$?
				if [ $result -eq 0 ] ; then
					log_message "Line [password: md5/sha512 shadow] already exists in file $file_name"
				else
					log_message "Appending line [password: md5/sha512 shadow] to the file $file_name"
					echo "# Linux ITCS104 remediation script appending line [password: sha512 shadow] to the file" >> $file_name
					echo "password: sha512 shadow" >> $file_name
				fi
			else
				log_message "File $file_name not found. Creating it and inserting the line [password: sha512 shadow]"
				touch $file_name
				echo "# Linux ITCS104 remediation script creating file $file_name and inserting line [password: md5/sha512 shadow] to the file" > $file_name
				echo "password: sha512 shadow" >> $file_name
			fi			
		fi
		RuleResult=0
		return
	fi

	# Coming here means that /etc/pam.d/common-password does not exist. Otherwise we would have exited the function already.
	log_message "File $file_name not found. Will process other files as specified in the requirements."
	log_message "List of files to process: /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su."

	# 2) If /etc/pam.d/common-password does NOT exist, the statement must appear in
	#   /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su.
	error=0
	
	filesList="/etc/pam.d/login /etc/pam.d/passwd /etc/pam.d/sshd /etc/pam.d/su"
	for file_name in $filesList
	do
		log_message "Processing file $file_name..."
		enforce_SuSE_password_history_in_file $file_name $PasswordMinHistory2 "/etc/pam.d"
		result=$?
		if [ $result -ne 0 ] ; then
			log_message "An error occurred while attempting to fix the stanza in the file $file_name."
			error=1
		fi		
	done	
	RuleResult=$error
	return
}
#--------------------------------------------------------------
# <cdf:title>Reusable Passwords/SUSE SLES Password History on SLES 11 and later</cdf:title>
# <cdf:ruleName>SUSE_SLES_Password_History_on_SLES_11_and_later</cdf:ruleName>
# <cdf:description>Prevent reuse of passwords on SLES and SUSE 11 and later -
# Option 3: password $CONTROL pam_unix2.so remember=8 use_authtok nullok
# Note: $CONTROL must be one of &quot;required&quot; or &quot;sufficient&quot;
# For more information see coverage matrix document.</cdf:description>

# Option 3 implemnted as new function below 
# password <required or sufficient> pam_unix2.so remember=8 use_authtok nullok
# Parameters : "remember=8 use_authtok nullok" were inserted after pam_unix2.so module
##This rule is removed from ITSSCSD policy.xml, for ITCS is still in policy.xml file
rule_SUSE_SLES_Password_History_on_SLES_11_and_later()
{
	arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	file_name="/etc/pam.d/common-password"
	log_message "Reusable Passwords/SUSE SLES Password History on SLES 11 and later"
	log_message "Parameters received: $arg_string"
	RuleResult=0
	
	if [ $SUSE_11_or_later -eq 0 ] ; then
		log_message "This rule is applicable only for SuSE 11 or later releases.Exiting."
		RuleResult=2
		return		
	fi
	
	if [ $num_of_arguments -lt 2 ] ; then
		log_message "This rule expects as second parameter the value to apply as Minimum Password History."
		RuleResult=1
		return		
	else 
		PasswordMinHistory=`echo "$arg_string" | awk '{ print $2 }'` # $(Password History) variable value from Policy.xml 		
	fi
	
	create_files_with_permisions "$file_name" "644"
	log_message "Processing file $file_name..."	
	
	if egrep "^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix2.so[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]*$" $file_name  1>/dev/null 2>&1 ; then 
		log_message "Line [password required pam_unix2.so remember=8 use_authtok nullok] already exists in file $file_name. Remediation Not Required."
		RuleResult=0
		return
	fi
	
	isPam_unix2=`egrep -c '^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix2.so' $file_name`
	if [ $isPam_unix2 -eq 0 ] ; then
		log_message "Required line [password $CONTROL pam_unix2.so remember=8 use_authtok nullok] is missing, Appending it..."
		echo "password        required        pam_unix2.so remember=$PasswordMinHistory use_authtok nullok" >> $file_name
		if [ $? -eq 0 ] ; then 
			log_message "Successfully appended line [password required pam_unix2.so remember=8 use_authtok nullok] to file $file_name"
			RuleResult=0			
		else
			log_message "Failed to appended line [password required pam_unix2.so remember=8 use_authtok nullok] to file $file_name"
			RuleResult=1			
		fi
	else # $isPam_unix2 1 or more 	 
		lineNumber=0
		while read line; do 
			lineNumber=`expr $lineNumber + 1`
			isPam_unix2=`echo "$line" | egrep -c '^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix2.so'`
			
			if [ $isPam_unix2 -eq 1 ] ; then				
			# Replace everything (i.e all parameters) after pam_unix2.so with required parameters
				sed -i $lineNumber"s/pam_unix2.so.*/pam_unix2.so remember=$PasswordMinHistory use_authtok nullok/" $file_name
				insertStatus="$(sed -n $lineNumber'p' $file_name | egrep -c "^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix2.so remember=$PasswordMinHistory use_authtok nullok")"
				if [ $insertStatus -eq 0 ] ; then
					log_message "Failed to insert required parameters to stanza containing pam_unix2.so module."
					RuleResult=1
				else
					log_message "Succdessfully inserted required parameters to stanza containing pam_unix2.so module."
				fi									
			fi
		done < $file_name	
	fi
}

#<cdf:title>Password Requirements/SUSE\SLES Password History on SLES and SUSE 11 and later</cdf:title>
#<cdf:ruleName>SUSE_SLES_Password_History_on_SLES_11_and_later</cdf:ruleName>
#<cdf:description>Prevent reuse of passwords on SLES and SUSE 11 and later -
#Option 3: 
#password $CONTROL  pam_unix2.so remember=8 use_authtok nullok
#</cdf:description>

# Supported $CONTROL values : sufficient or required or requisite
# If pam_unix2.so module exists in file /etc/pam.d/common-password it must contain module arguments as : remember=8 use_authtok nullok
# If pam_unix2.so module does not exist then append full line as below : 
# password        required        pam_unix2.so remember=$PasswordMinHistory use_authtok nullok
# Variable value of $(Password History) as argument is required. (Default value=8) 

itsscsd_rule_SUSE_SLES_Password_History_on_SLES_11_and_later()
{
	arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	file_name="/etc/pam.d/common-password"
	log_message "Reusable Passwords/SUSE SLES Password History on SLES 11 and later"
	log_message "Parameters received: $arg_string"
	RuleResult=0
	
	if [ $SUSE_11_or_later -eq 0 ] ; then
		log_message "This rule is applicable only for SuSE 11 or later releases.Exiting."
		RuleResult=2
		return		
	fi
	
	if [ $num_of_arguments -lt 2 ] ; then
		log_message "This rule expects as second parameter the value to apply as Minimum Password History."
		RuleResult=1
		return		
	else 
		PasswordMinHistory=`echo "$arg_string" | awk '{ print $2 }'` # $(Password History) variable value from Policy.xml 		
	fi
	
	create_files_with_permisions "$file_name" "644"
	log_message "Processing file $file_name..."	
	
	if egrep "^[[:space:]]*password[[:space:]]+(sufficient|required|requisite)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix2.so[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]*$" $file_name  1>/dev/null 2>&1 ; then 
		log_message "Line [password $CONTROL pam_unix2.so remember=8 use_authtok nullok] already exists in file $file_name. Remediation Not Required."
		RuleResult=0
		return
	fi
	
	isPam_unix2=`egrep -c '^[[:space:]]*password[[:space:]]+(sufficient|required|requisite)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix2.so' $file_name`
	if [ $isPam_unix2 -eq 0 ] ; then
		log_message "Required line [password $CONTROL pam_unix2.so remember=8 use_authtok nullok] is missing, Appending it..."
		echo "password        required        pam_unix2.so remember=$PasswordMinHistory use_authtok nullok" >> $file_name
		if [ $? -eq 0 ] ; then 
			log_message "Successfully appended line [password required pam_unix2.so remember=8 use_authtok nullok] to file $file_name"
			RuleResult=0			
		else
			log_message "Failed to appended line [password required pam_unix2.so remember=8 use_authtok nullok] to file $file_name"
			RuleResult=1			
		fi
	else # $isPam_unix2 1 or more 	 
		lineNumber=0
		while read line; do 
			lineNumber=`expr $lineNumber + 1`
			isPam_unix2=`echo "$line" | egrep -c '^[[:space:]]*password[[:space:]]+(sufficient|required|requisite)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix2.so'`
			
			if [ $isPam_unix2 -eq 1 ] ; then				
			# Replace everything (i.e all parameters) after pam_unix2.so with required parameters
				sed -i $lineNumber"s/pam_unix2.so.*/pam_unix2.so remember=$PasswordMinHistory use_authtok nullok/" $file_name
				insertStatus="$(sed -n $lineNumber'p' $file_name | egrep -c "^[[:space:]]*password[[:space:]]+(sufficient|required|requisite)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix2.so remember=$PasswordMinHistory use_authtok nullok")"			
				if [ $insertStatus -eq 0 ] ; then
					log_message "Failed to insert required parameters to stanza containing pam_unix2.so module."
					RuleResult=1
				else
					log_message "Successfully inserted required parameters to stanza containing pam_unix2.so module."
				fi									
			fi
		done < $file_name	
	fi
}

sub_rule_Debian_Password_History()
{
	file_name=$1
	password_history_value=$2
	redirection_link=$3
	failure=0
	# Check that the file exists
	if [ ! -e $file_name ]
	then
	    log_message "File $file_name not found. No action taken for this file."
		return 1
	fi
	
	# Check if the file name is a redirection; if so, use the real physical file name
	ls -l $file_name | grep "\->" 1> /dev/null
	result=$?
	if [ $result -eq 0 ]
	then
	    link_name=$file_name
	    file_name=`$ReadLinkCommand $link_name`
		echo $file_name | grep "/etc/" 1> /dev/null
		result=$?
		if [ $result -ne 0 ]
		then
		    # Path is missing in file name; add it
			file_name="$redirection_link/$file_name"
		fi
		log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
	fi
	
	# Setting module based on the operating system. 
	if [ $debian_version -ge 5 -o "$IsUbuntu" = "1" ] ; then		
		module="pam_unix.so"		
	elif [ "$debian_version" = "4" ]; then		
		module="pam_unix_passwd.so"
	else 
		log_message "Operating System is different from Debian or Ubuntu."
	fi 
		
	new_line1="password    required      $module remember=$password_history_value use_authtok sha512 shadow"
	GlobalStringArgument="$new_line1"
	log_message "Checking for the presence of the stanza [password required $module] in $file_name..."
  
    if cat $file_name |  egrep "^\s*password\s+(required|sufficient)\s+[a-zA-Z0-9\/\_]*$module\s*+remember=$password_history_value\s+use_authtok\s+(sha512|md5)\s+shadow" 1>/dev/null 2>&1 ; then
	    log_message "File $file_name contains the required password history setting.Nothing to do."
	elif cat $file_name | egrep  "^\s*password\s+(required|sufficient)\s+[a-zA-Z0-9\/\_]*$module" 1>/dev/null 2>&1 ; then
    	log_message "File $file_name does not contains the required password history setting.Remediation required.."		
		sed -i "s/$module.*/$module remember=$password_history_value use_authtok sha512 shadow/" $file_name
		if [ $? -ne 0 ] ; then
		    log_message "Error occurred while inserting password history setting."	
			failure=`expr failure + 1`	
		fi
	else
        log_message "File $file_name does not contains the required password history setting.Remediation required.."
		echo $new_line1 >> $file_name		
		if [ $? -ne 0 ] ; then
		   log_message "Error in adding required arguments of $module module."
		   failure=`expr failure + 1`
		fi				
	fi
	return $failure

}

#<cdf:title>Reusable Passwords/Debian Password History</cdf:title>
#<cdf:ruleName>Debian_Password_History</cdf:ruleName>
#<cdf:description>Prevent reuse of recently used passwords on Debian:
#&quot;password $CONTROL pam_unix.so remember=7 use_authtok sha512 shadow&quot; stanza must  appear in /etc/pam.d/common-password file. If this file does NOT exist, this statement must appear in /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su
#Note: $CONTROL must be one of &quot;required&quot;, or &quot;sufficient&quot;. It is permitted to replace &quot;sha512&quot; with &quot;md5&quot; in the settings above.</cdf:description>
#<scm:violationMessage>Incorrect Password History Setting. For more information see checks description.</scm:violationMessage>
#
#Password history settings added in /etc/pam.d/common-password file if exists else in /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su files.
rule_Debian_Password_History()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
    RuleResult=0
	
	log_message "rule_Debian_Password_History: Prevent reuse of recently used passwords on Debian"
	log_message "Parameters received: $arg_string"
    error=0
	
	# Check that we are running on RedHat
	
	if [ "$IsDebian" = "1" -o  "$IsUbuntu" = "1" ] ; then		        
		if [ $num_of_arguments -lt 2 ] ;  then
			log_message "This rule expects as second parameter the value to apply as Minimum Password History."
			if [ $FailIfMissingParameters -eq 1 ] ; then
				log_message "Exiting due to missing parameter(s)..."
				RuleResult=1
				return
			fi			
		else 
			PasswordMinHistory=`echo "$arg_string" | awk '{ print $2 }'`
		fi
		
		# Validate the parameter (must be numeric decimal)
		if echo $PasswordMinHistory | grep "[^0-9"] 2>&1 > /dev/null ; then
			log_message "The password min history value is not a valid decimal number. Please verify the parameters. Exiting."
			RuleResult=1
			return
		fi

		#  1) The statement must appear in /etc/pam.d/common-password, if the file exists. 
		file_name="/etc/pam.d/common-password"		
		# Check that the file exists		
		if [ -e $file_name ] ; 	then
			log_message "Processing file $file_name..."
			sub_rule_Debian_Password_History $file_name $PasswordMinHistory "/etc/pam.d"
			result=$?
			if [ $result -ne 0 ] ; then
				log_message "An error occurred while attempting to fix the stanza in the file $file_name."
				error=1
			fi				
		else
			log_message "File $file_name not found. Will process other files as specified in the requirements."
			filesList="/etc/pam.d/login /etc/pam.d/passwd /etc/pam.d/sshd /etc/pam.d/su"
			for arr_file in $filesList ; do				
				log_message "Processing file $file_name..."
				sub_rule_Debian_Password_History $arr_file $PasswordMinHistory "/etc/pam.d"
				result=$?
				if [ $result -ne 0 ] ;            then
					log_message "An error occurred while attempting to fix the stanza in the file $file_name."
					error=`expr error + 1 `
				fi
            done
		fi		
    else
	    log_message "This rule function can only be run on Debian/Ubuntu systems only. Exiting."
		RuleResult=2		
    fi	
	
	if [ $error -gt 0 ] ; then
		RuleResult=1
    else	
		RuleResult=0
	fi
	
	return
}

set_crypt_parameters()
{
   passwd_file=$1   
   failure=0
   
   if cat $passwd_file | grep '^\s*CRYPT_FILES\s*=\s*sha512' | grep -v '#' 2>&1 1>/dev/null ; then   
        log_message "File $passwd_file contains the required CRYPT_FILES setting. Remediation not required.."		
   else
       count=`cat $passwd_file | grep -v '#' | grep -c "^\s*CRYPT_FILES\s*="`
	   str="CRYPT_FILES=sha512"
	   if [ $count -eq 0 ] ; then
			log_message "File $passwd_file does not contains the required CRYPT_FILES setting. Remediation required.."		
			echo $str >> $passwd_file
			if [ $? -ne 0 ] ; then
			   log_message "Error occured while setting crypt file parameters.."						
			   failure=`expr failure + 1`
			fi   
	   else		
		   log_message "File $passwd_file does not contains the required CRYPT_FILES setting. Remediation required.."		
		   sed -i "s/CRYPT_FILES=.*/CRYPT_FILES=sha512/" $passwd_file
		   if [ $? -ne 0 ] ; then
			   log_message "Error occured while setting crypt file parameters.."						
			   failure=`expr failure + 1`
		   else
			   log_message "Crypt file parameters set successfully in file $passwd_file.."						
		   fi
	   fi	   
   fi
   
   if cat $passwd_file | grep '^\s*CRYPT\s*=\s*sha512' | grep -v '#' 2>&1 1>/dev/null ; then   
        log_message "File $passwd_file contains the required CRYPT setting. Remediation not required.."		
   else
       count1=`cat $passwd_file | grep -v '#' | grep -c "^\s*CRYPT\s*="`
	   str1="CRYPT=sha512"
	   if [ $count1 -eq 0 ] ; then	   
			log_message "File $passwd_file does not contains the required CRYPT setting. Remediation required.."		
			echo $str1 >> $passwd_file
			if [ $? -ne 0 ] ; then
			   log_message "Error occured while setting crypt file parameters.."						
			   failure=`expr failure + 1`
			fi   
	   else		
		   log_message "File $passwd_file does not contains the required CRYPT setting. Remediation required.."		
		   sed -i "s/CRYPT=.*/CRYPT=sha512/" $passwd_file  
		   if [ $? -ne 0 ] ; then
			   log_message "Error occured while setting crypt parameters.."						
			   failure=`expr failure + 1`
		   else
			   log_message "Crypt parameter set successfully in file $passwd_file.."						
		   fi
	   fi	   
   fi
   
   return $failure
}

#<cdf:title>Encryption/Password Encryption Required</cdf:title>
#<cdf:ruleName>Password_Encryption_Required</cdf:ruleName>
#<cdf:description>Debian: /etc/pam.d/common-password.
#Red Hat: /etc/pam.d/passwd and /etc/pam.d/system-auth.
#Additionally on Red Hat 6 and later: /etc/pam.d/password-auth.
#Must have &quot;password required|sufficient  pam_unix.so&quot; stanza with &quot;sha512 shadow&quot; options.
#Any file in /etc/pam.d containing &quot;password required|sufficient pam_unix.so&quot; stanza must carry the &quot;sha512 shadow&quot; options.
#SLES: /etc/default/passwd must have both &quot;CRYPT_FILES=sha512&quot; and &quot;CRYPT=sha512&quot; settings.</cdf:description>
#For remediation required staanza added in OS respective files
rule_Password_Encryption_Required()
{
	arg_string=$1
	log_message "Rule: Password_Encryption_Required"
	RuleResult=0
	got_error=0
	
	if [ "$IsRedHat" = "1" ] ; then 		
		set_Password_Encryption "/etc/pam.d/system-auth"
		if [ $? -ne 0 ] ; then
		    got_error=`expr got_error + 1`
		fi
		set_Password_Encryption "/etc/pam.d/passwd"
		if [ $? -ne 0 ] ; then
		    got_error=`expr got_error + 1`
		fi
		if [ $RHEL6_or_later -eq 1 ] ; then				
			set_Password_Encryption "/etc/pam.d/password-auth"
			if [ $? -ne 0 ] ; then
				got_error=`expr got_error + 1`
		    fi
		fi 
	elif [ $IsDebian -eq 1 -o $IsUbuntu -eq 1 ] ; then
	    set_Password_Encryption "/etc/pam.d/common-password" 
		if [ $? -ne 0 ] ; then
		    got_error=`expr got_error + 1`
		fi
	elif [ $IsSUSE -eq 1 ] ; then
      	set_Password_Encryption "/etc/pam.d/common-password"
		if [ $? -ne 0 ] ; then
		    got_error=`expr got_error + 1`
		fi
		set_crypt_parameters "/etc/default/passwd"
		if [ $? -ne 0 ] ; then
		    got_error=`expr got_error + 1`
		fi
	else
		log_message "This is not a Linux system. Remediation not applicable."
		RuleResult=2		        		
	fi
	
	if [ $got_error -ne 0 ] ; then
	     RuleResult=1
	else
	    RuleResult=0
	fi
	
	return
}

#--------------------------------------------------------------
#<cdf:title>System Settings/Root FTP Access Restriction</cdf:title>
#<cdf:ruleName>Root_FTP_Access_Restriction</cdf:ruleName>
#<cdf:description>Root Id must exist in file /ETC/FTPUSERS or /etc/vsftpd.ftpusers or /etc/vsftpd/ftpusers to restrict FTP access</cdf:description>
#<scm:violationMessage>Root ID must exist in /ETC/FTPUSERS or /ETC/VSFTPD.FTPUSERS or /etc/vsftpd/ftpusers to restrict FTP access</scm:violationMessage>
#For remediation root id is added in /ETC/FTPUSERS file id not exists
itsscsd_rule_Root_FTP_Access_Restriction()
{
    arg_string=$1	
	
	log_message "System Settings/Root FTP Access Restriction: rule_Root_FTP_Access_Restriction"
	log_message "Parameters received: $arg_string"
	failure=0
	
	ftp_conf_files="/etc/ftpusers /etc/vsftpd.ftpusers /etc/vsftpd/ftpusers"
	
	for conf_file in $ftp_conf_files; do 
		if [ -e $conf_file ] ; then
			log_message "Processing file \"$conf_file\""
			if cat $conf_file | egrep '^\s*root\s*$' 1>/dev/null 2>&1 ; then 
				log_message "\"root\" id is present in file \"$conf_file\". Remediation not required."
			else
				log_message "\"root\" id is missing in file \"$conf_file\". Remediation required."
				echo "root" >> $conf_file ## This will create file $conf_file if not exist and insert root id in file
				if [ $? -eq 0 ] ; then
					log_message "Successfully inserted \"root\" id in the file \"$conf_file\""					  
				else
					log_message "Failed to insert \"root\" id in the file \"$conf_file\""
					failure=`expr $failure + 1`
				fi			
			fi
		else
			if [ "$conf_file" = "/etc/vsftpd/ftpusers" ]; then 
				if [ ! -d "/etc/vsftpd" ];then 
					mkdir "/etc/vsftpd"
					if [ $? -ne 0 ] ; then
						log_message "Failed to create directory \"/etc/vsftpd\""
					fi
				fi 
			fi 
			log_message "File $conf_file does not exist! Creating it.." 
			touch "$conf_file" && chmod 600 "$conf_file"
			if [ $? -eq 0 ] ; then
				log_message "Successfully created file \"$conf_file\""
				echo "root" >> $conf_file ## This will create file $conf_file if not exist and insert root id in file
				if [ $? -eq 0 ] ; then
					log_message "Successfully inserted \"root\" id in the file \"$conf_file\""					
				else
					log_message "Failed to insert \"root\" id in the file \"$conf_file\""
					failure=`expr $failure + 1`
				fi
			else
				log_message "Failed to create file \"$conf_file\""
				failure=`expr $failure + 1`
			fi						
		fi 
	done 
	
	if [ $failure -eq 0 ];then
		RuleResult=0
	else
		RuleResult=1
	fi 
	
	return 	
}

#<cdf:title>Logging/Restrictions of pam_tally and pam_tally2</cdf:title>
#<cdf:ruleName>Restrictions_of_pam_tally_and_pam_tally2</cdf:ruleName>
#<cdf:description>For all distributions other than Red Hat, the desired module if present may be used.
#RH V5 must use pam_tally.so
#RH V6 and later must use pam_tally2.so</cdf:description>

#For remediation existence of pam_tally2.so/pam_tally.so is checked inside files of directory /etc/pam.d directory.
#If no existance of pam_tally.so or pam_tally2.so remediation not required.  
#If RHEL6 or later and pam_tally.so is used in files inside /etc/pam.d directory then it's replaced with pam_tally2.so in the file to remediate
#If RHEL5 and and pam_tally2.so is used in files inside /etc/pam.d directory then it's replaced with pam_tally.so in the file to remediate  

itsscsd_rule_Restrictions_of_pam_tally_and_pam_tally2()
{
	arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;
	failure=0

	log_message "Rule Logging/Restrictions of pam_tally and pam_tally2: Restrictions_of_pam_tally_and_pam_tally2"	

	# 1) Check that we are on RHEL 5 or newer: if not, exit
	if [  $RHEL5_or_later -eq 0 ] ;	then
	    log_message "This rule function can only be run on RedHat Linux 5 and later. Exiting."
		RuleResult=2
		return
	fi
	
	# Below count to verify if pam_tally.so or pam_tally2.so is used or not. 
	pamd_tally_count="$(egrep -R '^[[:space:]]*[a-zA-Z]+[[:space:]]+[a-zA-Z]+[[:space:]]+[a-zA-Z0-9\/\_]*(pam_tally.so|pam_tally2.so)([[:space:]]*$|[[:space:]]+.*$)' /etc/pam.d/* | wc -l)"
	
	if [ $pamd_tally_count -eq 0 ] ; then
		log_message "pam_tally.so or pam_tally2.so is not used inside any file of directory /etc/pam.d. Remediation not required"
		RuleResult=0
		return
	else 
		if [ $IsRHEL5 -eq 1 ];then
			log_message "Existing operating system is RHEL 5"
			log_message "Checking if pam_tally2.so exists instead of pam_tally.so inside files of directory /etc/pam.d ..."			
			pam_tally2_count="$(egrep -n -R '^[[:space:]]*[a-zA-Z]+[[:space:]]+[a-zA-Z]+[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally2.so([[:space:]]*$|[[:space:]]+.*$)' /etc/pam.d/* |awk -F":" '{print $1":"$2}')"			
			
			if [ ! -z "$pam_tally2_count" ];then 
				log_message "pam_tally2.so found inside files of directory /etc/pam.d. Correcting it to pam_tally.so"
				for tally2entry in $pam_tally2_count; do 
					filename="$(echo $tally2entry | awk -F":" '{print $1}')"
					lineNumToBeCommented="$(echo $tally2entry | awk -F":" '{print $2}')"
					sed -i $lineNumToBeCommented"s:pam_tally2.so:pam_tally.so:g" $filename
					if sed -n $lineNumToBeCommented'p' $filename | egrep -w "pam_tally.so" 1>/dev/null 2>&1
					then
						log_message "Successfully replaced pam_tally2.so with pam_tally.so in file $filename at line number $lineNumToBeCommented"						
					else
						log_message "Failed to replace pam_tally2.so with pam_tally.so in file $filename at line number $lineNumToBeCommented"
						failure=`expr $failure + 1`
					fi
				done
			else 
				log_message "pam_tally2.so not found inside files of directory /etc/pam.d. Nothing to do."
			fi 
		
		elif [ $RHEL6_or_later -eq 1 ];then
			log_message "Existing operating system is RH 6 and later"
			log_message "Checking if pam_tally.so exists instead of pam_tally2.so inside files of directory /etc/pam.d ..."
			pam_tally_count="$(egrep -n -R '^[[:space:]]*[a-zA-Z]+[[:space:]]+[a-zA-Z]+[[:space:]]+[a-zA-Z0-9\/\_]*pam_tally.so([[:space:]]*$|[[:space:]]+.*$)' /etc/pam.d/* |awk -F":" '{print $1":"$2}')"			
			
			if [ ! -z "$pam_tally_count" ];then 
				log_message "pam_tally.so found inside files of directory /etc/pam.d. Correcting it to pam_tally2.so"
				for tally2entry in $pam_tally_count; do 
					filename="$(echo $tally2entry | awk -F":" '{print $1}')"					
					lineNumToBeCommented="$(echo $tally2entry | awk -F":" '{print $2}')"					
					sed -i $lineNumToBeCommented's:pam_tally.so:pam_tally2.so:g' $filename
					if sed -n $lineNumToBeCommented'p' $filename | egrep -w "pam_tally2.so" 1>/dev/null 2>&1
					then
						log_message "Successfully replaced pam_tally.so with pam_tally2.so in file $filename at line number $lineNumToBeCommented"						
					else
						log_message "Failed to replace pam_tally.so with pam_tally2.so in file $filename at line number $lineNumToBeCommented"
						failure=`expr $failure + 1`
					fi
				done
			else 
				log_message "pam_tally.so not found inside files of directory /etc/pam.d. Nothing to do."
			fi 				
		else			
			log_message "This rule function can only be run on RedHat Linux 5 and later. Exiting."
			failure=`expr $failure + 1`
		fi 
	fi

	if [ $failure -eq 0 ]; then   #  0 indicates no failure while performing remediation.
		RuleResult=0
    fi
	
	return 	
	
}

# itsscsd_rule_Restrictions_of_pam_tally_and_pam_tally2()
# {
    # arg_string=$1
    # num_of_arguments=`echo "$arg_string" | wc -w`;

	# log_message "Rule Logging/Restrictions of pam_tally and pam_tally2: Restrictions_of_pam_tally_and_pam_tally2"	

	# # 1) Check that we are on RHEL 5 or newer: if not, exit
	# if [  $RHEL5_or_later -eq 0 ] ;	then
	    # log_message "This rule function can only be run on RedHat Linux 5 and later. Exiting."
		# RuleResult=2
		# return
	# fi
    	
    # rh5_str="password  required   pam_tally.so"
	# rh6_str="password  required   pam_tally2.so"
	
	# str="pam_tally.so"
	# str1="pam_tally2.so"
	
	# if [ $RHEL6_or_later -eq 1 ]
	# then
	     # check_and_insert_pam_module  "$rh6_str"  "$str1"
	# else
		 # check_and_insert_pam_module  "$rh5_str" "$str"
	# fi	
	
	# return
# }

# check_and_insert_pam_module()
# {
    # module_string=$1
	# module=$2
	
	# system_file="/etc/pam.d/system-auth"
	# password_file="/etc/pam.d/password-auth"

	# system_file_pam_tall2_count="$(cat $system_file | egrep -v '^\s*#' | egrep -cw $module)"
	# password_file_pam_tall2_count="$(cat $password_file | egrep -v '^\s*#' | egrep -cw $module)"
		
	# if [ $system_file_pam_tall2_count -gt 0 -a $password_file_pam_tall2_count -gt 0 ]; then 
		# log_message "file $system_file and $password_file contains the required module.Remediation Not Required"
		# RuleResult=0
	# elif [ $system_file_pam_tall2_count -gt 0 -a $password_file_pam_tall2_count -le 0 ]; then 
		# log_message "file $system_file contains the required module but not in $password_file.Remediation Required"           		
		# echo $module_string >> $password_file
		# if [ $? -eq 0 ] ; then
			# log_message "Successfully inserted module in file $password_file"
			# RuleResult=0
		# else
			# log_message "Error occured while inserting module in file $password_file"
		# fi
	# elif [ $system_file_pam_tall2_count -le 0 -a $password_file_pam_tall2_count -gt 0 ]; then 
		# log_message "file $password_file  contains the required module but not in file $system_file.Remediation Required"           			
		# echo $module_string >> $system_file
		# if [ $? -eq 0 ] ; then
			# log_message "Successfully inserted module in file $system_file"
			# RuleResult=0
		# else
			# log_message "Error occured while inserting module in file $system_file"
		# fi
	# else	
	   # echo $module_string >> $system_file
	   # if [ $? -eq 0 ] ; then
			# log_message "Successfully inserted module in file $system_file"
			# RuleResult=0
		# else
			# log_message "Error occured while inserting module in file $system_file"
		# fi
	   # echo $module_string >> $password_file
	   # if [ $? -eq 0 ] ; then
			# log_message "Successfully inserted module in file $password_file"
			# RuleResult=0
		# else
			# log_message "Error occured while inserting module in file $password_file"
		# fi
	# fi				
	
# }
sub_rule_SLES_Password_History()
{
	file_name=$1
	PasswordMinHistory=$2
	
	log_message "Processing file $file_name..."	
	
	error=0
	
	if egrep "^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_pwcheck.so[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]+(nullok|remember=$PasswordMinHistory|use_authtok)[[:space:]]*$" $file_name  1>/dev/null 2>&1 ; then 
		log_message "Line [password $CONTROL pam_pwcheck.so remember=8 use_authtok nullok] already exists in file $file_name. Remediation Not Required."
		RuleResult=0
		return
	fi
	
	isPam_pwcheck=`egrep -c '^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_pwcheck.so' $file_name`
	if [ $isPam_pwcheck -eq 0 ] ; then
		log_message "Required line [password $CONTROL pam_pwcheck.so remember=8 use_authtok nullok] is missing, Appending it..."
		echo "password        required        pam_pwcheck.so remember=$PasswordMinHistory use_authtok nullok" >> $file_name
		if [ $? -eq 0 ] ; then 
			log_message "Successfully appended line [password required pam_pwcheck.so remember=$PasswordMinHistory use_authtok nullok] to file $file_name"	
		else
			log_message "Failed to appended line [password required pam_pwcheck.so remember=$PasswordMinHistory use_authtok nullok] to file $file_name"
			error=`expr $error + 1`
		fi
	else # $isPam_pwcheck 1 or more 	 
		lineNumber=0
		while read line; do 
			lineNumber=`expr $lineNumber + 1`
			isPam_pwcheck=`echo "$line" | egrep -c '^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_pwcheck.so'`
			
			if [ $isPam_pwcheck -eq 1 ] ; then				
			# Replace everything (i.e all parameters) after pam_pwcheck.so with required parameters
				sed -i $lineNumber"s/pam_pwcheck.so.*/pam_pwcheck.so remember=$PasswordMinHistory use_authtok nullok/" $file_name
				insertStatus="$(sed -n $lineNumber'p' $file_name | egrep -c "^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_pwcheck.so remember=$PasswordMinHistory use_authtok nullok")"			
				if [ $insertStatus -eq 0 ] ; then
					log_message "Failed to insert required parameters to stanza containing pam_pwcheck.so module."
					error=`expr $error + 1`
				else
					log_message "Successfully inserted required parameters to stanza containing pam_pwcheck.so module."					
				fi									
			fi
		done < $file_name	
	fi

	if [ $error -gt 0 ];then
		RuleResult=1
	else
		RuleResult=0
	fi
	
	return $RuleResult
}


#<cdf:title>Password Requirements/SLES Password History</cdf:title>
#<cdf:ruleName>SLES_Password_History</cdf:ruleName>
#<cdf:description>/etc/pam.d/common-password must include one of these two settings:
#Option 1 -  Any SLES:
#password $CONTROL pam_pwcheck.so remember=8 use_authtok nullok
#Option 2  SLES 10 and earlier:
#password $CONTROL pam_unix_passwd.so remember=7 use_authtok sha512 shadow
#Note: $CONTROL must be one of "required", or "sufficient". sha512 can be replaced with md5
#For SLES 10, Option 1 or 2 must appear in /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su if /etc/pam.d/common-password does NOT #exist</cdf:description>

# Since option 1 is applicable for any SLES, it is used to Remediation. 

itsscsd_rule_SLES_Password_History()
{
    arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_SLES_Password_History : Password Requirements/SLES Password History"
	log_message "Parameters received: $arg_string"
	
	# Check that we are running on SuSE
	if [ $IsSUSE -eq 0 ] ; 	then
	    log_message "This rule function can only be run on SuSE Linux. Exiting."
		RuleResult=2
		return
	fi

    if [ $num_of_arguments -lt 2 ] ;  then
		log_message "This rule expects as second parameter the value to apply as Minimum Password History."
		log_message "Exiting due to missing parameter(s)..."
		RuleResult=1
		return	
	else 
		PasswordMinHistory=`echo "$arg_string" | awk '{ print $2 }'`
	fi
	
	error=0

	#  1) The statement must appear in /etc/pam.d/common-password, if the file exists. 
	file_name="/etc/pam.d/common-password"
	
	if [ -e $file_name ] ; 	then
	    sub_rule_SLES_Password_History $file_name $PasswordMinHistory        
		result=$?
		if [ $result -ne 0 ] ; 	then
			log_message "An error occurred while attempting to fix the stanza in the file $file_name."
			error=`expr $error + 1`			
		fi		
	else 
		if [ $SUSE_10_or_earlier -eq 1 ] ; then  # change applicable for suse10 or lower versions if /etc/pam.d/common-password file is missing. 
			log_message "File $file_name not found. Will process other files as specified in the requirements."
			log_message "List of files to process: /etc/pam.d/login, /etc/pam.d/passwd, /etc/pam.d/sshd and /etc/pam.d/su."

			filesList="/etc/pam.d/login /etc/pam.d/passwd /etc/pam.d/sshd /etc/pam.d/su"
			for file_name in $filesList
			do		
				sub_rule_SLES_Password_History $file_name $PasswordMinHistory		
				if [ $? -ne 0 ] ; then
					log_message "An error occurred while attempting to fix the stanza in the file $file_name."
					error=`expr $error + 1`
				fi		
			done					
		else 
			log_message "File $file_name not found. Remediation not required."
		fi 
	fi
	if [ $error -gt 0 ];then
		RuleResult=1
	else
		RuleResult=0
	fi
	return
}

#--------------------------------------------------------------
enforce_SuSE_password_history_in_file_modified()
{
    file_name=$1
	password_history_value=$2
	redirection_link=$3
	
    # Look in the specified file and check for the existence of any of the stanzas specified above,
	# i.e. "password required pam_unix_passwd.so" stanza and, if the first one is not found, "password sufficient pam_unix_passwd.so" stanza.
	# For any stanza found, replace its line with the values specified in the policy, except that the password min history value
	# is taken from the parameter passed to this function.
	# If none of the stanza lines is found, append the new line of the stanza to the file.
	
	# Check that the file exists
	if [ ! -e $file_name ] ; then
	    log_message "File $file_name not found. No action taken for this file."
		return 1
	fi
	# Check if the file name is a redirection; if so, use the real physical file name
	ls -l $file_name | grep "\->" 1> /dev/null
	result=$?
	if [ $result -eq 0 ] ; 	then
	    link_name=$file_name
	    file_name=`$ReadLinkCommand $link_name`
		echo $file_name | grep "/etc/" 1> /dev/null
		result=$?
		if [ $result -ne 0 ] ; 	then
		    # Path is missing in file name; add it
			file_name="$redirection_link/$file_name"
		fi
		log_message "$link_name is a link to the physical file $file_name. Will work on physical file $file_name."
	fi
	
	#create temporary file to hold only valid lines 
	tmpfile1="./test1.$$"
	egrep -v '^\s*#' $file_name | egrep -v '^#' > $tmpfile1

	var=`egrep "password\s*(required|sufficient)\s*(pam_unix_passwd.so|pam_pwcheck.so)" $tmpfile1`
	
	if echo $var | grep "required" ; then	   
	   control="required"		   
	else	   
	   control="sufficient"	   
	fi
	
	if [ $SUSE_10_or_earlier -eq 1 ] ; then	    
		GlobalStringArgument="password $control pam_unix_passwd.so remember=$password_history_value use_authtok md5 shadow"		
		str=`egrep "password\s*(required|sufficient)\s*pam_unix_passwd.so\s*remember=$password_history_value\s*use_authtok\s*(md5|sha512)\s*shadow" $tmpfile1`
	else
	    GlobalStringArgument="password $control pam_pwcheck.so remember=$password_history_value use_authtok nullok"		
		str=`egrep "password\s*(required|sufficient)\s*pam_pwcheck.so\s*remember=$password_history_value\s*use_authtok\s*nullok\s*" $tmpfile1`
	fi
	
	minlen=`cat $tmpfile1  | grep remember="$password_history_value"`
	
	tmpfile2="./test2.$$"
	
	if [ -z "$var" ] ; then 	   	    
	    log_message "Required password history value does not exists in file $file_name. Remediation Required."		
		echo  $GlobalStringArgument >> $file_name
		result=$?
		if [ $result -ne 0 ] ; 	then
			log_message "An error occurred while attempting to append the stanza to the file."
			RuleResult=1
		else
		    log_message "Required password history value set successfully in file $file_name"		
		fi		
	elif [ ! -z "$var" ] ; then	     	    
         if [ -z "$minlen" -o -z "$str" ] ; then				     
			log_message "Required password history value does not exists in file $file_name. Remediation Required."						
			sed "s/$var/$GlobalStringArgument/" $file_name >> $tmpfile2		
			mv -f  $tmpfile2 $file_name
			if [ $? -ne 0 ] ; then
			   log_message "An error occurred while transferring temporary file to file $file_name."
			   RuleResult=1
			else
			   log_message "Required password history value set successfully in file $file_name"
			fi		
		else	
		    log_message "Required password history value already exists in file $file_name. Remediation Not Required."			
		fi		
	else	    
		log_message "Required password history value already exists in file $file_name. Remediation Not Required."				
    fi
	
	rm -f $tmpfile1
	
	return
}

# <cdf:title>Encryption/RedHat 128 Bit Password Encryption Restriction</cdf:title>
# <cdf:ruleName>RedHat_128_Bit_Password_Encryption_Restriction</cdf:ruleName>
# <cdf:description>Passwords must be protected with 128-bit encryption using MD5 SHADOW Pam setting. Any file in /etc/pam.d containing password required/sufficient pam_unix.so must carry the md5 shadow options. Note: It is permitted to replace &quot;sha512&quot; with &quot;md5&quot;</cdf:description>
# <scm:violationMessage>Invalid Encryption setting for PAM Service: {1}, Module Path: {2}, Module Arguments: {3}, Is Password: {4}, Is Sufficient: {5}, Is Required: {6}. Any file in /etc/pam.d containing password required/sufficient pam_unix.so must carry the md5 shadow options. Note: It is permitted to replace &quot;sha512&quot; with &quot;md5&quot;</scm:violationMessage>

rule_RedHat_128_Bit_Password_Encryption_Restriction()
{
	arg_string=$1
	log_message "Encryption/RedHat 128 Bit Password Encryption Restriction"
	
	files_having_pam_unix="$(egrep -R '^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*pam_unix.so' /etc/pam.d | awk -F":" '{print $1}')"
	if [ $IsRedHat -eq 1 ] ; then 		
		for file in $files_having_pam_unix; do 
			set_Password_Encryption "$file"			
		done 	
	else
		log_message "This is not a RHEL system. Remediation not applicable for this rule"
		RuleResult=2					
	fi
}

# <cdf:title>Encryption/SLES and Debian 128 Bit Password Encryption Required</cdf:title>
# <cdf:ruleName>SLES_128_Bit_Password_Encryption_Required</cdf:ruleName>
# <cdf:description>SLES Passwords must be protected with 128-bit encryption using MD5(sha512) Pam setting. Default setting with use of md5(sha512) parameters to pam_unix.so, pam_unix2.so, or  pam_unix_passwd.so in the password stanza as set in /etc/pam.d/common-password is sufficient. MD5(sha512) can be globally set by specifying "CRYPT_FILES=md5" or "CRYPT_FILES=sha512" in /etc/default/passwd.</cdf:description>
# <scm:violationMessage>Passwords must be protected with 128-bit encryption requiring MD5(sha512) Pam setting in /etc/pam.d/common-password for pam_unix.so, pam_unix2.so, or  pam_unix_passwd.so. Or can be globally set by specifying "CRYPT_FILES=md5" or "CRYPT_FILES=sha512" in /etc/default/passwd.

rule_SLES_128_Bit_Password_Encryption_Required()
{
	arg_string=$1
	log_message "Encryption/SLES and Debian 128 Bit Password Encryption Required"
	
	failure=0
	
	#if [ $IsDebian -eq 1 -o $IsUbuntu -eq 1 -o 	$IsSUSE -eq 1 ]; then 
	if [ "$IsDebian" = "1" -o "$IsUbuntu" = "1" -o "$IsSUSE" = "1" ]; then 
		etc_default_passwd_file="/etc/default/passwd"
		create_files_with_permisions "$etc_default_passwd_file" "644"
		
		log_message "Attempting to remediate by setting global password encryption setting in file $etc_default_passwd_file"
		
		# Checking if CRYPT_FILES value is already set to sha512 or md5	
		if cat $etc_default_passwd_file | egrep '^\s*CRYPT_FILES\s*=\s*(sha512|md5)' 2>&1 1>/dev/null ; then   
			log_message "File $etc_default_passwd_file contains CRYPT_FILES=sha512 or CRYPT_FILES=md5. Remediation not required.."		
			
		# Checking if CRYPT_FILES value is different than sha512 or md5	
		elif cat $etc_default_passwd_file | egrep '^\s*CRYPT_FILES\s*=' 2>&1 1>/dev/null ; then
			log_message "File $etc_default_passwd_file contains different CRYPT_FILES setting. Updating it.."
			sed -i "s/^\s*CRYPT_FILES\s*=.*/CRYPT_FILES=sha512/g" $etc_default_passwd_file
			if cat $etc_default_passwd_file | egrep '^\s*CRYPT_FILES\s*=\s*(sha512|md5)' 2>&1 1>/dev/null ; then
				log_message "Successfully updated \"CRYPT_FILES=sha512\" in file $etc_default_passwd_file"
			else 
				log_message "Failed to update \"CRYPT_FILES=sha512\" in file $etc_default_passwd_file"
				failure=`expr failure + 1`
			fi 	
		else
			# Append "CRYPT_FILES=sha512" in file "/etc/default/passwd"
			log_message "File $etc_default_passwd_file does not contains the required CRYPT_FILES setting. Remediation required.."		
			echo "CRYPT_FILES=sha512" >> $etc_default_passwd_file
			if [ $? -ne 0 ] ; then
				log_message "Failed to set \"CRYPT_FILES=sha512\" in file $etc_default_passwd_file"
				failure=`expr failure + 1`
			else
				log_message "Successfully set \"CRYPT_FILES=sha512\" in file $etc_default_passwd_file"
			fi 
		fi
	else 
		log_message "This rule is applicable only for SLES,Debian and Ubuntu."
		RuleResult=2							
	fi

	if [ $failure -eq 0 ]; then   #  0 indicates no failure while performing remediation.
		RuleResult=0
    fi
	
	return 	
}

#<cdf:title>Encryption/SLES and Debian 128 Bit Password Encryption Restriction</cdf:title>
#<cdf:ruleName>SLES_128_Bit_Password_Encryption_Restriction</cdf:ruleName>
#<cdf:description>Passwords must be protected with 128-bit encryption using MD5 Pam setting.  Any file in /etc/pam.d containing Password required|sufficient must carry the md5 options for pam_unix.so, pam_unix2.so, pam_unix_passwd.so. Note: It is permitted to replace "sha512" with "md5"
#</cdf:description><scm:violationMessage>Invalid Encryption setting for PAM Service: {1}, Module Path: {2}, Module Arguments: {3}, Is Password: {4}, Is Sufficient: {5}, Is Required: {6}. Any file in /etc/pam.d containing password required/sufficient must carry the md5 options for pam_unix.so, pam_unix2.so, pam_unix_passwd.so. Note: It is permitted to replace "sha512" with "md5"

rule_SLES_128_Bit_Password_Encryption_Restriction()
{
	arg_string=$1
	log_message "Encryption/SLES and Debian 128 Bit Password Encryption Restriction"
	
	failure=0
	
	#if [ $IsDebian -eq 1 -o $IsUbuntu -eq 1 -o 	$IsSUSE -eq 1 ]; then 
	if [ "$IsSUSE" = "1" ]; then 
		etc_default_passwd_file="/etc/default/passwd"
		create_files_with_permisions "$etc_default_passwd_file" "644"
		
		log_message "Attempting to remediate by setting global password encryption setting in file $etc_default_passwd_file"
		
		# Checking if CRYPT_FILES value is already set to sha512 or md5	
		if cat $etc_default_passwd_file | egrep '^\s*CRYPT_FILES\s*=\s*(sha512|md5)' 2>&1 1>/dev/null ; then   
			log_message "File $etc_default_passwd_file contains CRYPT_FILES=sha512 or CRYPT_FILES=md5. Remediation not required.."		
			
		# Checking if CRYPT_FILES value is different than sha512 or md5	
		elif cat $etc_default_passwd_file | egrep '^\s*CRYPT_FILES\s*=' 2>&1 1>/dev/null ; then
			log_message "File $etc_default_passwd_file contains different CRYPT_FILES setting. Updating it.."
			sed -i "s/^\s*CRYPT_FILES\s*=.*/CRYPT_FILES=sha512/g" $etc_default_passwd_file
			if cat $etc_default_passwd_file | egrep '^\s*CRYPT_FILES\s*=\s*(sha512|md5)' 2>&1 1>/dev/null ; then
				log_message "Successfully updated \"CRYPT_FILES=sha512\" in file $etc_default_passwd_file"
			else 
				log_message "Failed to update \"CRYPT_FILES=sha512\" in file $etc_default_passwd_file"
				failure=`expr failure + 1`
			fi 	
		else
			# Append "CRYPT_FILES=sha512" in file "/etc/default/passwd"
			log_message "File $etc_default_passwd_file does not contains the required CRYPT_FILES setting. Remediation required.."		
			echo "CRYPT_FILES=sha512" >> $etc_default_passwd_file
			if [ $? -ne 0 ] ; then
				log_message "Failed to set \"CRYPT_FILES=sha512\" in file $etc_default_passwd_file"
				failure=`expr failure + 1`
			else
				log_message "Successfully set \"CRYPT_FILES=sha512\" in file $etc_default_passwd_file"
			fi 
		fi
	elif [ "$IsDebian" = "1" -o "$IsUbuntu" = "1" ]; then 	
		log_message "Processing files from /etc/pam.d directory..."		
		files_having_pam_unix="$(egrep -n -R '^[[:space:]]*password[[:space:]]+(sufficient|required)[[:space:]]+[a-zA-Z0-9\/\_]*(pam_unix.so|pam_unix2.so|pam_unix_passwd.so)' /etc/pam.d)"
		if [ ! -z "$files_having_pam_unix" ];then 
			tmpfile="/tmp/pamd_entries.new$$"
			
			for entry in "$files_having_pam_unix";
			do			
				echo "$entry" >> $tmpfile				
			done 
			
			while read entry
			do 
				file_in_pamd="$(echo $entry|awk -F":" '{print $1}')"
				line_number="$(echo $entry|awk -F":" '{print $2}')"
				line="$(echo $entry|awk -F":" '{print $3}')"
				module="$(echo $entry|awk -F":" '{print $3}'| awk '{print $3}')"
				line_parameters="$(echo $entry|awk -F":" '{print $3}'|awk -F'pam_unix.so|pam_unix2.so|pam_unix_passwd.so' '{print $2}')"
				
				if ! echo "$line_parameters" | egrep '(md5|sha512)' 1>/dev/null 2>&1 ; then 
					log_message "Module $module in file $file_in_pamd does not contain md5 or sha512"					
					log_message "Processing line : $line"
					sed -i $line_number"s/$module/$module sha512/1" $file_in_pamd
					if sed -n $linenumber'p' $file_in_pamd | egrep 'sha512' 1>/dev/null 2>&1 ; then
						log_message "Successfully remediated module $module entry in file $file_in_pamd by adding sha512"
					else
						log_message "Failed to update module $module entry in file $file_in_pamd with sha512"
						failure=`expr failure + 1`
					fi 
				else
					log_message "Module $module already contains md5 or sha512 parameter in file $file_in_pamd"
				fi 
			done < $tmpfile
			rm $tmpfile 1>/dev/null 2>&1 	
		else 
			log_message "No Stanzas found"
		fi 
	else 
		log_message "This rule is applicable only for SLES,Debian and Ubuntu."
		RuleResult=2							
	fi

	if [ $failure -eq 0 ]; then   #  0 indicates no failure while performing remediation.
		RuleResult=0
    fi
	
	return 	
}

#<cdf:title>NIS Restrictions/NIS Maps Prohibited</cdf:title>
#<cdf:ruleName>NIS_Maps_Prohibited</cdf:ruleName>
#<cdf:description>UNIX - NIS maps must not be used to store IBM Confidential data, including user passwords or other authentication credentials in any form. If the NIS passwd maps are used, all encrypted user passwords must be removed from the source file before the maps are generated.</cdf:description>
#<scm:violationMessage>NIS maps is used to store passwords. NIS maps must not be used to store confidential data.</scm:violationMessage>
rule_NIS_Maps_Prohibited()
{
	arg_string=$1
    num_of_arguments=`echo "$arg_string" | wc -w`;

	log_message "rule_Login_Success_or_Failure_in_syslog_conf: System access logging/Login Success or Failure in syslog.conf"
	log_message "Parameters received: $arg_string"
	
	RuleResult=0

	# Check if ypbind(NIS service) is running
	ypbind_status=`service ypbind status 2>&1`	
	if echo "$ypbind_status" | grep -i "running" 2>&1 1>/dev/null ; then
		log_message "NIS Service(ypbind) is running"
		nsswitch_file="/etc/nsswitch.conf"
		if [ -e $nsswitch_file ];then 
			log_message "Checking for IBM Confidential data, including user passwords or other authentication credentials in file $nsswitch_file"
			matched_lines="$(egrep -n '^\s*(password|passwd|shadow|group).*nis.*' "$nsswitch_file" 2>/dev/null|awk -F":" '{print $1}')"
			if [ -z "$matched_lines" ];then 
				log_message "Remediation Not Required for entries in files $nsswitch_file"							
			else			
				for line in $matched_lines; do 
					commented_line="$(sed -n $line'p' $nsswitch_file)"					
					sed -i $line's/^/#/g' $nsswitch_file
					log_message "Commented Line -> $commented_line"
				done
				post_remediation_lines="$(egrep -n '^\s*(password|passwd|shadow|group).*nis.*' "$nsswitch_file" 2>/dev/null|awk -F":" '{print $1}')"
				if [ -z "$post_remediation_lines" ];then 
					log_message "Remediation successfully completed."								
				else 
					log_message "Failed to remediate."
					RuleResult=1	
				fi 	
			fi 			
		else 
			log_message "File $nsswitch_file does not exist.Remediation Not Required."			
		fi 		
	else 
		log_message "NIS Service(ypbind) is not running.Remediation Not Required."		
	fi 
	
	return $RuleResult
}

# <cdf:title>Password Requirements/Access via Password must be blocked</cdf:title>
# <cdf:ruleName>Access_via_Password_must_be_blocked</cdf:ruleName>
# <cdf:description>System ID's:
# bin, daemon, adm, lp, sync, shutdown, halt, mail, uucp, operator, games, gopher, ftp, nobody, dbus, usbmuxd, rpc, avahi-autoipd, vcsa, rtkit, saslauth, postfix, avahi, ntp, apache, radvd, rpcuser, nfsnobody, qemu, haldaemon, nm-openconnect, pulse, gsanslcd, gdm, sshd, tcpdump password must not be assigned.</cdf:description>
# <scm:violationMessage>Password must not be assigned to UserIDs {1}</scm:violationMessage>

# <cdf:Value id="$(UserIDs Excluded Password)" scm:type="string_list">
# <cdf:description>Enter List of non-password UserIDs</cdf:description>
# <cdf:default>'rpc','avahi-autoipd','vcsa','rtkit','saslauth','postfix','bin','adm','lp','sync','shutdown','halt','mail','uucp','operator','games','gopher','ftp','nobody','dbus','usbmuxd','daemon','avahi','ntp','apache','radvd','rpcuser','nfsnobody','qemu','haldaemon','nm-openconnect','pulse','gsanslcd','gdm','sshd','tcpdump'</cdf:default>
# </cdf:Value>

# <cdf:remediation parameters="$(UserIDs Excluded Password)" disable="false">
# <cdf:description>
# Remediation blocks passwords for given list of users.
# </cdf:description>

itsscsd_rule_Access_via_Password_must_be_blocked()
{
    arg_string=$*
	num_of_arguments=`echo "$arg_string" | wc -w`;
	RuleResult=1
	
    log_message "Access_via_Password_must_be_blocked: Password Requirements/Access via Password must be blocked"
	log_message "Parameters received: $arg_string"
    
	if [ $num_of_arguments -lt 2 ] ; then
		log_message "This rule Access_via_Password expects List of non-password UserIDs."
		log_message "Exiting due to incorrect parameter(s)..."
		return
	fi

    failure=0
    
    List_of_nonpassword_UserIDs=`echo "$arg_string" | awk '{ print $2 }' | sed 's/,/ /g' | sed "s/'//g"`
	log_message "List of System ID's expected to have no password = $List_of_nonpassword_UserIDs"
    log_message "Attempting to set no password"
    for user in $List_of_nonpassword_UserIDs; do 
        log_message "Processing UserID : $user"
        # Checking if user is available
        id "$user" 1>/dev/null 2>&1
        if [ $? -eq 0 ];then
            # passwd -l testuser (for locking) passwd -u testuser (unlocking)
                # Locking password for user testuser.
                # passwd: Success
            # passwd --status testuser  --- Here its status check.
            # testuser LK 2018-12-24 1 90 7 -1 (Password locked.) --- Here LK indicates password locked. If PS then password set. 
            passwd -l "$user" 1>/dev/null 2>&1 
            if [ $? -eq 0 ];then
                log_message "Successfully set no password login for UserID : $user"
            else 
                log_message "Failed to set no password login for UserID : $user"
                failure=`expr $failure + 1`
            fi
        else
            log_message "UserID : $user does not exist. Skipping it."
        fi 
    done 
    
    if [ "$failure" -eq 0 ]; then   #  0 indicates no failure while performing remediation.
		RuleResult=0
    fi
	return
}

#================================ Rules which are covered by ITCS104 remediations. Branch to these functions. ==========================

#--------------------------------------------------------------
itsscsd_rule_Duplicate_GIDs_Forbidden()
{
#	log_message "itsscsd_rule_Duplicate_GIDs_Forbidden is satisfied by ITCS104 Duplicate_GIDs_Forbidden remediation. Branching to this ITCS104 remediation function..."
	rule_Duplicate_GIDs_Forbidden "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Duplicate_UIDs_Forbidden()
{
#	log_message "itsscsd_rule_Duplicate_UIDs_Forbidden is satisfied by ITCS104 rule_Duplicate_UIDs_Forbidden remediation. Branching to this ITCS104 remediation function..."
	rule_Duplicate_UIDs_Forbidden "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Login_Retries_REDHAT_3_and_4_and_SLES_9()
{
#	log_message "itsscsd_rule_Login_Retries_REDHAT_3_and_4_and_SLES_9 is satisfied by ITCS104 rule_Login_Retries_REDHAT_3_and_4 remediation. Branching to this ITCS104 remediation function..."
	rule_Login_Retries_REDHAT_3_and_4 "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Login_Retries_REDHAT_5_plus()
{
#	log_message "itsscsd_rule_Login_Retries_REDHAT_5_plus is satisfied by ITCS104 rule_Login_Retries_REDHAT_5_plus remediation. Branching to this ITCS104 remediation function..."
	rule_Login_Retries_REDHAT_5_plus "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Login_Retries_SLES_10_plus_and_Debian()
{
#	log_message "itsscsd_rule_Login_Retries_SLES_10_plus_and_Debian is satisfied by ITCS104 rule_Login_Retries_SLES_10_plus_and_Debian remediation. Branching to this ITCS104 remediation function..."
	rule_Login_Retries_SLES_10_plus_and_Debian "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Password_MAX_Age_etc_login_defs()
{
#	log_message "itsscsd_rule_Password_MAX_Age_etc_login_defs is satisfied by ITCS104 rule_Password_MAX_Age_login_defs remediation. Branching to this ITCS104 remediation function..."
	rule_Password_MAX_Age_login_defs "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Password_MAX_Age_shadow()
{
#	log_message "itsscsd_rule_Password_MAX_Age_shadow is satisfied by ITCS104 rule_Password_MAX_Age_shadow remediation. Branching to this ITCS104 remediation function..."
	rule_Password_MAX_Age_shadow "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Password_MIN_Age_Shadow()
{
#	log_message "itsscsd_rule_Password_MIN_Age_Shadow is satisfied by ITCS104 rule_Password_MIN_Age_Shadow remediation. Branching to this ITCS104 remediation function..."
	rule_Password_MIN_Age_Shadow "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Password_MIN_Age_login_defs()
{
#	log_message "itsscsd_rule_Password_MIN_Age_login_defs is satisfied by ITCS104 rule_Password_MIN_Age_login_defs remediation. Branching to this ITCS104 remediation function..."
	rule_Password_MIN_Age_login_defs "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Privileged_Accounts_with_Non_Expiring_Passwords()
{
#	log_message "itsscsd_rule_Privileged_Accounts_with_Non_Expiring_Passwords is satisfied by ITCS104 Privileged_Accounts_with_Non_Expiring_Passwords remediation. Branching to this ITCS104 remediation function..."
	rule_Privileged_Accounts_with_Non_Expiring_Passwords "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_RedHat_Password_History()
{
#	log_message "itsscsd_rule_RedHat_Password_History is satisfied by ITCS104 rule_RedHat_Password_History remediation. Branching to this ITCS104 remediation function..."
	rule_RedHat_Password_History "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Root_Password_Required()
{
#	log_message "itsscsd_rule_Root_Password_Required corresponds to ITCS104 rule_Root_Password_Required remediation. Branching to this ITCS104 remediation function..."
	rule_Root_Password_Required "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_SSH_PermitRootLogin_Restriction()
{
#	log_message "itsscsd_rule_SSH_PermitRootLogin_Restriction is satisfied by ITCS104 rule_SSH_PermitRootLogin_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_SSH_PermitRootLogin_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_SUSE_SLES_Password_History()
{
#	log_message "itsscsd_rule_SUSE_SLES_Password_History is satisfied by ITCS104 rule_SUSE_SLES_Password_History remediation. Branching to this ITCS104 remediation function..."
	rule_SUSE_SLES_Password_History "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Log_File_Required_tallylog_faillog()
{
#	log_message "itsscsd_rule_Log_File_Required_tallylog_faillog is satisfied by ITCS104 rule_Log_File_Required_tallylog remediation. Branching to this ITCS104 remediation function..."
	rule_Log_File_Required_tallylog "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Log_File_Restrictions()
{
#	log_message "itsscsd_rule_Log_File_Restrictions is satisfied by ITCS104 rule_Log_File_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_Log_File_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Log_Files_Required()
{
#	log_message "itsscsd_rule_Log_Files_Required is satisfied by ITCS104 rule_Log_Files_Required remediation. Branching to this ITCS104 remediation function..."
	rule_Log_Files_Required "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Login_Success_or_Failure_in_syslog_conf()
{
#	log_message "itsscsd_rule_Login_Success_or_Failure_in_syslog_conf is satisfied by ITCS104 rule_Login_Success_or_Failure_in_syslog_conf remediation. Branching to this ITCS104 remediation function..."
	rule_Login_Success_or_Failure_in_syslog_conf "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_ETC_PAM_D_OTHER_Restrictions()
{
#	log_message "itsscsd_rule_ETC_PAM_D_OTHER_Restrictions is satisfied by ITCS104 rule_ETC_PAM_D_OTHER_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_ETC_PAM_D_OTHER_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_ETC_SHADOW_Restrictions()
{
#	log_message "itsscsd_rule_ETC_SHADOW_Restrictions is satisfied by ITCS104 rule_ETC_SHADOW_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_ETC_SHADOW_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_NETRC_Restrictions()
{
#	log_message "itsscsd_rule_NETRC_Restrictions is satisfied by ITCS104 rule_NETRC_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_NETRC_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_RHOSTS_Restrictions()
{
#	log_message "itsscsd_rule_RHOSTS_Restrictions is satisfied by ITCS104 rule_RHOSTS_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_RHOSTS_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_TCP_Configuration_Files_Required()
{
#	log_message "itsscsd_rule_TCP_Configuration_Files_Required is satisfied by ITCS104 rule_TCP_Configuration_Files_Required remediation. Branching to this ITCS104 remediation function..."
	rule_TCP_Configuration_Files_Required "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_TCP_Configuration_Files_Restrictions()
{
#	log_message "itsscsd_rule_TCP_Configuration_Files_Restrictions is satisfied by ITCS104 rule_TCP_Configuration_Files_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_TCP_Configuration_Files_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_CRON_Command_Group_Permissions()
{
#	log_message "itsscsd_rule_CRON_Command_Group_Permissions is satisfied by ITCS104 rule_CRON_Command_Group_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_CRON_Command_Group_Permissions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_CRON_Command_WW_Permissions()
{
#	log_message "itsscsd_rule_CRON_Command_WW_Permissions is satisfied by ITCS104 rule_CRON_Command_WW_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_CRON_Command_WW_Permissions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_CRON_Full_Path_Restriction()
{
#	log_message "itsscsd_rule_CRON_Full_Path_Restriction is satisfied by ITCS104 rule_CRON_Full_Path_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_CRON_Full_Path_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Faillog_Permission_Restriction()
{
#	log_message "itsscsd_rule_Faillog_Permission_Restriction is satisfied by ITCS104 rule_Faillog_Permission_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_Faillog_Permission_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_IBMsinit_Permission_Restriction()
{
#	log_message "itsscsd_rule_IBMsinit_Permission_Restriction is satisfied by ITCS104 rule_IBMsinit_Permission_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_IBMsinit_Permission_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_INETD_XINETD_Command_Group_Permissions()
{
#	log_message "itsscsd_rule_INETD_XINETD_Command_Group_Permissions is satisfied by ITCS104 rule_INETD_XINETD_Command_Group_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_INETD_XINETD_Command_Group_Permissions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_INETD_XINETD_Command_WW_Permissions()
{
#	log_message "itsscsd_rule_INETD_XINETD_Command_WW_Permissions is satisfied by ITCS104 rule_INETD_XINETD_Command_WW_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_INETD_XINETD_Command_WW_Permissions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_INETD_XINETD_Full_Path_Restriction()
{
#	log_message "itsscsd_rule_INETD_XINETD_Full_Path_Restriction is satisfied by ITCS104 rule_INETD_XINETD_Full_Path_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_INETD_XINETD_Full_Path_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_INITD_Command_Group_Permissions()
{
#	log_message "itsscsd_rule_INITD_Command_Group_Permissions is satisfied by ITCS104 rule_INITD_Command_Group_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_INITD_Command_Group_Permissions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_INITD_Command_WW_Permissions()
{
#	log_message "itsscsd_rule_INITD_Command_WW_Permissions is satisfied by ITCS104 rule_INITD_Command_WW_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_INITD_Command_WW_Permissions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_INITTAB_Command_Group_Permissions()
{
#	log_message "itsscsd_rule_INITTAB_Command_Group_Permissions is satisfied by ITCS104 rule_INITTAB_Command_Group_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_INITTAB_Command_Group_Permissions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_INITTAB_Command_WW_Permissions()
{
#	log_message "itsscsd_rule_INITTAB_Command_WW_Permissions is satisfied by ITCS104 rule_INITTAB_Command_WW_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_INITTAB_Command_WW_Permissions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_INITTAB_Full_Path_Restriction()
{
#	log_message "itsscsd_rule_INITTAB_Full_Path_Restriction is satisfied by ITCS104 rule_INITTAB_Full_Path_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_INITTAB_Full_Path_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_OSR_TMP_Directory_Restrictions()
{
#	log_message "itsscsd_rule_OSR_TMP_Directory_Restrictions is satisfied by ITCS104 rule_OSR_TMP_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_OSR_TMP_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
# Rule OSR_VAR_Directory_Restrictions have been removed from policy.xml 
# itsscsd_rule_OSR_VAR_Directory_Restrictions()
# {
#	# log_message "itsscsd_rule_OSR_VAR_Directory_Restrictions is satisfied by ITCS104 rule_OSR_VAR_Restrictions remediation. Branching to this ITCS104 remediation function..."
	# rule_OSR_VAR_Restrictions "$AllArguments"
# }
#--------------------------------------------------------------
itsscsd_rule_SNMPD_CONF_Restrictions()
{
#	log_message "itsscsd_rule_SNMPD_CONF_Restrictions is satisfied by ITCS104 rule_SNMPD_CONF_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_SNMPD_CONF_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_TALLYLOG_Permission_Restriction()
{
#	log_message "itsscsd_rule_TALLYLOG_Permission_Restriction is satisfied by ITCS104 rule_TALLYLOG_Permission_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_TALLYLOG_Permission_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_ETC_SECURITY_OPASSWD_Restrictions()
{
#	log_message "itsscsd_rule_ETC_SECURITY_OPASSWD_Restrictions is satisfied by ITCS104 rule_OPASSWD_restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_OPASSWD_restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_OSR_VAR_LOG_Subdirectory_Restrictions()
{
#	log_message "itsscsd_rule_OSR_VAR_LOG_Subdirectory_Restrictions is satisfied by ITCS104 rule_OSR_VAR_LOG_Subdirectory_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_OSR_VAR_LOG_Subdirectory_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
# ITSSCSD rule OSR_VAR_TMP_Directory_Restriction has been removed from policy.xml
# itsscsd_rule_OSR_VAR_TMP_Directory_Restriction()
# {
#	# log_message "itsscsd_rule_OSR_VAR_TMP_Directory_Restriction is satisfied by ITCS104 rule_OSR_VAR_TMP_Directory_Restriction remediation. Branching to this ITCS104 remediation function..."
	# rule_OSR_VAR_TMP_Directory_Restriction "$AllArguments"
# }
#--------------------------------------------------------------
itsscsd_rule_VAR_LOG_SECURE_Restrictions()
{
#	log_message "itsscsd_rule_VAR_LOG_SECURE_Restrictions is satisfied by ITCS104 rule_VAR_LOG_SECURE_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_VAR_LOG_SECURE_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Login_defs_umask_restriction()
{
#	log_message "itsscsd_rule_Login_defs_umask_restriction is satisfied by ITCS104 rule_Login_defs_umask_restriction remediation. Branching to this ITCS104 remediation function..."
	rule_Login_defs_umask_restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_etc_csh_login_File_Restriction()
{
#	log_message "itsscsd_rule_etc_csh_login_File_Restriction is satisfied by ITCS104 rule_csh_login_File_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_csh_login_File_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_etc_profile_File_Restriction()
{
#	log_message "itsscsd_rule_etc_profile_File_Restriction is satisfied by ITCS104 rule_etc_profile_File_Restriction remediation. Branching to this ITCS104 remediation function..."
	rule_etc_profile_File_Restriction "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Business_Use_Notice_Required()
{
#	log_message "itsscsd_rule_Business_Use_Notice_Required is satisfied by ITCS104 rule_Business_Use_Notice_Required remediation. Branching to this ITCS104 remediation function..."
	rule_Business_Use_Notice_Required "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Access_Permissions_for_Directories_Accessible_via_Anonymous_FTP()
{
#	log_message "itsscsd_rule_Access_Permissions_for_Directories_Accessible_via_Anonymous_FTP is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_Access_Permissions_for_Directories_Accessible_via_Anonymous_FTP "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Configuration_of_the_BIN_Subdirectory_of_the_FTP_Account_Home_Directory()
{
#	log_message "itsscsd_rule_Configuration_of_the_BIN_Subdirectory_of_the_FTP_Account_Home_Directory is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_Configuration_of_the_BIN_Subdirectory_of_the_FTP_Account_Home_Directory "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Configuration_of_the_ETC_Subdirectory_of_the_FTP_Account_Home_Directory()
{
#	log_message "itsscsd_rule_Configuration_of_the_ETC_Subdirectory_of_the_FTP_Account_Home_Directory is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_Configuration_of_the_ETC_Subdirectory_of_the_FTP_Account_Home_Directory "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Configuration_of_the_LIB_Subdirectory_of_the_FTP_Account_Home_Directory()
{
#	log_message "itsscsd_rule_Configuration_of_the_LIB_Subdirectory_of_the_FTP_Account_Home_Directory is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_Configuration_of_the_LIB_Subdirectory_of_the_FTP_Account_Home_Directory "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_FTP_PASSWD_File_Restrictions()
{
#	log_message "itsscsd_rule_FTP_PASSWD_File_Restrictions is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_FTP_PASSWD_File_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Configuration_of_the_OTHER_Subdirectories_of_the_FTP_Account_Home_Directory()
{
#	log_message "itsscsd_rule_Configuration_of_the_OTHER_Subdirectories_of_the_FTP_Account_Home_Directory is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_Configuration_of_the_OTHER_Subdirectories_of_the_FTP_Account_Home_Directory "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_ETC_PAM_D_RSH_Restrictions()
{
#	log_message "itsscsd_rule_ETC_PAM_D_RSH_Restrictions is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_ETC_PAM_D_RSH_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_ETC_PAM_D_RLOGIN_Restrictions()
{
#	log_message "itsscsd_rule_ETC_PAM_D_RLOGIN_Restrictions is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_ETC_PAM_D_RLOGIN_Restrictions "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_Configuration_of_the_FTP_Account_Home_Directory()
{
#	log_message "itsscsd_rule_Configuration_of_the_FTP_Account_Home_Directory is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_Configuration_of_the_FTP_Account_Home_Directory "$AllArguments"
}

#--------------------------------------------------------------
itsscsd_rule_Deny_access_files_Red_Hat()
{
#	log_message "itsscsd_rule_Deny_access_files_Red_Hat is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_Deny_access_files_Red_Hat "$AllArguments"
}

#--------------------------------------------------------------
itsscsd_rule_Deny_access_files_Debian_and_SLES()
{
#	log_message "itsscsd_rule_Deny_access_files_Debian_and_SLES is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_Deny_access_files_Debian_and_SLES "$AllArguments"
}

#--------------------------------------------------------------
itsscsd_rule_FTP_Deamon_Options()
{
#	log_message "itsscsd_rule_FTP_Deamon_Options is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
	rule_FTP_Deamon_Options "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_NFS_ETC_EXPORTS_Restrictions_exists()
{
#        log_message "itsscsd_rule_NFS_ETC_EXPORTS_Restrictions_exists is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_NFS_ETC_EXPORTS_Restrictions_exists  "$AllArguments"
}
#--------------------------------------------------------------
itsscsd_rule_NFS_ETC_EXPORTS_Restrictions_owner()
{
#        log_message "itsscsd_rule_NFS_ETC_EXPORTS_Restrictions_owner is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_NFS_ETC_EXPORTS_Restrictions_owner  "$AllArguments"
}
#--------------------------------------------------------------------
itsscsd_rule_NFS_ETC_EXPORTS_Restrictions_perms()
{
#        log_message "itsscsd_rule_NFS_ETC_EXPORTS_Restrictions_perms is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_NFS_ETC_EXPORTS_Restrictions_perms  "$AllArguments"
}
#--------------------------------------------------------------------
itsscsd_rule_TFTP_Required_Startup_Options_inetd()
{
#        log_message "itsscsd_rule_TFTP_Required_Startup_Options_inetd is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_TFTP_Required_Startup_Options_inetd  "$AllArguments"
}
#--------------------------------------------------------------------
itsscsd_rule_TFTP_Required_Startup_Options_xinetd()
{
#        log_message "itsscsd_rule_TFTP_Required_Startup_Options_xinetd is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_TFTP_Required_Startup_Options_xinetd  "$AllArguments"
}
#--------------------------------------------------------------------
itsscsd_rule_Prohibit_NIS_YPASSWD()
{
#        log_message "itsscsd_rule_Prohibit_NIS_YPASSWD is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_Prohibit_NIS_YPASSWD  "$AllArguments"
}

#--------------------------------------------------------------------
itsscsd_rule_ETC_HOSTS_EQUIV_Prohibited()
{
#        log_message "itsscsd_rule_ETC_HOSTS_EQUIV_Prohibited is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_ETC_HOSTS_EQUIV_Prohibited  "$AllArguments"
}

#--------------------------------------------------------------------
itsscsd_rule_Telnet_Remote_Root_Login_Restricted()
{
#        log_message "itsscsd_rule_Telnet_Remote_Root_Login_Restricted is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_Telnet_Remote_Root_Login_Restricted  "$AllArguments"
}
itsscsd_rule_Prohibited_SNMP_Community_Names()
{
#        log_message "itsscsd_rule_Prohibited_SNMP_Community_Names is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
        rule_Prohibited_SNMP_Community_Names  "$AllArguments"
}
itsscsd_rule_Password_MIN_Length_and_complexity()
{
#        log_message "itsscsd_rule_Password_MIN_Length_and_complexity is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
		rule_Password_MIN_Length_and_complexity "$AllArguments"
}
itsscsd_rule_Debian_Password_History()
{
#        log_message "itsscsd_rule_Debian_Password_History is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
		rule_Debian_Password_History "$AllArguments"
}
itsscsd_rule_Password_Encryption_Required()
{
#        log_message "itsscsd_rule_Password_Encryption_Required is satisfied by the equivalent ITCS104 remediation. Branching to this ITCS104 remediation function..."
		rule_Password_Encryption_Required "$AllArguments"
}
itsscsd_rule_RC_Command_Group_Permissions()
{
#	log_message "itsscsd_rule_RC_Command_Group_Permissions is satisfied by ITCS104 rule_RC_Command_Group_Permissions remediation. Branching to this ITCS104 remediation function..."
	rule_RC_Command_Group_Permissions "$AllArguments"
}

itsscsd_rule_Password_shadow_specification()
{
#	log_message "itsscsd_rule_Password_shadow_specification is satisfied by ITCS104 rule_Password_shadow_specification remediation. Branching to this ITCS104 remediation function..."
	rule_Password_shadow_specification "$AllArguments"
}

itsscsd_rule_OSR_USR_Restrictions()
{
#	log_message "itsscsd_rule_OSR_USR_Restrictions is satisfied by ITCS104 rule_OSR_USR_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_OSR_USR_Restrictions "$AllArguments"
}

itsscsd_rule_OSR_ETC_Restrictions()
{
#	log_message "itsscsd_rule_OSR_ETC_Restrictions is satisfied by ITCS104 rule_OSR_ETC_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_OSR_ETC_Restrictions "$AllArguments"
}

itsscsd_rule_OSR_Directory_Restrictions()
{
#	log_message "itsscsd_rule_OSR_Directory_Restrictions is satisfied by ITCS104 rule_OSR_Directory_Restrictions remediation. Branching to this ITCS104 remediation function..."
	rule_OSR_Directory_Restrictions "$AllArguments"
}

itsscsd_rule_etc_profile_d_File_Existence()
{
#	log_message "itsscsd_rule_etc_profile_d_File_Existence is satisfied by ITCS104 rule_etc_profile_d_File_Existence remediation. Branching to this ITCS104 remediation function..."
	rule_etc_profile_d_File_Existence "$AllArguments"
}

itsscsd_rule_Login_Success_or_Failure_in_rsyslog_conf()
{
#	log_message "itsscsd_rule_Login_Success_or_Failure_in_rsyslog_conf is satisfied by ITCS104 rule_Login_Success_or_Failure_in_rsyslog_conf remediation. Branching to this ITCS104 remediation function..."
	rule_Login_Success_or_Failure_in_rsyslog_conf "$AllArguments"
}

itsscsd_rule_NIS_Maps_Prohibited()
{
#	log_message "itsscsd_rule_NIS_Maps_Prohibited is satisfied by ITCS104 rule_NIS_Maps_Prohibited remediation. Branching to this ITCS104 remediation function..."
	rule_NIS_Maps_Prohibited "$AllArguments"
}
#========================= INFORMATIONAL RULES for which no automated remediation is done on the system =============================
rule_CRON_files_not_found()
{
	informational_rule "$AllArguments"
}
rule_CRON_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
rule_INETD_XINETD_files_not_found()
{
	informational_rule "$AllArguments"
}
rule_INETD_XINETD_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
rule_INITD_files_not_found()
{
	informational_rule "$AllArguments"
}
rule_INITD_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
rule_INITTAB_files_not_found()
{
	informational_rule "$AllArguments"
}
rule_INITTAB_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
rule_RC_files_not_found()
{
	informational_rule "$AllArguments"
}
rule_RC_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
rule_NNTP_Status()
{
	informational_rule "$AllArguments"
}
rule_SSH_Status()
{
	informational_rule "$AllArguments"
}
rule_Anonymous_FTP_Status()
{
	informational_rule "$AllArguments"
}
rule_FTP_Status()
{
	informational_rule "$AllArguments"
}
rule_NFS_Status()
{
	informational_rule "$AllArguments"
}
rule_NIS_Status()
{
	informational_rule "$AllArguments"
}
rule_LINUX_Platform_Scanned()
{
	informational_rule "$AllArguments"
}
rule_List_of_Clients_Scanned()
{
	informational_rule "$AllArguments"
}
rule_OS_Level_Information()
{
	informational_rule "$AllArguments"
}
rule_TFTP_Status()
{
	informational_rule "$AllArguments"
}
			
#====================================== ITSSCSD INFORMATIONAL RULES for which no automated remediation is done on the system (just log a message) =================================
itsscsd_rule_SSH_Status()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_Anonymous_FTP_Status()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_FTP_Status()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_NFS_Status()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_NIS_Status()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_NNTP_Status()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_SNMP_Status()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_TFTP_Status()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_CRON_files_not_found()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_CRON_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_INETD_XINETD_files_not_found()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_INETD_XINETD_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_INITD_files_not_found()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_INITD_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_INITTAB_files_not_found()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_INITTAB_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_RC_files_not_found()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_RC_skipped_for_checking()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_Business_Use_Notice_contains_WELCOME()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_LINUX_Platform_Scanned()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_List_of_Clients_Scanned_with_Incorrect_Platform()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_OS_Level_Information()
{
	informational_rule "$AllArguments"
}
itsscsd_rule_Policy_Information()
{
	informational_rule "$AllArguments"
}

#============================================================== MAIN BODY =====================================================================

ScriptName="Linux_Remediation_itsscsd"
script_version="4.0.0, Mar 27, 2019"

LogFileName=""

# Set Verbose to 1 if you want messages on the screen in addition to the log files (in test mode)
Verbose=1

# Global variables defining the execution mode of the script and tell if all parameters are mandatory
# in calls to the script, or if we accept to use default hard-coded parameters in case of missing of bad
# parameters (debug/test mode).
# 0 = false
# 1 = true
FailIfMissingParameters=1
FailIfBadParameters=1

# Global storage for functions that need to build a dynamic user ID string
GlobalUserIDstring=''

# Global storage for functions that need to receive a string argument following a variable number of arguments
GlobalStringArgument=''

# Global storage for functions that check if a file name is a redirection to another file
GlobalTargetFileNameAndPath=''

# Get the arguments passed to the script
NumberOfArguments=$#
AllArguments=$*

# Remove any double quotes from arguments
AllArguments=`echo $AllArguments | sed s,\",,g`

# To activate the control logic for enforcing log files maximum size, set the following variable to 1
# <<<<<<< NOTE: the related code has been written but testing/debugging remains to be done >>>>>>>>>
ActivateLogFileSizeControl=0
# Default values for log file retention parameters; max records and max size are applied only if some entries are older then
# the value of LogFileMinDaysRetention
LogFileMaxRecords=5
LogFileMaxSize=65536
# The following determines the minimum number of days we must preserve log records
LogFileMinDaysRetention=2
# Log file entries minimum retention period in seconds (for POSIX time comparisons)
LogFileMinSecondsRetention=`expr $LogFileMinDaysRetention \* 86400`
# Get the current POSIX time in seconds
CurrentTimeSeconds=`date "+%s" 2> /dev/null | awk '{print $1}'`
# The following determines the POSIX timestamp before which log records can be deleted;
# if log record timestamps are younger than that, they cannot be deleted.
LogRecordsMinTimeStampSeconds=`expr $CurrentTimeSeconds - $LogFileMinSecondsRetention`

script_version_message="Remediation script $ScriptName, script version $script_version."

#Groups considered to be default groups for general users, and which may not be granted special privilege
default_group="users"

# Global storage for file ACL
ACL=0

# Commands which have different paths on different Linux platforms:
ReadLinkCommand=`which readlink | awk '{print $1}'`
FindCommand=`which find | awk '{print $1}'`
CutCommand=`which cut | awk '{print $1}'`

# Check that there is at least 1 argument, which must be the rule_ID to identify the function to call
if [ $NumberOfArguments -lt 1 ]
then
	create_log_file "_MissingRule"
    log_message "$script_version_message" 
    log_message "No argument provided to the script. Exiting."
    log_message "-----------------------------------------------------------------------------------------------"
    exit 1
fi

# The script supports 2 types of policies: ITCS104 and ITSSCSD
# Calling convention:
#    Linux_Remediation_itsscsd_itcs104.sh <policy type> rule_name <parameters if applicable>
# Several ITSSCSD rules will branch to ITCS104 rule functions because the remediations to do are the same.
# For instance, itsscsd_rule_Password_MAX_Age_etc_shadow will branch to rule_Password_MAX_Age_shadow of ITCS104 remediations.

IsITCS104=0
IsITSSCSD=0
# Check if legacy way of call
#----------------------------------Changes for Task 165285:Implement remediation scripts with osId and versionId
first_parameter=$1
platform_arguement=$1
second_parameter=" "
first_parameter=`echo "$first_parameter" | awk -F"_" '{print toupper($1)}'`
platform_arguement=`echo "$platform_arguement" | awk -F"_" '{print toupper($2)}'`

echo "$1" | egrep "_\s*$" 1>/dev/null 2>&1
result=$?
if [ $result -eq 0 ]
then
    platform_version=""
else
    platform_version=$1
fi

if [ $NumberOfArguments -gt 1 ]
then
    second_parameter=$2
else
	# Invalid parameters
	create_log_file "_InvalidParameters"
	log_message "$script_version_message" 
	log_message "Parameters received: $AllArguments" 
	log_message "Invalid parameters provided to the script. Exiting."
	log_message "-----------------------------------------------------------------------------------------------"
	exit 1
fi

if [ "$platform_arguement" = "LINUX" -a "$platform_version" = "" ]
then
    if [ "$first_parameter" = "ITCS104" ]
    then
        # rule_ID does not need to be renamed; keep it as rule_x
        IsITCS104=1
        rule_ID=$second_parameter
        # Strip the argument string of the policy type
        AllArguments=`echo $AllArguments | sed s,"$1 ",,g`
    else
        if [ "$first_parameter" = "ITSSCSD" ]
        then
            # rule_ID needs to be renamed to itsscsd_rule_x
            IsITSSCSD=1
            rule_ID="itsscsd_$second_parameter"
            # Strip the argument string of the policy type
            AllArguments=`echo $AllArguments | sed s,"$1 ",,g`
        else
            # Invalid parameters
            create_log_file "_InvalidParameters"
            log_message "$script_version_message" 
            log_message "Parameters received: $AllArguments" 
            log_message "Invalid parameters provided to the script. Exiting."
            log_message "-----------------------------------------------------------------------------------------------"
            exit 1
        fi
    fi
else
	# Invalid parameters
	create_log_file "_InvalidParameters"
	log_message "$script_version_message" 
	log_message "Parameters received: $AllArguments" 
	log_message "Invalid parameters provided to the script. Exiting."
	log_message "-----------------------------------------------------------------------------------------------"
	exit 1
fi
#--------------------------------------------------------------------------------
# Create the log file if it does not exist
create_log_file "_$rule_ID"

# Verify that the script is run as root
COMMAND_USR=`whoami`;
if [ "$COMMAND_USR" != "root" ]; then
	log_message "<<<<< WARNING: the script is not being run as root. Some remediations might fail. >>>>>"
fi

# Determine if we are running on Redhat or SuSE Linux
Platform=`uname`
if [ $Platform != "Linux" ]; then
	log_message "This script is exclusive to Linux platforms. It cannot be run on $Platform. Exiting."
	exit 1
fi

KernelVersion=`uname -r`;

# Determine if we are on Redhat or SuSE
IsRHEL3=0
IsRHEL4=0
IsRHEL5=0
IsRHEL6=0
IsRHEL7=0
RHEL5_or_later=0
RHEL6_or_later=0
SUSE_10_or_later=0
SUSE_11_or_later=0
SUSE_10_or_earlier=0
IsDebian=0
debian_version=0
DEBIAN_5=0
DEBIAN_6=0
DEBIAN_7=0
DEBIAN_8=0
DEBIAN_6_and_later=0
IsUbuntu=0
ubuntu_release=0
UBUNTU_12_04=0
UBUNTU_14_04=0
UBUNTU_16_04=0
UBUNTU_12_and_later=0
UBUNTU_14_and_later=0
release_file="/etc/redhat-release"
ls $release_file 1> /dev/null 2>&1
file_found=$?
if [ $file_found -eq 0 ]
then
	IsRedHat=1
	IsSUSE=0
    if fgrep -q 'release 3' /etc/redhat-release 2> /dev/null
    then
        IsRHEL3=1
    fi
    if fgrep -q 'release 4' /etc/redhat-release 2> /dev/null
    then
        IsRHEL4=1
    fi
    if fgrep -q 'release 5' /etc/redhat-release 2> /dev/null
    then
        IsRHEL5=1
		RHEL5_or_later=1
    fi
    if fgrep -q 'release 6' /etc/redhat-release 2> /dev/null
    then
        IsRHEL6=1
		RHEL6_or_later=1
		RHEL5_or_later=1
    fi
    if fgrep -q 'release 7' /etc/redhat-release 2> /dev/null
    then
        IsRHEL7=1
		RHEL6_or_later=1
		RHEL5_or_later=1
    fi
else
	release_file="/etc/SuSE-release"
	ls $release_file 1> /dev/null 2>&1
	file_found=$?
	if [ $file_found -eq 0 ]
	then
		IsRedHat=0
		IsSUSE=1
		# Determine which release of SuSE this is
		rel_number=`grep "VERSION" /etc/SuSE-release | awk '{print $3}'`
		if [ $rel_number -gt 9 ] ; then
			SUSE_10_or_later=1
		fi
		if [ $rel_number -gt 10 ] ; then
			SUSE_11_or_later=1
		fi
		if [ $rel_number -le 10 ] ; then
			SUSE_10_or_earlier=1
		fi
	else
		# Are we on Debian Linux?
		issue_file="/etc/issue"
		if [ -e $issue_file ]
		then			
			if egrep -i 'Ubuntu' $issue_file 1>/dev/null 2>&1 ; then 
				IsUbuntu=1
				ubuntu_release="$( lsb_release -a 2> /dev/null | egrep '^Release' | awk '{print $2}')"
				if [ "$ubuntu_release" = "12.04" ]; then
					UBUNTU_12_04=1					
				fi
				if [ "$ubuntu_release" = "14.04" ]; then
					UBUNTU_14_04=1					
				fi
				if [ "$ubuntu_release" = "16.04" ]; then
					UBUNTU_16_04=1
				fi
				ubuntu_base="$(lsb_release -a 2> /dev/null | egrep '^Release' | awk '{print $2}'|cut -f1 -d ".")"
				if [ $ubuntu_base -ge 12 ]; then
					UBUNTU_12_and_later=1
				fi
				if [ $ubuntu_base -ge 14 ]; then
					UBUNTU_14_and_later=1
				fi
			elif fgrep -q 'Debian' $issue_file 2> /dev/null
			then
				IsDebian=1
				debian_version=`cat /etc/debian_version | cut -f1 -d'.'`
				if [ "$debian_version" = "5" ]; then
					DEBIAN_5=1
				fi
				if [ "$debian_version" = "6" ]; then
					DEBIAN_6=1					
				fi
				if [ "$debian_version" = "7" ]; then
					DEBIAN_7=1
				fi
				if [ "$debian_version" = "8" ]; then
					DEBIAN_8=1
				fi
				if [ $debian_version -ge 6 ]; then
					DEBIAN_6_and_later=1				
				fi
			else
				log_message "Operating System is different than Debian or Ubuntu."
			fi			
		else
			log_message "Did not find /etc/redhat-release nor /etc/SuSE-release nor /etc/issue to determine if we are on RedHat or SuSE, or Debian Linux; exiting." 
			exit 1
		fi
	fi 
fi

# Log the script version
log_message "$script_version_message"

# Log the RECORD_START <POSIX time stamp> line
log_message "RECORD_START $CurrentTimeSeconds"

RuleResult=1

if [ \( $UBUNTU_12_and_later -eq 1 -a $UBUNTU_14_and_later -eq 0 \) ]
then
        RuleResult=3
        log_message "Remediation is not supported on UBUNTU 12 ..."
        result_message="Unsupported Linux platform"

elif [ $IsRHEL3 -eq 1 -o $IsRHEL4 -eq 1 ]
then
        RuleResult=3
        log_message "Remediation is not supported on RHEL 5 and lower platform ..."
        result_message="Unsupported Linux platform"
else

#=================================================================================
# Call the function that matches the rule_ID passed as parameter to this script
$rule_ID "$AllArguments"
#=================================================================================

fi

if [ $RuleResult -eq 0 ]
then
    result_message="success"
fi
if [ $RuleResult -eq 1 ]
then
    result_message="error"
fi
if [ $RuleResult -eq 2 ]
then
    result_message="this remediation is not applicable to this machine"
fi

message_string="Result code received from function $rule_ID = $RuleResult ($result_message)."
log_message "$message_string"
# Log the RECORD_END line
log_message "RECORD_END"
log_message "-----------------------------------------------------------------------------------------------"

if [ $RuleResult -eq 2 -o $RuleResult -eq 3 ]
then
    RuleResult=0
fi
exit $RuleResult