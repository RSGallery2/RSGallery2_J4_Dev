
# '.buildPHP' folder:

Batches to call PHP code to generate zip of project (folder) RSGallery2 and other RSGallery2* branches
Resulting zip is created in parallel folder **.packages**

Uses 'buildExtension' php project in parallel folder to execute the tasks.  It can create joomla extensions like components, modules, plugins and (and packages). The entry point to the build task is src\buildExtensionCmd.php there

In this folder 'build*.bat' are the base batch scripts which tell the execution code what to to do by commandline options.
It uses a configuration file (*.tsk) to assign all the needed variables

For example 
```"%ExePath%php.exe" buildExtensionCmd.php -f ../../joomGallery_fith_dev/.buildPHP/build.tsk %OptionFile%```

The batches accept option -s, -s, -f, -r, -m which changes the version in the manifest file.

	-d develop     No change in Version
	-s step        Change version part 0.0.0.x
	-f build_fix   Change version part 0.0.x´0
	-r release     Change version part 0.x.0.0
	-m major       Change version part x.0.0.0

In the task file are options like
```/isDoNotUpdateCreationDate=true```      

Above flag is needed when the the date of creation should not be changed which is usually the case

### requirement

Path to php.exe is given inside *.bat batch or must be in the standard path

## Resulting zip filename

Following flag defines a prefix inside the resulting filename. A prefix can be omitted.
```/prefixZipName=raw```

Resulting zip name follows schema: 
```<projectname\>.<prefix>.<version>_<date>.zip```
example: ```joomgallery.raw.4.0.1_20250429.zip```

