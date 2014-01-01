Perl Security Utility
======================

Updates
12/30/2013 
01/01/2014

Introduction
=============

This utility is used to automatically produce MaxL commands that can be run on any server to replicate security settings from one Essbase Server to another. It is intended to be used on a Windows environment. However, the concept can easily be replicated for a Unix server.

Table of Contents
=================

01. MaxL Commands for the Current Server
02. The Batch File
03. Auto.mxl
04. Perl Scripts
05. Notes on Usage



01. MaxL Commands for the Current Server
=========================================
There are five MaxL commands that provide an administrator with information about the security settings for an Essbase Server. They are:

1. display user all;
2. display group all;
3. display user in group all;
4. display privilege user all;
5. display privilege group all;

There are other commands that can be used to get information about an Essbase Server, but these are used for the following purposes, respectively:

1. Show all the users for the current server, from both Native Directory and enterprise directories
2. Show all the groups for the current server, from both Native Directory and enterprise directories
3. Show all the members of groups on the current server.
4. Show the security assignments (provisioning) for each user on the current server.
5. Show the security assignments for each group on the current server.


02. The Batch File
===================

The batch file is run in Windows and executes three processes:

1. Executes the MaxL file Auto.mxl that produces 5 text files
2. Creates an array of filenames
3. Transforms the text files from step 1 into MaxL commands for future execution


03. Auto.mxl
=============

This MaxL script executes the five MaxL commands mentioned in Section 01 of this readme and writes the results to five separate text files. They are:

1. Users.txt
2. Groups.txt
3. UserGroups.txt
4. UserPriv.txt
5. GroupPriv.txt

The script includes generic username, password, and server information that needs to be changed by a user to a valid set of credentials for the Essbase server on which it is intended to be used. It is strongly recommended that this script be encrypted using the encryption method described in the Essbase Technical Reference:

http://docs.oracle.com/cd/E12825_01/epm.111/esb_techref/frameset.htm?maxl_invoke_encrypt.htm

04. Perl Scripts
=================

There are five Perl scripts that transform the text files listed in Section 04 of this readme into MaxL files. These scripts make use of Perl RegEx to perform the transformations. There are five scripts in all:

1. Users.pl
2. Groups.pl
3. UserGroups.pl
4. UserPriv.pl
5. GroupPriv.pl

These scripts take into account the naming restrictions of Essbase Users, Groups, Applications, and Databases.


05. Notes on Usage
===================

This project currently produces MaxL commands for all applications on the Essbase server that are subject to the commands described in Section 01 of this readme. This includes Planning databases for example. A future update will include a way to restrict the production of MaxL commands for only Essbase applications.

The produced MaxL scripts do not include any login credentials for any Essbase server by default. This will have to be provided by the user in order for the commands to be executed. 

While in Shared Services Security Mode, if an application has multiple databases, assigning provisioning for one of the databases implicitly assigns the same provisioning for all databases in that application.

