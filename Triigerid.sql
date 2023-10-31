---------------------------- 92. DDL Trigger SQL serveris
CREATE TRIGGER trMyFirstTrigger
ON DATABASE
FOR CREATE_TABLE  
AS 
BEGIN
	
	PRINT'New table created'
END


CREATE TABLE test(id int)


ALTER TRIGGER trMyFirstTrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS 
BEGIN
	PRINT'A table has just created, modified or deleted'
END


ALTER TRIGGER trMyFirstTrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS 
BEGIN
	ROLLBACK
	PRINT'You cannot create, alter or drop a table'
END


CREATE TRIGGER trRenameTable
ON DATABASE 
FOR RENAME
AS
BEGIN
	Print'You just renamed something'
END


------------------------------- 93. Server-Scoped DDL triggerid


CREATE TRIGGER tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	Rollback 
	Print'You cannot create, alter or drop a table in the current database'
end



CREATE TRIGGER tr_ServerScopeTrigger
ON ALL Server
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	Rollback 
	Print'You cannot create, alter or drop a table in any database on the server'
end


DISABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER


ENABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER


DROP TRIGGER tr_ServerScopeTrigger ON ALL SERVER

------------------------------------ 94. SQL serveri trigeri täitmise järjekord


CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE
AS
BEGIN
			print'Database Scope Trigger';
END 
GO


------------------------------------- 96. Logon trigger SQL serveris
  
  CREATE TRIGGER tr_LogonAuditTriggers
ON ALL SERVER
FOR LOGON
AS 
BEGIN
	DECLARE @LoginName NVARCHAR(100)
	SET @LoginName = ORIGINAL_LOGIN()
	IF (SELECT COUNT(*) FROM sys.dm_exec_sessions
		WHERE is_user_process=1
		AND original_login_name=@LoginName)>3
	BEGIN
		print'Fourth connection of ' +  @LoginName + ' blocked'
		ROLLBACK
	END
END



Execute sp_readerrorlog
