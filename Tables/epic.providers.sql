CREATE TABLE [epic].[providers] (
  [provider_id] [varchar](15) NOT NULL,
  [provider_name] [varchar](55) NULL,
  [provider_raw] [varchar](55) NULL,
  [provider_providertype_id] [int] NULL,
  [provider_primaryspecialty_id] [int] NOT NULL DEFAULT (-1),
  [provider_resident] [bit] NOT NULL DEFAULT (0),
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_provider] PRIMARY KEY CLUSTERED ([provider_id])
)
ON [PRIMARY]
GO

ALTER TABLE [epic].[providers]
  ADD FOREIGN KEY ([provider_providertype_id]) REFERENCES [epic].[provider_providertype] ([provider_providertype_id])
GO

ALTER TABLE [epic].[providers]
  ADD FOREIGN KEY ([provider_primaryspecialty_id]) REFERENCES [epic].[provider_primaryspecialty] ([provider_primaryspecialty_id])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'Providers', 'SCHEMA', N'epic', 'TABLE', N'providers'
GO