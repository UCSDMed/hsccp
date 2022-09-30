CREATE TABLE [epic].[placeofservice_location] (
  [placeofservice_location_id] [int] NOT NULL,
  [placeofservice_location_name] [varchar](75) NULL,
  [placeofservice_location_raw] [varchar](75) NULL,
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_placeofservice_location] PRIMARY KEY CLUSTERED ([placeofservice_location_id])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'INDEX - Place of Service: Location', 'SCHEMA', N'epic', 'TABLE', N'placeofservice_location'
GO