CREATE TABLE [epic].[provider_providertype] (
  [provider_providertype_id] [int] IDENTITY,
  [provider_providertype_name] [varchar](55) NULL,
  [provider_providertype_raw] [varchar](55) NULL,
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_provider_providertype] PRIMARY KEY CLUSTERED ([provider_providertype_id])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'INDEX - Provider: Provider Type', 'SCHEMA', N'epic', 'TABLE', N'provider_providertype'
GO