CREATE TABLE [epic].[provider_primaryspecialty] (
  [provider_primaryspecialty_id] [int] IDENTITY,
  [provider_primaryspecialty_name] [varchar](55) NULL,
  [provider_primaryspecialty_raw] [varchar](55) NULL,
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_provider_primaryspecialty] PRIMARY KEY CLUSTERED ([provider_primaryspecialty_id])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'INDEX - Provider: Primary Specialty', 'SCHEMA', N'epic', 'TABLE', N'provider_primaryspecialty'
GO