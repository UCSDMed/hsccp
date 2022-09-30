CREATE TABLE [epic].[placeofservice_servicearea] (
  [placeofservice_servicearea_id] [int] NOT NULL,
  [placeofservice_servicearea_name] [varchar](55) NULL,
  [placeofservice_servicearea_raw] [varchar](55) NULL,
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_placeofservice_servicearea] PRIMARY KEY CLUSTERED ([placeofservice_servicearea_id])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'INDEX - Place of Service: Service Area', 'SCHEMA', N'epic', 'TABLE', N'placeofservice_servicearea'
GO