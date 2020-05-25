#!/usr/bin/python

import os
import getopt
import sys
import traceback

from datetime import datetime

from jConfigFile import jConfigFile
#from jRsg2Config import jRsg2Config
from Rsg2ImagesRestore import Rsg2ImagesRestore
from Rsg2TablesRestore import Rsg2TablesRestore


HELP_MSG = """
Reads config from external file LangManager.ini
The segment selection tells which segment(s) to use for configuration

usage: RestoreRsg2.py -? nnn -? xxxx -? yyyy  [-h]
	-? nnn
	-? 

	
	-h shows this message
	
	-1 RestoreRsg2.py
	-2 
	-3 
	-4 
	-5 
	
	
	example:
	
	
------------------------------------
ToDo:
  * 
  * 
  * 
  * 
  
"""

#-------------------------------------------------------------------------------
LeaveOut_01 = False
LeaveOut_02 = False
LeaveOut_03 = False
LeaveOut_04 = False
LeaveOut_05 = False

#-------------------------------------------------------------------------------

# ================================================================================
# RestoreRsg2
# ================================================================================

class RestoreRsg2:
    """ config read from file. First segment in file defines the used segment with configuration items """

    def __init__(self,
                 joomlaPath='d:/xampp/htdocs',
                 joomlaName='joomla4x',
                 backupPath='unknown'):

        print("Init RestoreRsg2: ")
        print("joomlaPath: " + joomlaPath)
        print("joomlaName: " + joomlaName)
        print("backupPath: " + backupPath)

        self.__joomlaPath = joomlaPath
        self.__joomlaName = joomlaName
        self.__backupPath = backupPath

        mySqlPath = os.path.join(os.path.dirname(joomlaPath), 'mysql', 'bin')
        self.__mySqlPath = mySqlPath

        # ---------------------------------------------
        # Read variables from config files
        # ---------------------------------------------

        try:
            #--- Joomla configuration parameter ----------------------------

            jConfigPathFileName = os.path.join (self.__joomlaPath, self.__joomlaName, 'configuration.php')
            self.__joomlaCfg = jConfigFile(jConfigPathFileName)



        finally:
            pass

        return

    # --- isWriteEmptyTranslations ---

    @property
    def isWriteEmptyTranslations(self):
        return self.__isWriteEmptyTranslations

    @isWriteEmptyTranslations.setter
    def isWriteEmptyTranslations(self, isWriteEmptyTranslations):
        self.__isWriteEmptyTranslations = isWriteEmptyTranslations

    # --- isOverwriteSrcFiles ---

    @property
    def isOverwriteSrcFiles(self):
        return self.__isOverwriteSrcFiles

    @isOverwriteSrcFiles.setter
    def isOverwriteSrcFiles(self, isOverwriteSrcFiles):
        self.__isOverwriteSrcFiles = isOverwriteSrcFiles

    # --- isDoBackup ---

    @property
    def isDoBackup(self):
        return self.__isDoBackup

    @isDoBackup.setter
    def isDoBackup(self, isDoBackup):
        self.__isDoBackup = isDoBackup

    # --- baseSrcPath ---

    @property
    def baseSrcPath(self):
        return self.__baseSrcPath

    @baseSrcPath.setter
    def baseSrcPath(self, baseSrcPath):
        self.__baseSrcPath = baseSrcPath

    # --- baseTrgPath ---

    @property
    def baseTrgPath(self):
        return self.__baseTrgPath

    @baseTrgPath.setter
    def baseTrgPath(self, baseTrgPath):
        self.__baseTrgPath = baseTrgPath

    # --- comparePaths ---

    @property
    def comparePaths(self):
        return self.__comparePaths

    @comparePaths.setter
    def comparePaths(self, comparePaths):
        self.__comparePaths = comparePaths

    # --------------------------------------------------------------------
    #
    # --------------------------------------------------------------------
    # https://wiki.python.org/moin/ConfigParserExamples

    def doRestore (self, backupPath=''):

        try:
            print('*********************************************************')
            print('doRestore')
            print('backupPath='': ' + backupPath)
            print('---------------------------------------------------------')

            # --- create auto backup path ----------------------------------------

            if (backupPath != ''):
                self.__backupPath = backupPath

            print('backupPath (used): ' + self.__backupPath)

            # --- do restore image filkes ----------------------------

            joomlaPath = os.path.join(self.__joomlaPath, self.__joomlaName)

            rsg2ImagesRestore = Rsg2ImagesRestore(self.__backupPath, joomlaPath)
            rsg2ImagesRestore.doCopy()

            # --- do restore rsg2 tables ----------------------------

            dumpFileName = 'FileNotFound.sql'

            for fileName in os.listdir(self.__backupPath):
                # Rsg2_TablesDump.j3x.sql
                if fileName.startswith("Rsg2_TablesDump"):
                    dumpFileName = os.path.join(self.__backupPath, fileName)
                    break

            rsg2TablesRestore = Rsg2TablesRestore(self.__joomlaCfg .database, self.__joomlaCfg .dbPrefix, self.__joomlaCfg .user,
                                                  self.__joomlaCfg .password, dumpFileName, self.__mySqlPath)

            rsg2TablesRestore.doRestoreDumpTables()

            # ---- ... -----------------------------------------------------------

        except Exception as ex:
            print('!!! Exception: "' + str(ex) + '" !!!')
            print(traceback.format_exc())

        # --------------------------------------------------------------------
        #
        # --------------------------------------------------------------------

        finally:
            print('exit readConfigFile')

        return


