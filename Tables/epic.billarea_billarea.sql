CREATE TABLE [epic].[billarea_billarea] (
  [billarea_financialdivision_id] [int] NOT NULL DEFAULT (-1),
  [billarea_financialsubdivision_id] [int] NOT NULL DEFAULT (-1),
  [billarea_billarea_id] [int] NOT NULL,
  [billarea_billarea_name] [varchar](55) NULL,
  [billarea_billarea_raw] [varchar](55) NULL,
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_billarea_billarea] PRIMARY KEY CLUSTERED ([billarea_billarea_id])
)
ON [PRIMARY]
GO

ALTER TABLE [epic].[billarea_billarea]
  ADD FOREIGN KEY ([billarea_financialdivision_id]) REFERENCES [epic].[billarea_financialdivision] ([billarea_financialdivision_id])
GO

ALTER TABLE [epic].[billarea_billarea]
  ADD FOREIGN KEY ([billarea_financialsubdivision_id]) REFERENCES [epic].[billarea_financialsubdivision] ([billarea_financialsubdivision_id])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'INDEX - Bill Area: Bill Area', 'SCHEMA', N'epic', 'TABLE', N'billarea_billarea'
GO