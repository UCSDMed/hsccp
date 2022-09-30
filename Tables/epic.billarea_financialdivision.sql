CREATE TABLE [epic].[billarea_financialdivision] (
  [billarea_financialdivision_id] [int] NOT NULL,
  [billarea_financialdivision_name] [varchar](55) NULL,
  [billarea_financialdivision_raw] [varchar](55) NULL,
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_billarea_financialdivision] PRIMARY KEY CLUSTERED ([billarea_financialdivision_id])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'INDEX - Bill Area: Financial Division', 'SCHEMA', N'epic', 'TABLE', N'billarea_financialdivision'
GO