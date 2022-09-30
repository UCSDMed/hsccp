CREATE TABLE [epic].[placeofservice_type] (
  [placeofservice_type_id] [int] NOT NULL,
  [placeofservice_type_name] [varchar](55) NULL,
  [placeofservice_type_raw] [varchar](55) NULL,
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_placeofservice_type] PRIMARY KEY CLUSTERED ([placeofservice_type_id])
)
ON [PRIMARY]
GO