##-------------------------------------------------------------------------------

    def dummyFunction(self):

        print('    >>> Enter dummyFunction: ')


        # print ('       XXX: "' + XXX + '"')
        print('    >>> Exit dummyFunction: ')


# ================================================================================
# standard functions
# ================================================================================

def Wait4Key():
    try:
        input("Press enter to continue")
    except SyntaxError:
        pass


def testFile(file):
    exists = os.path.isfile(file)
    if not exists:
        print("Error: File does not exist: " + file)
    return exists


def testDir(directory):
    exists = os.path.isdir(directory)
    if not exists:
        print("Error: Directory does not exist: " + directory)
    return exists


def print_header(start):
    print('------------------------------------------')
    print('Command line:', end='')
    for s in sys.argv:
        print(s, end='')

    print('')
    print('Start time:   ' + start.ctime())
    print('------------------------------------------')


def print_end(start):
    now = datetime.today()
    print('')
    print('End time:               ' + now.ctime())
    difference = now - start
    print('Time of run:            ', difference)


# print ('Time of run in seconds: ', difference.total_seconds())

# ================================================================================
#   main (used from command line)
# ================================================================================

if __name__ == '__main__':

    start = datetime.today()

    optlist, args = getopt.getopt(sys.argv[1:], 'p:n:b:m:12345h')

    joomlaPath = 'd:/xampp/htdocs'
    # joomlaPath = 'e:/xampp/htdocs'
    # joomlaPath = 'f:/xampp/htdocs'
    # joomlaPath = 'e:/xampp_J2xJ3x/htdocs'
    # joomlaPath = 'f:/xampp_J2xJ3x/htdocs'

    #joomlaName = 'joomla4x'
    joomlaName = 'joomla4x_Sim3x'
    #joomlaName = 'joomla3x'
    ##joomlaName = 'joomla3x'
    ##joomlaName = 'joomla3xMyGallery'
    #joomlaName = 'joomla3xNextRelease'
    #joomlaName = 'joomla3xRelease'
    #joomlaName = 'joomla4x'
    #joomlaName = 'joomla4xfrom3x'
    #joomlaName = 'joomla4xInstall'

    backupPath = '..\..\..\RSG2_Backup\\joomla3x.20200430_171320'

    for i, j in optlist:
        if i == "-p":
            joomlaPath = j
        if i == "-n":
            joomlaName = j
        if i == "-b":
            backupPath = j

        if i == "-h":
            print(HELP_MSG)
            sys.exit(0)

        if i == "-1":
            LeaveOut_01 = True
            print("LeaveOut_01")
        if i == "-2":
            LeaveOut_02 = True
            print("LeaveOut__02")
        if i == "-3":
            LeaveOut_03 = True
            print("LeaveOut__03")
        if i == "-4":
            LeaveOut_04 = True
            print("LeaveOut__04")
        if i == "-5":
            LeaveOut_05 = True
            print("LeaveOut__05")

    print_header(start)

    RestoreRsg2 = RestoreRsg2(joomlaPath, joomlaName, backupPath)
    RestoreRsg2.doRestore ()

    print_end(start)

