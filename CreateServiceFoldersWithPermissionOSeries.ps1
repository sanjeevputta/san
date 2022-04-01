try

{
    
    $Principal = "Local Service"
    $Right = "Modify"
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule ($Principal, $Right, "ContainerInherit, ObjectInherit", "None", "Allow")
    
    #Adjustment File
    $DirectoryPath = "D:\VTMS\Adjustment File\Temp"

    if((Test-Path $DirectoryPath) -eq 0)
    {
        Write-Output "Creating directory at $DirectoryPath ..."
        mkdir $DirectoryPath;
    }
    else
    {
        Write-Output "Directory $DirectoryPath already exist..."
    }
    
    $acl = Get-Acl $DirectoryPath
     
    #Add this access rule to the ACL
    $acl.SetAccessRule($rule)
      
    #Write the changes to the object
    Set-Acl $DirectoryPath $acl
    
    Write-Output "'$Right' permission added to '$DirectoryPath' for account '$Principal'"
    
    #Rate File
    $DirectoryPath = "D:\VTMS\Rate File\Temp"
    
    if((Test-Path $DirectoryPath) -eq 0)
    {
        Write-Output "Creating directory at $DirectoryPath ..."
        mkdir $DirectoryPath;
    }
    else
    {
        Write-Output "Directory $DirectoryPath already exist..."
    }
    
    $acl = Get-Acl $DirectoryPath
     
    #Add this access rule to the ACL
    $acl.SetAccessRule($rule)
      
    #Write the changes to the object
    Set-Acl $DirectoryPath $acl
    
    Write-Output "'$Right' permission added to '$DirectoryPath' for account '$Principal'"    

	exit $LastExitCode
}

catch

{
	Write-Output $Error[0].Exception
	exit 1
}
