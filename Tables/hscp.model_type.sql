CREATE TABLE [hscp].[model_type] (
  [hsccp_model_id] [int] IDENTITY,
  [hsccp_model_description] [varchar](max) NULL,
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_hscp_modeltype] PRIMARY KEY CLUSTERED ([hsccp_model_id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'HSCCP Model Types', 'SCHEMA', N'hscp', 'TABLE', N'model_type'
GO