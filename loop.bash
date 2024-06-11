#!/bin/bash

# Array of processor counts you want to test
processor_counts=(1 2 4 8 16)

# Loop through each processor count
for count in "${processor_counts[@]}"
do
  # Create a temporary submit file with the current processor count
  submit_file="submit_${count}.bash"
  cp submit.bash $submit_file
  
  # Replace the number of tasks and nodes in the temporary submit file
  sed -i "s/^#SBATCH -n [0-9]\+/#SBATCH -n $count/" $submit_file
  sed -i "s/^#SBATCH -N [0-9]\+/#SBATCH -N $count/" $submit_file
  
  # Submit the job using the temporary submit file
  sbatch $submit_file
  
  # Optionally, you can delete the temporary submit file after submission
  # rm $submit_file
done

