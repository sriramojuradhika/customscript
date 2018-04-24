 #!/bin/bash
                array="51.141.87.228"
                computername=`hostname`
                for value in $array
                do
                echo $value
                timestamp=`date +"%Y-%m-%d-%H:%M:%S:%MS"`
                echo $timestamp
                
                touch $computername-$value-$timestamp.txt
                #echo $resultfile
                psql -h $value -U postgres -c "SELECT jobtitle from employee where name like '%Fred%';" > /tmp/resultOutputFiles/$computername-$value-$timestamp.txt
                
                #$result > /mnt/pingtestazuremachine1/$resultfile
                
                azcopy --source /tmp/resultOutputFiles/$computername-$value-$timestamp.txt --destination https://radstr.blob.core.windows.net/radcontainer/ $computername-$value-$timestamp.txt --dest-key 	"F7upndOQxFQwBjjhQUH6pvbT2DwgJ/pHdFEG2WENuEFIx8metxpmzJU63erBfKIWSbuUuNMR+HM0NFTeMB1G9Q=="
                
                done
