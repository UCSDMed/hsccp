CREATE TABLE [hscp].[rvudata] (
  [rvudata_id] [int] IDENTITY,
  [wrvu] [decimal](19, 4) NULL DEFAULT (0.00),
  [hsccp_model_id] [int] NOT NULL DEFAULT (1),
  [rate_care] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [rate_assessment_dean] [decimal](6, 4) NOT NULL DEFAULT (0.00),
  [rate_assessment_department] [decimal](6, 4) NOT NULL DEFAULT (0.00),
  [rate_assessment_division] [decimal](6, 4) NOT NULL DEFAULT (0.00),
  [rate_withhold_earnedincome] [decimal](6, 4) NOT NULL DEFAULT (0.00),
  [rate_withhold_productivity] [decimal](6, 4) NOT NULL DEFAULT (0.00),
  [rate_withhold_quality] [decimal](6, 4) NOT NULL DEFAULT (0.00),
  [rate_withhold_other] [decimal](6, 4) NOT NULL DEFAULT (0.00),
  [amount_care_gross] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [amount_assessment_dean] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [amount_assessment_department] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [amount_assessment_division] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [amount_withhold_earnedincome] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [amount_withhold_productivity] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [amount_withhold_quality] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [amount_withhold_other] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [amount_care_net] [decimal](19, 4) NOT NULL DEFAULT (0.00),
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_rvudata] PRIMARY KEY CLUSTERED ([rvudata_id])
)
ON [PRIMARY]
GO

ALTER TABLE [hscp].[rvudata]
  ADD FOREIGN KEY ([hsccp_model_id]) REFERENCES [hscp].[model_type] ([hsccp_model_id])
GO

ALTER TABLE [hscp].[rvudata]
  ADD FOREIGN KEY ([rvudata_id]) REFERENCES [epic].[rvudata] ([rvudata_id])
GO